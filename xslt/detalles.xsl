<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="juego"/>

    <xsl:template match="/">
        <xsl:for-each select="catalogoVideojuegos/videojuego[titulo = $juego]">
            <div class="detalle-videojuego">
                <h2><xsl:value-of select="titulo"/></h2>
                <p><strong>Año de Lanzamiento:</strong> <xsl:value-of select="anioLanzamiento"/></p>
                <p><strong>Plataforma:</strong> <xsl:value-of select="plataforma"/></p>
                <p><strong>Género:</strong> <xsl:value-of select="genero"/></p>
                <p><strong>Resumen:</strong> <xsl:value-of select="resumen"/></p>
                <p><strong>Presupuesto:</strong> 💰 <xsl:value-of select="presupuesto"/></p>
                <p><strong>Ingresos:</strong> 📈 <xsl:value-of select="ingresos"/></p>
                
                <h3>Personajes:</h3>
                <ul>
                    <xsl:for-each select="personajes/personaje">
                        <li>
                            <xsl:choose>
                                <xsl:when test="@papel = 'Protagonista'">
                                    <strong class="protagonista">⭐ <xsl:value-of select="@nombre"/></strong> - <xsl:value-of select="@edad"/> años
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@nombre"/> - <xsl:value-of select="@edad"/> años
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
