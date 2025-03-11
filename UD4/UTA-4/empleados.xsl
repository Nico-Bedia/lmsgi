<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Ventas por Categoría</title>
      </head>
      <body>
        <h2>Ventas por Categoría</h2>
        <table border="1" cellpadding="5" cellspacing="0">
          <tr>
            <th>Categoría</th>
            <th>Venta</th>
          </tr>
          <xsl:for-each select="ventas/categoria">
            <tr>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="venta"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
