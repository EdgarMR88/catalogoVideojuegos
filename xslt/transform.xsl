<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="desarrolladoresUnicos" match="desarrollador" use="."/>

    <xsl:template match="/">
        <html>
        <body>
            <h1 class="encabezado">🎮 Catálogo de Videojuegos 🎮</h1>

            <!-- Ejercicio 1: Tabla de Videojuegos -->
            <table border="1">
                <tr>
                    <th>Título</th>
                    <th>Año de Lanzamiento</th>
                    <th>Plataforma</th>
                </tr>
                
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <tr>
                        <td><xsl:value-of select="titulo"/></td>
                        <td><xsl:value-of select="anioLanzamiento"/></td>
                        <td><xsl:value-of select="plataforma"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <br/>
            <hr/>

            <!-- Ejercicio 2: Lista de Títulos y Resúmenes -->
            <div class="resumenes">
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <div class="resumen-item">
                        <h2><xsl:value-of select="titulo"/></h2>
                        <p><xsl:value-of select="resumen"/></p>
                    </div>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 3: Comparativa Ingresos vs Presupuesto -->
            <table border="1" class="comparativa">
                <tr>
                    <th>Título</th>
                    <th>Presupuesto</th>
                    <th>Ingresos</th>
                </tr>
                
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <tr>
                        <td><xsl:value-of select="titulo"/></td>
                        <td><xsl:value-of select="presupuesto"/></td>
                        <td>
                            <xsl:attribute name="class">
                                <xsl:choose>
                                    <xsl:when test="ingresos &gt; presupuesto">rentable</xsl:when>
                                    <xsl:otherwise>no-rentable</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:value-of select="ingresos"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>

            <br/>
            <hr/>

            <!-- Ejercicio 4: Lista Única de Desarrolladores -->
            <div class="desarrolladores">
                <h2>Lista de Desarrolladores</h2>
                <ol>
                    <xsl:for-each select="catalogoVideojuegos/videojuego/desarrolladores/desarrollador[
                        generate-id() = generate-id(key('desarrolladoresUnicos', .)[1])
                    ]">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ol>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 5: Críticas en Tarjetas -->
            <div class="criticas">
                <h2>Críticas de Videojuegos</h2>
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <xsl:variable name="tituloJuego" select="titulo"/>
                    <xsl:for-each select="criticas/critica">
                        <div class="critica-card">
                            <h3><xsl:value-of select="$tituloJuego"/></h3>
                            <p><strong>Crítico:</strong> <xsl:value-of select="nombre"/></p>
                            <p><strong>Puntuación:</strong> <xsl:value-of select="puntuacion"/></p>
                            <p><strong>Comentario:</strong> <xsl:value-of select="comentario"/></p>
                        </div>
                    </xsl:for-each>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 6: Cartas de Videojuegos en Cuadrícula -->
            <div class="cartas-grid">
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <div class="carta">
                        <h2><xsl:value-of select="titulo"/></h2>
                        <p><strong>Género:</strong> <xsl:value-of select="genero"/></p>
                        <p><strong>Plataforma:</strong> <xsl:value-of select="plataforma"/></p>
                        <p><strong>Resumen:</strong> <xsl:value-of select="resumen"/></p>
                    </div>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>

           <!-- Ejercicio 7: Listado de Personajes -->
            <div class="personajes">
                <h2>Personajes por Videojuego</h2>
                <div class="personajes-grid">
                    <xsl:for-each select="catalogoVideojuegos/videojuego">
                        <div class="personaje-card">
                            <h3><xsl:value-of select="titulo"/></h3>
                            <ul>
                                <xsl:for-each select="personajes/personaje">
                                    <li>
                                        <strong><xsl:value-of select="@nombre"/></strong> - 
                                        Edad: <xsl:value-of select="@edad"/> - 
                                        Papel: <xsl:value-of select="@papel"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </xsl:for-each>
                </div>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 8: Críticas con Colores según la Puntuación -->
            <div class="criticas-puntuadas">
                <h2>Críticas de Videojuegos (Resaltadas por Puntuación)</h2>
                <div class="criticas-grid">
                    <xsl:for-each select="catalogoVideojuegos/videojuego">
                        <xsl:variable name="tituloJuego" select="titulo"/>
                        <xsl:for-each select="criticas/critica">
                            
                            <!-- Tarjeta de Crítica -->
                            <xsl:choose>
                                <!-- Excelente -->
                                <xsl:when test="number(puntuacion) = 10">
                                    <div class="critica-card excelente">
                                        <h3><xsl:value-of select="$tituloJuego"/></h3>
                                        <p><strong>Crítico:</strong> <xsl:value-of select="nombre"/></p>
                                        <p><strong>Puntuación:</strong> <xsl:value-of select="puntuacion"/></p>
                                        <p><strong>Comentario:</strong> <xsl:value-of select="comentario"/></p>
                                    </div>
                                </xsl:when>
                                
                                <!-- Buena -->
                                <xsl:when test="number(puntuacion) &gt;= 7 and number(puntuacion) &lt; 10">
                                    <div class="critica-card buena">
                                        <h3><xsl:value-of select="$tituloJuego"/></h3>
                                        <p><strong>Crítico:</strong> <xsl:value-of select="nombre"/></p>
                                        <p><strong>Puntuación:</strong> <xsl:value-of select="puntuacion"/></p>
                                        <p><strong>Comentario:</strong> <xsl:value-of select="comentario"/></p>
                                    </div>
                                </xsl:when>
                                
                                <!-- Mala -->
                                <xsl:otherwise>
                                    <div class="critica-card mala">
                                        <h3><xsl:value-of select="$tituloJuego"/></h3>
                                        <p><strong>Crítico:</strong> <xsl:value-of select="nombre"/></p>
                                        <p><strong>Puntuación:</strong> <xsl:value-of select="puntuacion"/></p>
                                        <p><strong>Comentario:</strong> <xsl:value-of select="comentario"/></p>
                                    </div>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </xsl:for-each>
                    </xsl:for-each>
                </div>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 9: Resumen al inicio de la página -->
            <div class="resumen-general">
                <h2>Resumen General del Catálogo</h2>
                
                <!-- Número total de videojuegos -->
                <p><strong>Total de Videojuegos:</strong> 
                    <xsl:value-of select="count(catalogoVideojuegos/videojuego)"/>
                </p>
                
                <!-- Número total de plataformas distintas -->
                <p><strong>Plataformas Diferentes:</strong>
                    <xsl:variable name="uniquePlatforms">
                        <xsl:for-each select="catalogoVideojuegos/videojuego/plataforma">
                            <xsl:if test="not(preceding::plataforma = .)">
                                <xsl:value-of select="."/>
                                <xsl:if test="position() != last()">, </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:value-of select="count(
                        catalogoVideojuegos/videojuego/plataforma[not(preceding::plataforma = .)]
                    )"/>
                </p>

                <!-- Año más antiguo -->
                <p><strong>Año Más Antiguo:</strong>
                    <xsl:for-each select="catalogoVideojuegos/videojuego">
                        <xsl:sort select="anioLanzamiento" data-type="number" order="ascending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="anioLanzamiento"/>
                        </xsl:if>
                    </xsl:for-each>
                </p>
            </div>


            <br/>
            <hr/>

            <!-- Ejercicio 10: Agrupar Videojuegos por Año de Lanzamiento -->
            <div class="secciones-por-ano">
                <h2>Videojuegos por Año de Lanzamiento</h2>
                
                <!-- Ordenamos los videojuegos por año de lanzamiento -->
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <xsl:sort select="anioLanzamiento" data-type="number" order="ascending"/>
                    
                    <!-- Mostramos un encabezado si es el primer juego de un nuevo año -->
                    <xsl:if test="not(preceding-sibling::videojuego[anioLanzamiento = current()/anioLanzamiento])">
                        <div class="ano-seccion">
                            <h3><xsl:value-of select="anioLanzamiento"/></h3>
                        </div>
                    </xsl:if>

                    <!-- Mostrar cada videojuego bajo su año -->
                    <div class="videojuego-item">
                        <h4><xsl:value-of select="titulo"/></h4>
                        <p><strong>Género:</strong> <xsl:value-of select="genero"/></p>
                        <p><strong>Plataforma:</strong> <xsl:value-of select="plataforma"/></p>
                        <p><strong>Resumen:</strong> <xsl:value-of select="resumen"/></p>
                    </div>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 11: Gráfico Mejorado de Ingresos vs Presupuesto -->
            <div class="grafico-ingresos">
                <h2>Comparación de Ingresos vs Presupuesto</h2>

                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <xsl:variable name="presupuestoEscala" select="(presupuesto div ingresos) * 40"/> <!-- Presupuesto más corto -->
                    <xsl:variable name="ingresosEscala" select="(ingresos div presupuesto) * 60"/>  <!-- Ingresos menos exagerado -->

                    <div class="grafico-item">
                        <p><strong><xsl:value-of select="titulo"/></strong></p>

                        <div class="barra-container">
                            <!-- Presupuesto -->
                            <div class="barra presupuesto">
                                <xsl:attribute name="style">
                                    width: <xsl:choose>
                                                <xsl:when test="$presupuestoEscala &lt; 20">20</xsl:when>  <!-- Mínimo 20% -->
                                                <xsl:otherwise><xsl:value-of select="$presupuestoEscala"/></xsl:otherwise>
                                            </xsl:choose>%;
                                </xsl:attribute>
                                <span>💰 <xsl:value-of select="presupuesto"/></span>
                            </div>

                            <!-- Ingresos -->
                            <div class="barra ingresos">
                                <xsl:attribute name="style">
                                    width: <xsl:choose>
                                                <xsl:when test="$ingresosEscala &lt; 25">25</xsl:when>  <!-- Mínimo 25% -->
                                                <xsl:otherwise><xsl:value-of select="$ingresosEscala"/></xsl:otherwise>
                                            </xsl:choose>%;
                                </xsl:attribute>
                                <span>📈 <xsl:value-of select="ingresos"/></span>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>



            <!-- Ejercicio 12: Tabla de Videojuegos Ordenados por Puntuación Media -->
            <div class="tabla-puntuaciones">
                <h2>Ranking de Videojuegos por Puntuación Media</h2>

                <table border="1">
                    <tr>
                        <th>Posición</th>
                        <th>Título</th>
                        <th>Puntuación Media</th>
                    </tr>

                    <!-- Ordenamos los videojuegos por puntuación media -->
                    <xsl:for-each select="catalogoVideojuegos/videojuego">
                        <xsl:sort select="sum(criticas/critica/puntuacion) div count(criticas/critica)" data-type="number" order="descending"/>
                        <xsl:variable name="puntuacionMedia" select="sum(criticas/critica/puntuacion) div count(criticas/critica)"/>

                        <tr>
                            <td><xsl:value-of select="position()"/></td>
                            <td><xsl:value-of select="titulo"/></td>
                            <td><xsl:value-of select="format-number($puntuacionMedia, '0.0')"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 13: Videojuego Más Exitoso -->
            <div class="top-videojuego">
                <h2>🎖️ Top Videojuego Más Exitoso 🎖️</h2>

                <!-- Buscar el videojuego con mayor ingresos -->
                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <xsl:sort select="ingresos" data-type="number" order="descending"/>
                    <xsl:if test="position() = 1">
                        <div class="top-videojuego-card">
                            <h3><xsl:value-of select="titulo"/></h3>
                            <p><strong>Año:</strong> <xsl:value-of select="anioLanzamiento"/></p>
                            <p><strong>Género:</strong> <xsl:value-of select="genero"/></p>
                            <p><strong>Plataforma:</strong> <xsl:value-of select="plataforma"/></p>
                            <p><strong>Ingresos:</strong> 💰 <xsl:value-of select="format-number(ingresos, '#,###')"/></p>
                            <p><strong>Resumen:</strong> <xsl:value-of select="resumen"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 14: Lista de Personajes por Videojuego (Resaltando al Protagonista) -->
            <div class="lista-personajes">
                <h2>🎭 Personajes por Videojuego 🎭</h2>

                <xsl:for-each select="catalogoVideojuegos/videojuego">
                    <div class="videojuego-personajes">
                        <h3><xsl:value-of select="titulo"/></h3>
                        <ul>
                            <xsl:for-each select="personajes/personaje">
                                <li>
                                    <xsl:choose>
                                        <!-- Si el personaje es el protagonista, lo resaltamos -->
                                        <xsl:when test="@papel = 'Protagonista'">
                                            <strong class="protagonista">
                                                ⭐ <xsl:value-of select="@nombre"/>
                                            </strong> - <xsl:value-of select="@edad"/> años
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
            </div>

            <br/>
            <hr/>

            <!-- Ejercicio 15: Videojuegos con enlaces a detalles -->
            <!-- Enlaces corregidos con encodeURIComponent -->
            <div class="lista-videojuegos">
                <h2>🎮 Catálogo de Videojuegos 🎮</h2>

                <div class="grid-videojuegos">
                    <xsl:for-each select="catalogoVideojuegos/videojuego">
                        <div class="videojuego-card">
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:text>detalles.html?juego=</xsl:text>
                                    <xsl:value-of select="normalize-space(translate(titulo, ' ', '_'))"/>
                                </xsl:attribute>
                                <h3><xsl:value-of select="titulo"/></h3>
                            </a>
                            <p><strong>Año:</strong> <xsl:value-of select="anioLanzamiento"/></p>
                            <p><strong>Plataforma:</strong> <xsl:value-of select="plataforma"/></p>
                        </div>
                    </xsl:for-each>
                </div>
            </div>

            <br/>
            <hr/>
            
            <!-- Ejercicio 16: Eliminamos la barra de búsqueda de aquí -->
            <!-- Ya está en index.html, así que no hace falta incluirla en transform.xsl -->



        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
