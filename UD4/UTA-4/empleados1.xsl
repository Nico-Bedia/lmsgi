<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
    <xsl:template match="/">
        <html lang="es">
        <head>
            <title>Lista de Empleados</title>
            <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        margin: 0;
                        padding: 0;
                    }
 
                    h1 {
                        text-align: center;
                        color: #ffffff;
                        background-color: #00fff2;
                        padding: 20px;
                        margin-bottom: 20px;
                        font-size: 2em;
                        border-radius: 8px;
                    }
 
                    ol {
                        list-style-type: decimal;
                        margin: 0 auto;
                        padding: 0;
                        width: 60%;
                        background-color: #fff;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
 
                    li {
                        padding: 15px;
                        border-bottom: 1px solid #ddd;
                        display: flex;
                        justify-content: space-between;
                    }
 
                    li:last-child {
                        border-bottom: none;
                    }
 
                    p {
                        font-size: 1.2em;
                        margin: 0;
                        color: #555;
                    }
 
                    p > xsl\\:value-of {
                        font-weight: bold;
                    }
 
 
                    p::after {
                        content: " €";
                        font-weight: bold;
                        color: #4CAF50;
                    }
            </style>
        </head>
             <body>
                <h1>Lista de empleados</h1>
                <ul>
 
                    <!-- Recorremos los nodos <alumno> del fichero xml -->
                    <xsl:for-each select="//empleado">
                        <!-- Ordenamos por el subelemento salario -->
                        <xsl:sort select="salario" data-type="number" order="descending" />
                        <li>
                            <!-- Seleccionamos los subelementos que pretendemos mostrar -->
                            <p>
                                <strong>Nombre: </strong><xsl:value-of select="nombre" /><br />
                                <strong>Salario: </strong><xsl:value-of select="salario" />
                            </p>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>    
</xsl:stylesheet>