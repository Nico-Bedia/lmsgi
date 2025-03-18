<?xml version="1.0" encoding="UTF-8"?> 

<!-- definimos el espacio de nombres de XSLT -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!-- Definimos la salida como HTML -->    
    <xsl:output method="html" indent="yes" />
    
    <!-- Definimos la plantilla principal de la transformación -->
    <xsl:template match="/">
        <!-- Construimos el HTML -->
        <html lang="es">
            <head>
				<meta charset="UTF-8" />
                <title>Lista empleados</title>
                <style>
                    h1 {
                        color: #3a3a;
                        font-family: Verdana, sans-serif;
                    }
                    p {
                        color: #666;
                        font-family: Arial, sans-serif;
                    }
                </style>
			</head>
            <body>
                <h1>Lista de Empleados</h1>
                <!-- Aplicamos las plantillas a los nodos empleado -->
                <xsl:apply-templates select="//empleado">
                <xsl:sort select="salario" order="descending" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <!-- Definimos la plantilla para los nodos empleado -->
    <xsl:template match="empleado">
        <p>
        <strong>Nombre: </strong><xsl:value-of select="nombre" /><br />
        <strong>Salario: </strong><xsl:value-of select="salario" />
        </p>
    </xsl:template>
</xsl:stylesheet>
