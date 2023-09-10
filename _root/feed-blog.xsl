---
layout: null
permalink: /blog/feed.xsl
---
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/rss">

<html>

  {% include head.html %}

  <body>

   <style>
   .site-nav {
      margin-top: 1em;
   }
   </style>

    {% include header.html %}

    <div class="page-content">
      <div class="wrapper">

         <div class="home">

           <h1 class="page-heading">RSS Feed for Blog</h1>

           <ul class="post-list">
             <xsl:for-each select="channel/item">

               <li>
                 <span class="post-meta"><xsl:value-of select="pubDate" /></span>

                 <h2>
                  <xsl:element name="a">
                     <xsl:attribute name="href">
                        <xsl:value-of select="link"/>
                     </xsl:attribute>
                     <xsl:value-of select="title"/>
                  </xsl:element>
                 </h2>

                 <div>
                  <xsl:value-of select="description" disable-output-escaping="yes" />
                 </div>
               </li>

             </xsl:for-each>
           </ul>

           <p class="rss-subscribe">subscribe <a class="internal" href="{{ "/blog/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

         </div>

      </div>
    </div>

    {% include footer.html %}

  </body>

</html>
</xsl:template>
</xsl:stylesheet>