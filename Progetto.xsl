<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="html" encoding="UTF-8"  indent="yes" />

    <xsl:template match="/">

        <html>

            <head>
                <title>I Diari di Artom (pp. 141-145) - Progetto di Codifica di testi</title>
                <link rel="stylesheet" href="progettoStyle.css" type="text/css" />
                <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@200display=swap" rel="stylesheet" />
            </head>

            <body>

                <header class="infoSito" id="infoTop">
                    <h1><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title" /></h1>
                </header>

                <nav>
                    <ul>
                        <li><a href="#info" class="menu">Informazioni</a></li>
                        <li><a href="#legenda" class="menu">Pagine</a>
                            <ul>
                                <li><a href="#p141" class="menu">Pagina 141</a></li>
                                <li><a href="#p142" class="menu">Pagina 142</a></li>
                                <li><a href="#p143" class="menu">Pagina 143</a></li>
                                <li><a href="#p144" class="menu">Pagina 144</a></li>
                                <li><a href="#p145" class="menu">Pagina 145</a></li>
                            </ul>
                        </li>
                        <li><a href="#infoPers" class="menu">Personaggi</a></li>
                        <li><a href="#infoOrg" class="menu">Organizzazioni</a></li>
                        <li><a href="#infoLuog" class="menu">Luoghi</a></li>
                        <li><a href="#infoGloss" class="menu">Glossario</a></li>
                    </ul>
                </nav>

                <section class="informazioniG" id="info">
                    <h2>Informazioni generali</h2>
                    <article>
                        <br />
                        <p class="intro">
                            <xsl:apply-templates select="//tei:fileDesc/tei:editionStmt/tei:edition" /> di cinque pagine del manoscritto originale di 
                            <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:author//@target" /></xsl:attribute>
                                <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:author" />
                            </xsl:element>, 
                            intitolato "<xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:head" />".
                        </p>
                            <br />
                        <p class="intro">
                            Codifica a cura di <xsl:apply-templates select="//tei:fileDesc/tei:editionStmt/tei:respStmt/tei:name[1]" /> e 
                            <xsl:apply-templates select="//tei:fileDesc/tei:editionStmt/tei:respStmt/tei:name[2]" /> per il 
                            <xsl:apply-templates select="//tei:encodingDesc/tei:projectDesc" />   
                        </p>  
                        <br />
                        <img id="artom" src="Img/Artom.jpeg" alt="Emanuele Artom" />
                        <br />
                        <h3>Panoramica sul manoscritto</h3>
                        <br />
                        <p>
                            <b>Titolo:</b> "<xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:head" />"
                            <br />
                            <br />
                            <b>Autore:</b>&#160;
                            <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:author//@target" /></xsl:attribute>
                                <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:author" />
                            </xsl:element>
                            <br />
                            <br />
                            <b>Lingua:</b>&#160;  <xsl:apply-templates select="//tei:profileDesc/tei:langUsage" />
                            <br />
                            <br />
                            <b>Contenuto:</b>&#160;<xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msContents" />
                            Inoltre, esso <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat" />
                            (<xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution/tei:orgName/tei:abbr" />).
                            <br />
                            <br />
                            <div id="container_p_chiave">
                                <p>
                                    <xsl:for-each select="//tei:encodingDesc/tei:classDecl/tei:taxonomy/tei:category"> 
                                        <b class="p_chiave"><xsl:apply-templates /></b> &#160;
                                    </xsl:for-each>
                                </p>
                            </div>
                            <br />
                            <br />
                            <b>Storia:</b> <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:history/tei:origin" />
                                <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:history/tei:provenance" />
                                <br />
                                Infine, <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:history/tei:acquisition" />
                            <br />
                            <br />
                            <b>Collocazione:</b> Il manoscritto è conservato nella <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno" /> 
                            all'interno del 
                            <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:collection//@target" /></xsl:attribute>
                                <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:collection" />
                            </xsl:element>
                            consultabile sul sito della
                            <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository//@target" /></xsl:attribute>
                                <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository" />
                            </xsl:element>
                            del <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution/tei:orgName/tei:abbr" />
                            <br />
                            <xsl:element name="a">
                                <xsl:attribute name="href"><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier" /></xsl:attribute>
                                Vedi manoscritto integrale
                            </xsl:element>
                            <br />
                            <br />
                            <b>Accesso:</b>&#160;<xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:additional/tei:adminInfo" />
                            <br />
                            <br />
                            <b>Materiale:</b> I Diari sono costituiti da <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support" />, 
                            per un totale di <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"/>
                            <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:layoutDesc" />
                            <br />
                            <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition" />
                            <br />
                            <br />
                            <b>Edizioni successive:</b> 
                            <br />
                            <br />
                            <xsl:for-each select="//tei:sourceDesc/tei:msDesc/tei:additional//tei:monogr">
                                <xsl:sort select=".//tei:date" data-type="number" order="descending" /> 
                                    <i><xsl:apply-templates select="./tei:title" />, a cura di <xsl:apply-templates select="./tei:editor[1]" />
                                    <xsl:choose> 
                                        <xsl:when test="./tei:editor[2]!=''"> 
                                            e <xsl:apply-templates select="./tei:editor[2]" />,
                                        </xsl:when>
                                        <xsl:otherwise>,</xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:apply-templates select="./tei:imprint/tei:pubPlace" />, <xsl:apply-templates select="./tei:imprint/tei:date" />
                                    <xsl:if test=".//tei:publisher!=''">,
                                        <xsl:apply-templates select=".//tei:publisher" />
                                    </xsl:if></i>
                                    <br />
                                    &#160;&#160;<xsl:apply-templates select=".//tei:edition" />: <xsl:apply-templates select=".//tei:note" />
                                    <br />
                                    <br />
                            </xsl:for-each> 
                        </p>
                    </article>
                </section>

                <section class="informazioni" id="legenda">
                    <h2>Legenda</h2>
                    <br />
                    <article>
                        <ul>
                            <li><mark class="nomi_P">Personaggi</mark>: nomi dei personaggi e riferimenti ad essi</li>
                            <br />
                            <li><mark class="nomi_L">Luoghi</mark>: nomi delle città</li>
                            <br />
                            <li><mark class="term">Termini</mark>: termini per cui nel glossario è disponibile la definizione</li>
                            <br />
                            <li><mark class="term_est">Termini arcaici</mark>: termini per cui in una pagina esterna è disponibile la definizione</li>
                            <br />
                            <li><span class="corr_C">Correzioni dei codificatori</span>: cancellature, aggiunte ed espansioni delle abbreviazioni</li>    
                            <br />
                            <li><span class="canc_A">Correzioni dell'autore</span>:cancellature</li> 
                        </ul>
                    </article>
                </section>

                <section class="pagina" id="p141">
                    <h2>Pagina 141</h2>
                    <br />
                    <article>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="//tei:surface[@xml:id='scan_p141']/tei:graphic/@url" />
                            </xsl:attribute>
                            <xsl:attribute name="id">Pagina 141</xsl:attribute>
                        </xsl:element>
                        <br />
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n='141']" />
                        </div>    
                    </article>
                </section>

                <section class="pagina" id="p142">
                    <h2>Pagina 142</h2>
                    <br />
                    <article>
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="//tei:surface[@xml:id='scan_p142']/tei:graphic/@url" />
                                </xsl:attribute>
                                <xsl:attribute name="id">Pagina 142</xsl:attribute>
                            </xsl:element>
                            <br />
                            <div class="testo">
                                <xsl:apply-templates select="//tei:body/tei:div[@n='142']" />
                            </div>
                    </article>
                </section>

                <section class="pagina" id="p143">
                    <h2>Pagina 143</h2>
                    <br />
                    <article>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="//tei:surface[@xml:id='scan_p143']/tei:graphic/@url" />
                            </xsl:attribute>
                            <xsl:attribute name="id">Pagina 143</xsl:attribute>
                        </xsl:element>
                        <br />
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n='143']" />
                        </div>
                    </article>
                </section>

                <section class="pagina" id="p144">
                    <h2>Pagina 144</h2>
                    <br />
                    <article>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="//tei:surface[@xml:id='scan_p144']/tei:graphic/@url" />
                            </xsl:attribute>
                            <xsl:attribute name="id">Pagina 144</xsl:attribute>
                        </xsl:element>
                        <br />
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n='144']" />
                        </div>
                    </article>
                </section>

                <section class="pagina" id="p145">
                    <h2>Pagina 145</h2>
                    <br />
                    <article>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="//tei:surface[@xml:id='scan_p145']/tei:graphic/@url" />
                            </xsl:attribute>
                            <xsl:attribute name="id">Pagina 145</xsl:attribute>
                        </xsl:element>
                        <br />
                        <div class="testo">
                            <xsl:apply-templates select="//tei:body/tei:div[@n='145']" />
                        </div>
                    </article>
                </section>

                <section class="informazioni" id="infoPers">
                    <h2>Personaggi</h2>
                    <br />
                    <article>
                        <ul>
                            <xsl:for-each select="//tei:back//tei:person">
                                <xsl:element name="li">
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <xsl:apply-templates />  
                                    <br />  
                                    <xsl:if test=".//tei:note/@source!=''">
                                        <xsl:element name="a">
                                            <xsl:attribute name="href"><xsl:value-of select=".//tei:note/@source" /></xsl:attribute>
                                            Vedi fonte
                                        </xsl:element>
                                    </xsl:if>
                                </xsl:element>
                                <br />
                            </xsl:for-each>
                        </ul>
                    </article>
                </section>

                <section class="informazioni" id="infoOrg">
                    <h2>Organizzazioni</h2>
                    <br />
                    <article>
                        <ul>
                            <xsl:for-each select="//tei:back//tei:org">
                                <xsl:element name="li">
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                                    <xsl:apply-templates />  
                                    <br />  
                                </xsl:element>
                                <br />
                            </xsl:for-each>
                        </ul>
                    </article>
                </section>

                <section class="informazioni" id="infoLuog">
                    <h2>Luoghi</h2>
                    <br />
                    <article>
                        <ul>
                            <xsl:for-each select="//tei:back//tei:place">
                                <xsl:element name="li">
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                    <xsl:apply-templates/>
                                </xsl:element>
                                <br/>
                            </xsl:for-each>
                        </ul>
                        <img class="mappa" src="Img/mappa3.png" alt="Mappa cliccabile" usemap="#mappa_click"/>
                        <map class="mappa" name="mappa_click">
                            <area alt="Prali" href="https://it.wikipedia.org/wiki/Prali" coords="69,39,72" shape="circle" />
                            <area alt="Bobbio Pellice" href="https://it.wikipedia.org/wiki/Bobbio_Pellice" coords="208,253,57" shape="circle" />
                            <area alt="Torre Pellice" href="https://it.wikipedia.org/wiki/Torre_Pellice" coords="409,202,56" shape="circle" />
                            <area alt="Luserna" href="https://it.wikipedia.org/wiki/Luserna_San_Giovanni" coords="516,243,58" shape="circle" />
                            <area alt="Barge"  href="https://it.wikipedia.org/wiki/Barge" coords="643,463,48" shape="circle" />
                        </map>
                    </article>
                </section>

                <section class="informazioni" id="infoGloss">
                     <h2>Glossario</h2>
                     <br />
                    <article>
                        <ul>
                            <xsl:for-each select="//tei:back//tei:label">
                                <xsl:element name="li">
                                    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                    <xsl:apply-templates />
                                    <xsl:element name="p"><xsl:value-of select="./following-sibling::*[1]" /></xsl:element>
                                </xsl:element>
                                <br/>
                            </xsl:for-each>
                        </ul>
                    </article>
                </section>

                <footer class="infoSito" id="infoBottom">
                    <div>
                        <p>Progetto realizzato da <b>Francesca Rumiz</b> e <b>Isabella Tofanelli</b></p>
                    </div>
                    <div>
                        <p>Esame del corso di studi <i>Codifica di Testi</i> coordinato dal professore <b>Angelo Maria Del Grosso</b></p>
                    </div>
                </footer>

            </body>

        </html>
        
    </xsl:template>

    <!-- Template per i link Amalia Segre nelle informazioni iniziali -->
    <xsl:template match="tei:teiHeader//tei:persName/tei:ref[@target='#AS']">
        <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Template per gli a capo del corpo del testo -->
    <xsl:template match="tei:div[@type='page']//tei:lb">
        <xsl:apply-templates />
        <br />
        <br />
    </xsl:template>

    <!-- Template per le date nel testo -->
    <xsl:template match="tei:dateline">
        <xsl:element name="p">
            <xsl:attribute name="class">date_diario</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
        
    <!-- Template per i link dei nomi propri di persona nel testo-->
    <xsl:template match="tei:body//tei:persName/*[@target]">
        <mark class="nomi_P">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </mark>
    </xsl:template>

    <!-- Template per i link dei nomi propri di luogo nel testo-->
    <xsl:template match="tei:body//tei:placeName/*[@target]">
        <mark class="nomi_L">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </mark>
    </xsl:template>

    <!-- Template per i link dei nomi comuni di persona nel testo-->
    <xsl:template match="tei:body//tei:rs/*[@target]">
        <mark class="nomi_P">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </mark>
    </xsl:template>

    <!-- Template per i link dei termini nel testo con riferimento al glossario -->
    <xsl:template match="tei:body//tei:term/*[@target]">
        <mark class="term">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </mark>
    </xsl:template>

    <!-- Template per i link dei termini nel testo con riferimento a pagine esterne -->
    <xsl:template match="tei:body//tei:distinct/*[@target]|tei:foreign/*[@target]">
        <mark class="term_est">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </mark>
    </xsl:template>

    <!-- Template per le cancellature dell'autore -->
    <xsl:template match="tei:del[@rend='overstrike']">
        <span class="canc_A">
        <xsl:apply-templates />
        </span>
    </xsl:template>

    <!-- Template per le cancellature sovrascritte dell'autore -->
    <xsl:template match="tei:del[@rend='overtype']">
        <xsl:value-of select="tei:add" />
    </xsl:template>

    <!-- Templates per le correzioni dei codificatori -->
    <xsl:template match="tei:choice/tei:sic">
        <span class="canc_C">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:choice/tei:corr[@resp='#FR #IT']|tei:expan[@resp='#FR #IT']">
        <span class="corr_C">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <xsl:template match="tei:supplied[@resp='#FR #IT']">
        <span class="corr_C">
            <xsl:apply-templates />
        </span>
    </xsl:template>

    <!-- Template per i termini insoliti -->
    <xsl:template match="tei:reg">
        <xsl:value-of select="tei:orig" />
    </xsl:template>

    <!-- Templates lista personaggi -->
    <xsl:template match="tei:back//tei:person//tei:lb">
        <xsl:apply-templates />
        <br />
    </xsl:template>

    <xsl:template match="tei:back//tei:person/tei:p/tei:persName">
        <b><xsl:apply-templates /></b>
    </xsl:template>

    <!-- Templates lista organizzazioni -->
    <xsl:template match="tei:back//tei:org//tei:lb">
        <xsl:apply-templates />
        <br />
    </xsl:template>

    <xsl:template match="tei:back//tei:org/tei:p/tei:orgName">
        <b><xsl:apply-templates /></b>
    </xsl:template>

    <!-- Templates lista luoghi -->
    <xsl:template match="tei:back//tei:place//tei:lb">
        <xsl:apply-templates />
        <br />
    </xsl:template>

    <xsl:template match="tei:back//tei:place/tei:p/tei:placeName">
        <b><xsl:apply-templates /></b>
    </xsl:template>

    <!-- Template glossario -->
    <xsl:template match="tei:back//tei:label/tei:term">
        <b><xsl:apply-templates /></b>
    </xsl:template>

</xsl:stylesheet>

   
