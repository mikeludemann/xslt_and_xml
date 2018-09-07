<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
    <body>
        <h2>Persons</h2>
        <xsl:apply-templates/>  
    </body>
    </html>
</xsl:template>

<xsl:template match="person">
    <xsl:apply-templates select="info">
        <xsl:sort select="lastName"/>
    </xsl:apply-templates>
</xsl:template>

<xsl:template match="info">
    <div class="person__container">
        <xsl:apply-templates select="firstName"/>
        <xsl:apply-templates select="lastName"/>
        <xsl:apply-templates select="budget"/>
    </div>
</xsl:template>

<xsl:template match="firstName">
    <span class="person__container__first">
        <xsl:value-of select="."/>
    </span>
</xsl:template>

<xsl:template match="lastName">
    <span class="person__container__last">
        <xsl:value-of select="."/>
    </span>
</xsl:template>

<xsl:template match="budget">
    <span class="person__container__money">
        <span>has a budget of </span> 
        <xsl:choose>
            <xsl:when test="@position">
                <xsl:if test="@position = 'director'">
                    <span style="background-color: #0f0">
                        <xsl:value-of select="."/>
                    </span>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <span>
                    <xsl:value-of select="."/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </span>
</xsl:template>

<xsl:template match="@* | node()">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>