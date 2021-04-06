<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       xmlns:tei="http://www.tei-c.org/ns/1.0"
       xmlns="http://www.w3.org/1999/xhtml">
       
       <xsl:output 
            method="html" 
            encoding="UTF-8" 
            indent="yes"
            omit-xml-declaration="yes" />

       <xsl:template match="/tei:TEI">
            <html>
              <head>
                     <title>Bellini LL1.13.I</title>
                     <link href="style.css" rel="stylesheet" type="text/css"/>
                     <meta name="viewport" content="width=device-width, initial-scale=1.0" />

              </head>
              <body>
                     
                     <xsl:apply-templates/>
                   
              </body>
            </html>
       </xsl:template>

       <xsl:template match="tei:teiHeader">
              <h1>Lettera LL1.13.I</h1>
              <h2>Informazioni sul documento</h2>
              <xsl:apply-templates />
       </xsl:template>

       <xsl:template match="tei:titleStmt">
              <b>Titolo: </b>
              <i><xsl:value-of select="./tei:title" /></i>
              <br />
              <b>Autore: </b>
              <xsl:value-of select="./tei:author" />
              <br />
              <b><xsl:value-of select="./tei:respStmt/tei:resp" /><xsl:text>: </xsl:text></b><xsl:value-of select="./tei:respStmt/tei:name" />
              <br />  
       </xsl:template>

       <xsl:template match="tei:editionStmt/tei:edition">
              <b>Edizione: </b>
              <xsl:apply-templates />
              <br />
       </xsl:template>


       <xsl:template match="tei:editionStmt//tei:resp">
              <xsl:for-each select=".">
                            
                            <b><xsl:apply-templates/>: </b>                
              </xsl:for-each>
       </xsl:template>

       <xsl:template match="tei:editionStmt//tei:name">
              <ul>
                     <li><xsl:apply-templates /></li>
              </ul>
       </xsl:template>

       <xsl:template match="tei:editionStmt//tei:name[@xml:id='IP']">
              <xsl:apply-templates />
              <br />
       </xsl:template>

       <xsl:template match="tei:publicationStmt">
              <b>Editore: </b>
              <xsl:value-of select="./tei:publisher" />
              <br />
              <b>Licenza: </b>
              <xsl:value-of select=".//tei:licence" />
              <br />
       </xsl:template>

       
       <xsl:template match="tei:sourceDesc//tei:citedRange">
              <b>Edizione di riferimento: </b>
              <i><xsl:text>Seminara(2017)</xsl:text></i><xsl:text>, pp. </xsl:text><xsl:apply-templates />
              <br />
       </xsl:template>


       <xsl:template match="tei:msIdentifier">
              <b>Luogo di conservazione del manoscritto: </b>
              <i><xsl:value-of select=".//tei:idno[@type='collocation']" /></i>,   
              <xsl:value-of select="./tei:repository" />, <xsl:value-of select="./tei:settlement" /> (<xsl:value-of select="./tei:country" />)
              <br />
              <b>Segnatura della lettera: </b><xsl:value-of select="./tei:idno[@type='inventory']" />
              <br />   
       </xsl:template>


       <xsl:template match="tei:msItem">
              <b>Autore: </b> <xsl:value-of select="./tei:author" />
              <br />
              <b>Titolo: </b> <xsl:value-of select="./tei:title" />
              <br />
              <b>Lingua: </b> <xsl:value-of select="./tei:textLang" />
              <br />
              <b>Destinatario: </b> <xsl:value-of select="./tei:note" />
       </xsl:template>


       <xsl:template match="tei:extent">
              <b>Numero di fogli: </b> <xsl:value-of select="./tei:measure" />
              <br />
              <b>Dimensioni: </b>
              <xsl:value-of select=".//tei:height" /> <xsl:text> x </xsl:text> <xsl:value-of select=".//tei:width" /> <br />      
       </xsl:template>

       <xsl:template match="tei:handDesc">
              
                     <xsl:element name="div">
                            <xsl:attribute name="class">writing_description</xsl:attribute>
                            <b>Descrizione della scrittura: </b>
                            <ul>
                                   <xsl:for-each select="./tei:handNote">
                                          <li> <xsl:value-of select="." /></li>
                                   </xsl:for-each>
                            </ul>
                            
                     </xsl:element>
       </xsl:template>


       <xsl:template match="tei:additional">
              <xsl:element name="div">
                     <xsl:attribute name="class">information</xsl:attribute>
                     <b>Ulteriori Informazioni: </b>
                     <br />
                     <xsl:value-of select=".//tei:note" />
                     <br />
              </xsl:element>
       </xsl:template>

       <xsl:template match="tei:support">
              <br />
              <xsl:element name="div">
                     <xsl:attribute name="class">letter_description</xsl:attribute>
                     <b>Descrizione fisica della lettera: </b>
                     <xsl:for-each select=".//tei:p">
                            <p><xsl:value-of select="." /></p>
                     </xsl:for-each>
                     <xsl:value-of select=".//tei:watermark"> <xsl:apply-templates /></xsl:value-of>
                     <br />
              </xsl:element>     
       </xsl:template>


       <xsl:template match="tei:supportDesc/tei:condition/tei:p[@xml:id='p_01']">
              <xsl:element name="div">
                     <xsl:attribute name="hidden" />
              </xsl:element>
       </xsl:template>


        <xsl:template match="tei:profileDesc">
              <xsl:element name="div">
                     <xsl:attribute name="hidden" />
              </xsl:element>
       </xsl:template>


       <xsl:template match="tei:facsimile">
              <span class="immagine">
                     <div id="image1"><img id="img001f" src="LL1.13.I_0001.jpg" alt="Fronte della lettera" style="width:1000px;height:300px;" /></div><br/>
                     <div id="image2"><img id="img001r" src="LL1.13.I_0002.jpg" alt="Retro della lettera" style="width:1000px;height:300px;" /></div>
                     <xsl:apply-templates/>
              </span>       
       </xsl:template>


        <xsl:template match="tei:lb">
              <br />
       </xsl:template>

       <xsl:template match="tei:div[@type='opener']/tei:dateline">
              <div class="date"> <xsl:apply-templates /></div>
       </xsl:template>

       <xsl:template match="tei:div[@type='opener']/tei:salute">
              <div class="opening_salutation"> <xsl:apply-templates /> </div>
       </xsl:template>

       <xsl:template match="tei:div[@type='letter-body']">
              <div class="letter_body"> <xsl:apply-templates/></div>
       </xsl:template>

       <xsl:template match="tei:div[@type='closer']/tei:salute">
              <div class="closing_salutation"> <xsl:apply-templates /> </div>
       </xsl:template>


       <xsl:template match="tei:body">
              <br />
              <h2>Testo della lettera</h2>
                     <i> <xsl:apply-templates /> </i>   
       </xsl:template>

      
       <xsl:template match="tei:w[@xml:id='w_01']/tei:add">
              <xsl:text>&#8249;</xsl:text><xsl:apply-templates /><xsl:text>&#8250;</xsl:text>
       </xsl:template>


       <xsl:template match="tei:div[@type='opener']//tei:choice">
              <xsl:value-of select="./tei:abbr">
              <xsl:apply-templates />
              </xsl:value-of>
       </xsl:template>

        <xsl:template match="tei:seg[@xml:id='seg_01']">
              <xsl:apply-templates /><xsl:text> &#8332;</xsl:text>
       </xsl:template>

       <xsl:template match="tei:div[@type='letter-body']//tei:subst">
              <ins><xsl:value-of select="./tei:add" /></ins><del><xsl:value-of select="./tei:del" /></del>     
       </xsl:template>


       <xsl:template match="tei:div[@type='paratext']/tei:ab//tei:num">
              <xsl:element name="span">
                     <xsl:attribute name="hidden" />
              </xsl:element>
       </xsl:template>
       
       
       <xsl:template match="tei:listBibl">
              <br />
              <h2> Bibliografia </h2>
              <ol>
                     <xsl:for-each select="./tei:bibl/tei:ref/tei:bibl">
                            <li>
                                   <xsl:value-of select="./tei:author" />
                                   (<xsl:value-of select="./tei:date" />),
                                   <xsl:choose>
                                          <xsl:when test="./tei:citedRange/@from != ./tei:citedRange/@to">pp. </xsl:when>
                                          <xsl:otherwise>p. </xsl:otherwise>
                                   </xsl:choose>
                                   <xsl:value-of select="./tei:citedRange" />
                            </li>
                     </xsl:for-each>
              </ol>                           
       </xsl:template>


</xsl:stylesheet>