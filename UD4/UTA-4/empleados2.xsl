<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />
    <xsl:template match="/">
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
                <xsl:apply-templates select="//empleado">
                <xsl:sort select="salario" order="descending" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="empleado">
        <p>
        <strong>Nombre: </strong><xsl:value-of select="nombre" /><br />
        <strong>Salario: </strong><xsl:value-of select="salario" />
        </p>
    </xsl:template>
</xsl:stylesheet>
