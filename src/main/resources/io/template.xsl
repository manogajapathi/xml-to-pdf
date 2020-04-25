<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns="http://www.w3.org/TR/xhtml1/strict"
      xmlns:msxsl='urn:schemas-microsoft-com:xslt' 
      xmlns:var='urn:var' 
      xmlns:JS='urn:JS'>
<xsl:output method="xml" version="1.0" indent="no"/>

<!-- titles -->
<xsl:attribute-set name="h1" >
  <xsl:attribute name="font-size">24pt</xsl:attribute>
  <xsl:attribute name="font-family">"sans-serif"</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-after">14pt</xsl:attribute>
  <xsl:attribute name="border-after-width">2pt</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="h2" >
  <xsl:attribute name="font-size">16pt</xsl:attribute>
  <xsl:attribute name="font-family">"sans-serif"</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-before">19pt</xsl:attribute>
  <xsl:attribute name="space-after">5pt</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="h3" >
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="font-family">"sans-serif"</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-before">19pt</xsl:attribute>
  <xsl:attribute name="space-after">5pt</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="h4" >
  <xsl:attribute name="font-size">12pt</xsl:attribute>
  <xsl:attribute name="font-family">"sans-serif"</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="space-before">19pt</xsl:attribute>
  <xsl:attribute name="space-after">5pt</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="table.data" >
  <xsl:attribute name="table-layout">fixed</xsl:attribute>
  <xsl:attribute name="space-before">10pt</xsl:attribute>
  <xsl:attribute name="space-after">10pt</xsl:attribute>
</xsl:attribute-set>
  <xsl:attribute-set name="table.data.caption" >
  <xsl:attribute name="font-family">sans-serif</xsl:attribute>
  <xsl:attribute name="text-align">start</xsl:attribute>
  <xsl:attribute name="space-before">3pt</xsl:attribute>
  <xsl:attribute name="space-after">3pt</xsl:attribute>
  <xsl:attribute name="space-after.precedence">2</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="table.data.th" >
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="border-width">1pt</xsl:attribute>
  <xsl:attribute name="padding-start">0.3em</xsl:attribute>
  <xsl:attribute name="padding-end">0.2em</xsl:attribute>
  <xsl:attribute name="padding-before">10pt</xsl:attribute>
  <xsl:attribute name="padding-after">10pt</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="table.data.td" >
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="border-width">0pt</xsl:attribute>
  <xsl:attribute name="padding-start">0.3em</xsl:attribute>
  <xsl:attribute name="padding-end">0.2em</xsl:attribute>
  <xsl:attribute name="padding-before">2pt</xsl:attribute>
  <xsl:attribute name="padding-after">2pt</xsl:attribute>
</xsl:attribute-set>

<xsl:template match="book">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
	  <fo:simple-page-master page-height="297mm" page-width="210mm" margin="10mm 5mm 10mm 0mm" master-name="PageMaster-Cover">
        <fo:region-body margin="25mm 15mm 25mm 15mm"/>
        <fo:region-before region-name="Cover-header" extent="21mm" display-align="after"/>
        <fo:region-after region-name="Cover-footer" extent="20mm" display-align="before"/>
		<fo:region-start region-name="Cover-start" extent="15mm"/>
      </fo:simple-page-master>
	  
      <fo:simple-page-master page-height="297mm" page-width="210mm" margin="10mm 5mm 10mm 0mm" master-name="PageMaster-Left">
        <fo:region-body margin="25mm 15mm 25mm 15mm"/>
        <fo:region-before region-name="Left-header" extent="21mm" display-align="after"/>
        <fo:region-after region-name="Left-footer" extent="20mm" display-align="before"/>
        <fo:region-start region-name="Left-start" extent="15mm" />
        <fo:region-end region-name="Left-end" extent="15mm"/>
      </fo:simple-page-master>

      <fo:simple-page-master page-height="297mm" page-width="210mm" margin="10mm 0mm 10mm 5mm" master-name="PageMaster-Right">
        <fo:region-body margin="25mm 15mm 25mm 15mm"/>
        <fo:region-before region-name="Right-header" extent="21mm" display-align="after"/>
        <fo:region-after region-name="Right-footer" extent="20mm" display-align="before"/>
        <fo:region-start region-name="Right-start" extent="15mm"/>
        <fo:region-end region-name="Right-end" extent="15mm"/>
      </fo:simple-page-master>

      <fo:page-sequence-master master-name="PageMaster">
        <fo:repeatable-page-master-alternatives>
		  <fo:page-master-reference master-reference="PageMaster-cover" />
          <fo:conditional-page-master-reference master-reference="PageMaster-Left" odd-or-even="even"/>
          <fo:conditional-page-master-reference master-reference="PageMaster-Right" odd-or-even="odd"/>
        </fo:repeatable-page-master-alternatives>
      </fo:page-sequence-master>
    </fo:layout-master-set>

    <fo:bookmark-tree>
      <xsl:for-each select="document(book_chapter/@navtitle)/dmodule/identAndStatusSection/dmAddress">
        <xsl:variable name="i" select="position()" />
        <xsl:for-each select="//dmTitle">
          <xsl:if test="name(parent::node())='dmAddressItems'">
            <fo:bookmark internal-destination="{generate-id(.)}" starting-state="show">
              <fo:bookmark-title>
                <xsl:value-of select="$i" />
                <xsl:text>. </xsl:text>
                <xsl:value-of select="infoName" />
              </fo:bookmark-title>
            </fo:bookmark>
          </xsl:if>
        </xsl:for-each>
      </xsl:for-each>
    </fo:bookmark-tree>
	
	<fo:page-sequence master-reference="PageMaster-Cover">
      <!-- left page footer -->
      <fo:static-content flow-name="Cover-header">
	    <fo:block text-align="right" >
          <fo:external-graphic width="20%" content-height="20%" content-width="scale-to-fit" scaling="uniform" src="logo.png">
          </fo:external-graphic>
        </fo:block>
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>
		 </fo:static-content>

      <fo:static-content flow-name="Cover-footer">     
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>
		<fo:block text-align="outside" padding-bottom="20pt"  font-weight="bold">
            <fo:inline><fo:retrieve-marker retrieve-class-name="section.footer.marker.left" retrieve-position="first-including-carryover" retrieve-boundary="page"/></fo:inline>
            <fo:leader leader-pattern=" " />
            Effectivity:† All
        </fo:block>
	</fo:static-content>
	  
	  <fo:static-content flow-name="Cover-start">  
        <fo:block-container reference-orientation="90">
          <fo:block text-align="left" font-size="12" padding-top="20pt" padding-right="600pt">
            Printed using NavIETM
          </fo:block>
        </fo:block-container>
      </fo:static-content>
	  
	  <fo:flow flow-name="xsl-region-body">
            <fo:block padding-bottom="50pt" padding-top="50pt" font-size="50pt" font-weight="bold" text-align="center">
            Advanced Landing Ground
			Communication System
          </fo:block>
		  <fo:block text-align="center" >
          <fo:external-graphic width="60%" content-height="60%" content-width="scale-to-fit" scaling="uniform" src="mainlogo.png">
          </fo:external-graphic>
        </fo:block>
        </fo:flow>
    </fo:page-sequence>

    <fo:page-sequence master-reference="PageMaster" initial-page-number="1">
      <!-- left page footer -->
      <fo:static-content flow-name="Left-header">  
        <fo:block text-align="left" font-weight="bold" font-size="14" padding-bottom="7pt">
          BikePack Issue 4.2<fo:inline space-end="125pt"/>UNCLASSIFIED
        </fo:block>
        <fo:block text-align="left" >
          <fo:external-graphic width="20%" content-height="20%" content-width="scale-to-fit" scaling="uniform" src="logo.png">
          </fo:external-graphic>
        </fo:block>
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>
      </fo:static-content>

      <fo:static-content flow-name="Right-header">  
        <fo:block text-align="right" font-weight="bold" font-size="14" padding-bottom="7pt">
          UNCLASSIFIED<fo:inline space-end="125pt"/>BikePack Issue 4.2
        </fo:block>
        <fo:block text-align="right" >
          <fo:external-graphic width="20%" content-height="20%" content-width="scale-to-fit" scaling="uniform" src="logo.png">
          </fo:external-graphic>
        </fo:block>
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>
      </fo:static-content>

      <fo:static-content flow-name="Right-start">  
        <fo:block-container reference-orientation="90">
          <fo:block text-align="left" font-size="12" padding-top="20pt" padding-right="600pt">
            Printed using NavIETM
          </fo:block>
        </fo:block-container>
      </fo:static-content>

      <fo:static-content flow-name="Left-start">  
        <fo:block-container reference-orientation="90">
          <fo:block text-align="left" font-size="12" padding-top="20pt" padding-right="600pt">
            Printed using NavIETM
          </fo:block>
        </fo:block-container>
      </fo:static-content>

      <fo:static-content flow-name="Right-footer">  
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>

        <fo:block text-align="outside" padding-bottom="20pt"  font-weight="bold">
            Effectivity:† All
            <fo:leader leader-pattern=" " />
            <fo:retrieve-marker retrieve-class-name="section.footer.marker.right" retrieve-position="first-including-carryover" retrieve-boundary="page"/>
        </fo:block>

        <fo:block text-align="outside" font-weight="bold">
          UNCLASSIFIED<fo:inline space-end="115pt"/>
          <xsl:for-each select="document(book_chapter[1]/@navtitle)/dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate">
            <fo:inline>
              <xsl:value-of select="@day"/>-<xsl:value-of select="@month"/>-<xsl:value-of select="@year"/>
            </fo:inline>
          </xsl:for-each>
			<fo:inline space-end="10pt"/>
          <fo:inline >    Page <fo:page-number/></fo:inline>
        </fo:block>
      </fo:static-content>

      <fo:static-content flow-name="Left-footer">     
        <fo:block padding-bottom="5pt">
          <fo:leader leader-pattern="rule" rule-thickness="1pt" leader-length="100%"/>
        </fo:block>

        <fo:block text-align="outside" padding-bottom="20pt"  font-weight="bold">
            <fo:inline><fo:retrieve-marker retrieve-class-name="section.footer.marker.left" retrieve-position="first-including-carryover" retrieve-boundary="page"/></fo:inline>
            <fo:leader leader-pattern=" " />
            Effectivity:† All
        </fo:block>

        <fo:block text-align="outside" font-weight="bold">
          <fo:inline >Page <fo:page-number/></fo:inline><fo:inline space-end="10pt"/>
          <xsl:for-each select="document(book_chapter[1]/@navtitle)/dmodule/identAndStatusSection/dmAddress/dmAddressItems/issueDate">
            <fo:inline>
              <xsl:value-of select="@day"/>-<xsl:value-of select="@month"/>-<xsl:value-of select="@year"/>
            </fo:inline>
          </xsl:for-each>          
          <fo:inline space-end="115pt"/>UNCLASSIFIED
        </fo:block>
      </fo:static-content>

      <fo:flow flow-name="xsl-region-body">
        <fo:block>          
          <fo:block padding-bottom="20pt" padding-top="40pt" font-size="20pt" font-weight="bold" text-align="center">
            Contents
          </fo:block>
          <xsl:value-of select="JS:SetFileNum(count(book_chapter))"/>
          <xsl:for-each select="document(book_chapter/@navtitle)/dmodule/identAndStatusSection/dmAddress">
            <xsl:variable name="i" select="position()" />
            <fo:block padding-left="20pt" color="blue" padding-bottom="15pt" font-size="12pt">
              <xsl:for-each select="//dmTitle">
                <xsl:if test="name(parent::node())='dmAddressItems'">
                  <fo:block text-align-last="justify">
                    <fo:basic-link internal-destination="{generate-id(.)}">
                      <xsl:value-of select="$i" />
                      <fo:inline space-end="30pt"/>
                      <xsl:value-of select="infoName" />
                      <fo:leader leader-pattern="dots" />
                      <fo:page-number-citation ref-id="{generate-id(.)}" />
                    </fo:basic-link>
                  </fo:block>
                </xsl:if>
              </xsl:for-each>
            </fo:block>
          </xsl:for-each>

          
          <xsl:for-each select="document(book_chapter/@navtitle)">
            <xsl:variable name="i" select="position()" />  
            <xsl:value-of select="JS:SetFileNum($i)"/>
            <xsl:apply-templates select="dmodule"/>
          </xsl:for-each>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<msxsl:script language='JScript' implements-prefix='JS'>
  <![CDATA[
  var fileNum:int=0;
  function SetFileNum(a)
  {
    fileNum = a;
  }
  function GetFileNum()
  {
    return fileNum;
  }

  var randomList:int=0;
  function SetRandomList(a)
  {
    randomList = a;
  }
  function GetRandomList()
  {
    return randomList;
  }

  var figs = [1,2,3,4,5,6,7,8,9,10];
  function SetFigs(n,a)
  {
    figs[n-1] = a;
  }
  function GetFigs(n)
  {
    return figs[n-1];
  }

  var hots = ['','','','','','','','','','','','','','','','','','','','','','','','','','',''];
  function SetHots(n,a)
  {
    hots[n-1] = a;
  }
  function GetHots(n)
  {
    return hots[n-1];
  }

  ]]>
</msxsl:script>

<xsl:template match="dmAddress">
  <fo:block padding-left="40pt" color="blue" padding-bottom="15pt" font-size="12pt">
    <xsl:for-each select="//dmTitle">
      <xsl:if test="name(parent::node())='dmAddressItems'">
        <fo:block text-align-last="justify">
          <fo:basic-link internal-destination="{generate-id(.)}">
            <xsl:variable name="i" select="position()" />
            <xsl:value-of select="$i" />
            <fo:inline space-end="30pt"/>
            <xsl:value-of select="infoName" />
            <fo:leader leader-pattern="dots" />
            <fo:page-number-citation ref-id="{generate-id(.)}" />
          </fo:basic-link>
        </fo:block>
      </xsl:if>
    </xsl:for-each>
  </fo:block>
</xsl:template>

<xsl:template match="dmodule">
  <xsl:call-template name="genTOC"/>

  <fo:block break-before='even-page'>
    <fo:marker marker-class-name="section.footer.marker.left">
        <xsl:for-each select="identAndStatusSection/dmAddress/dmIdent/dmCode">
            <xsl:value-of select="@modelIdentCode"/>-<xsl:value-of select="@systemDiffCode"/>-<xsl:value-of select="@systemCode"/>-<xsl:value-of select="@subSystemCode"/><xsl:value-of select="@subSubSystemCode"/>-<xsl:value-of select="@assyCode"/>-<xsl:value-of select="@disassyCode"/><xsl:value-of select="@disassyCodeVariant"/>-<xsl:value-of select="@infoCode"/><xsl:value-of select="@infoCodeVariant"/>-<xsl:value-of select="@itemLocationCode"/>
        </xsl:for-each>
    </fo:marker>
  </fo:block>

  <xsl:apply-templates select="//dmTitle"/>
  <xsl:apply-templates select="content"/>
</xsl:template>

<xsl:template match="dmTitle"> 
  <xsl:if test="name(parent::node())='dmAddressItems'">
    <fo:block id="{generate-id(.)}">
    </fo:block>
  </xsl:if>
</xsl:template>

<xsl:template name="genTOC">

  <fo:block break-before='odd-page'>
    <fo:marker marker-class-name="section.footer.marker.right">
        <xsl:for-each select="identAndStatusSection/dmAddress/dmIdent/dmCode">
          <fo:inline>
            <xsl:value-of select="@modelIdentCode"/>-<xsl:value-of select="@systemDiffCode"/>-<xsl:value-of select="@systemCode"/>-<xsl:value-of select="@subSystemCode"/><xsl:value-of select="@subSubSystemCode"/>-<xsl:value-of select="@assyCode"/>-<xsl:value-of select="@disassyCode"/><xsl:value-of select="@disassyCodeVariant"/>-<xsl:value-of select="@infoCode"/><xsl:value-of select="@infoCodeVariant"/>-<xsl:value-of select="@itemLocationCode"/>
          </fo:inline>
        </xsl:for-each>
    </fo:marker>

    <fo:block xsl:use-attribute-sets="h1" text-align="center" padding-bottom="0pt">
      Chapter <xsl:value-of select="JS:GetFileNum()"/>
    </fo:block>
    <fo:block xsl:use-attribute-sets="h3" text-align="center" padding-bottom="15pt">
      <xsl:value-of select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle/techName"/>-
      <xsl:value-of select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle/infoName"/>
    </fo:block>

    <xsl:if test="content/description">
      <fo:block padding-bottom="5pt">
        <fo:inline font-size="14pt" font-weight="bold">Table of contents</fo:inline>
        <fo:leader leader-pattern=" " />
        <fo:inline font-size="10pt" text-align-last="region-end">Page</fo:inline>
      </fo:block>
      <fo:block padding-left="40pt" color="blue" padding-bottom="15pt">      
        <fo:block padding-bottom="5pt">
          <xsl:value-of select="identAndStatusSection/dmAddress/dmAddressItems/dmTitle/infoName"/>
        </fo:block>
        <xsl:for-each select="//levelledPara">
          <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="{generate-id(.)}">
              <xsl:value-of select="count(preceding::levelledPara) + 1" />
              <fo:inline space-end="40pt"/>
              <xsl:value-of select="title" />
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="{generate-id(.)}" />
            </fo:basic-link>
          </fo:block>
        </xsl:for-each>
      </fo:block>
      <fo:flow flow-name="xsl-region-body">
        <fo:block>
          <fo:block padding-bottom="40pt" padding-top="40pt" font-size="14pt" font-weight="bold" text-align="left">
            Table of contents
          </fo:block>
          <xsl:value-of select="JS:SetFileNum(count(book_chapter))"/>
          <xsl:for-each select="document(book_chapter/@navtitle)/dmodule/content/description">
            <xsl:variable name="i" select="position()" />
            <fo:block padding-left="40pt" color="blue" padding-bottom="20pt" font-size="12pt">
              <xsl:for-each select="//title">
                <xsl:if test="name(parent::node())='levelledPara'">
                  <fo:block text-align-last="justify">
                    <fo:basic-link internal-destination="{generate-id(.)}">
                      <xsl:value-of select="$i" />
                      <fo:inline text-align-last="region-end" space-end="30pt"></fo:inline>
                      <xsl:value-of select="title" />
                      <fo:leader leader-pattern="dots" />
                      <fo:page-number-citation ref-id="{generate-id(.)}" />
                    </fo:basic-link>
                  </fo:block>
                </xsl:if>
              </xsl:for-each>
            </fo:block>
          </xsl:for-each>


		  
          <xsl:for-each select="document(book_chapter/@navtitle)">
            <xsl:variable name="i" select="position()" />
            <xsl:value-of select="JS:SetFileNum($i)"/>
            <xsl:apply-templates select="dmodule"/>
          </xsl:for-each>
        </fo:block>
      </fo:flow>
    </xsl:if>
    
    <xsl:if test="count(//table) &gt; 0">
      <fo:block padding-bottom="5pt">
        <fo:inline font-size="14pt" font-weight="bold">List of tables</fo:inline>
        <fo:leader leader-pattern=" " />
        <fo:inline font-size="10pt" text-align-last="region-end">Page</fo:inline>
      </fo:block>
      <fo:block padding-left="40pt" color="blue"  padding-bottom="15pt">
        <xsl:for-each select="//table">
          <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="{generate-id(.)}">
              <xsl:value-of select="count(preceding::table) + 1" />
              <fo:inline space-end="40pt"/>
              <xsl:value-of select="title" />
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="{generate-id(.)}" />
            </fo:basic-link>
          </fo:block>
        </xsl:for-each>
      </fo:block>
    </xsl:if>
    <xsl:if test="count(//preliminaryRqmts) &gt; 0">
      <fo:block padding-bottom="5pt">
        <fo:inline font-size="14pt" font-weight="bold">Table of preliminary requirements</fo:inline>
        <fo:leader leader-pattern=" " />
        <fo:inline font-size="10pt" text-align-last="region-end">Page</fo:inline>
      </fo:block>
      <fo:block padding-left="40pt" color="blue"  padding-bottom="15pt">
        <xsl:if test="//preliminaryRqmts">
          <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="reqPersons">
              1<fo:inline space-end="40pt"/>Required personnel
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="reqPersons" />
            </fo:basic-link>
          </fo:block>
          <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="supportEquipDescr">
              2<fo:inline space-end="40pt"/>Support equipment
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="supportEquipDescr" />
            </fo:basic-link>
          </fo:block>
          <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="supplyDescr">
              3<fo:inline space-end="40pt"/>Supplies
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="supplyDescr" />
            </fo:basic-link>
          </fo:block>
		  <fo:block text-align-last="justify">
            <fo:basic-link internal-destination="spareDescr">
              4<fo:inline space-end="40pt"/>Spares
              <fo:leader leader-pattern="dots" />
              <fo:page-number-citation ref-id="spareDescr" />
            </fo:basic-link>
          </fo:block>
        </xsl:if>
      </fo:block>
  </xsl:if>
    <xsl:if test="count(multimedia|//figure) &gt; 0">
    <fo:block padding-bottom="5pt">
      <fo:inline font-size="14pt" font-weight="bold">List of figures</fo:inline>
      <fo:leader leader-pattern=" " />
      <fo:inline font-size="10pt" text-align-last="region-end">Page</fo:inline>
    </fo:block>
    <fo:block padding-left="40pt" color="blue"  padding-bottom="15pt">
      <xsl:for-each select="//multimedia|//figure">
        <fo:block text-align-last="justify">
          <fo:basic-link internal-destination="{generate-id(.)}">
            <xsl:value-of select="count(preceding::graphic) + count(preceding::multimedia) + 1" />
            <fo:inline space-end="40pt"/>
            <xsl:value-of select="title" />
            <xsl:if test="graphic">
              <xsl:value-of select="JS:SetFigs(number(substring(@id,5)), count(preceding::graphic) + count(preceding::multimedia) + 1) "/>
            </xsl:if>
            <fo:leader leader-pattern="dots" />
            <fo:page-number-citation ref-id="{generate-id(.)}" />
          </fo:basic-link>
        </fo:block>
      </xsl:for-each>      
    </fo:block>
  </xsl:if>
  </fo:block>
</xsl:template>

<xsl:template match="content">
  <xsl:for-each select="description">
    <fo:block  xsl:use-attribute-sets="h2" font-style="bold" text-align="center" padding-bottom="5pt" >
      Description
    </fo:block>
    <fo:block  xsl:use-attribute-sets="h3" font-style="italic" text-align="center" padding-bottom="5pt" >
      Description of how it is made
    </fo:block>
    <xsl:apply-templates select="//levelledPara" />
   </xsl:for-each>

  <xsl:for-each select="procedure">
    <fo:block  xsl:use-attribute-sets="h3" font-style="italic" text-align="center" padding-bottom="5pt" >
      Preliminary requirements
    </fo:block>
    <xsl:apply-templates select="preliminaryRqmts" />
    <fo:block  xsl:use-attribute-sets="h3" font-style="bold" text-align="center" padding-bottom="5pt" >
      Procedure
    </fo:block>
    <xsl:apply-templates select="//proceduralStep" />
  </xsl:for-each>

  <xsl:apply-templates select="illustratedPartsCatalog" />
</xsl:template>

<xsl:template match="levelledPara">
  <fo:block padding-top="5pt" padding-bottom="5pt" text-align="justify">
        <fo:table><fo:table-column column-width="10%"/><fo:table-column column-width="90%"/><fo:table-body><fo:table-row>
        
        <xsl:choose>
          <xsl:when test="name(..) != 'levelledPara'">
            <fo:table-cell><xsl:value-of select="count(preceding-sibling::levelledPara) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::levelledPara)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../..) != 'levelledPara'">
            <fo:table-cell><xsl:value-of select="count(parent::*/preceding-sibling::*) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::levelledPara) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::levelledPara)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../../..) != 'levelledPara'">
            <fo:table-cell><xsl:value-of select="count(parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::levelledPara) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::levelledPara)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../../../..) != 'levelledPara'">
            <fo:table-cell><xsl:value-of select="count(parent::levelledPara/parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::levelledPara) + 1" /></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::levelledPara)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
		  <xsl:when test="name(../../../../..) != 'levelledPara'">
            <fo:table-cell><xsl:value-of select="count(parent::levelledPara/parent::levelledPara/parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(parent::levelledPara/parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
            <xsl:value-of select="count(parent::levelledPara/parent::levelledPara/preceding-sibling::levelledPara) + 1"/>.
			<xsl:value-of select="count(parent::levelledPara/preceding-sibling::levelledPara) + 1" />.
            <xsl:value-of select="count(preceding-sibling::levelledPara) + 1" /></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::levelledPara)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
        </xsl:choose>
        </fo:table-row></fo:table-body></fo:table>
  </fo:block>
</xsl:template>

<xsl:template match="internalRef">
  <fo:inline color="blue"> 
    <xsl:choose>
      <xsl:when test="@internalRefTargetType = 'hotspot'">
        <xsl:if test="name(parent::node()) != 'para'">
          <fo:basic-link internal-destination="{JS:GetHots(number(substring(@internalRefId, 23)))}">
            <xsl:value-of select="number(substring(@internalRefId,23))"/> 
          </fo:basic-link>
        </xsl:if>
      </xsl:when>
      <xsl:when test="@internalRefTargetType &gt; 9">
        <xsl:if test="name(parent::node()) = 'para'">
          <fo:basic-link internal-destination="tab_1">
            <fo:inline color="black"> Bicycle parts table and Fig <xsl:value-of select="number(substring(@internalRefId,5,4))"/></fo:inline> 
          </fo:basic-link>
        </xsl:if>
      </xsl:when>
      <xsl:when test="substring(@internalRefId,1,3)!='fig'">
        <xsl:variable name="superid" select="@internalRefId"/>
        <xsl:apply-templates select="//supportEquipDescr[@id=$superid]|//supplyDescr[@id=$superid]|//spareDescr[@id=$superid]"/>
      </xsl:when>
      <xsl:when test="substring(@internalRefId,1,3)='fig'">
        <xsl:if test="name(../../..) = 'description'">
          <fo:basic-link internal-destination="{concat('levelledPara', @internalRefId)}">
          Fig <xsl:value-of select="number(substring(@internalRefId,5))"/> 
          </fo:basic-link>
        </xsl:if>
        <xsl:if test="name(../../..) = 'proceduralStep'">
          <fo:basic-link internal-destination="{concat('proceduralStep', @internalRefId)}">
          Fig <xsl:value-of select="JS:GetFigs(number(substring(@internalRefId,5)))"/> 
          </fo:basic-link>
        </xsl:if>
      </xsl:when>
    </xsl:choose>
  </fo:inline>
</xsl:template>

<xsl:template match = "dmRef">
  <fo:inline color="blue"> 
    <xsl:choose>
      <xsl:when test="dmRefIdent/dmCode/@infoCode = '251'">
        <fo:basic-link internal-destination="251">
          Chapter 3.10.2
        </fo:basic-link>
      </xsl:when>
    </xsl:choose>
  </fo:inline>  
</xsl:template>

<xsl:template match="//supportEquipDescr|//supplyDescr|//spareDescr">
  <fo:inline>
    <fo:basic-link internal-destination="{@id}">
      <xsl:value-of select="name"/>
    </fo:basic-link>
  </fo:inline>
</xsl:template>

<xsl:template match="title">
 <fo:inline>
    <fo:basic-link internal-destination="{@id}">
      <xsl:value-of select="para"/>
    </fo:basic-link>
  </fo:inline>		
</xsl:template>

<xsl:template match="randomList">
  <xsl:value-of select="JS:SetRandomList(10)"/>
  <xsl:if test="name(parent::node()) = 'entry'">
    <xsl:value-of select="JS:SetRandomList(0)"/>
  </xsl:if>
  <fo:block padding-top="{JS:GetRandomList()}pt">
    <fo:table border-width="1pt">
      <fo:table-body start-indent="10pt">
        <xsl:for-each select="listItem">
          <fo:table-row padding-top="10pt">
            <fo:table-cell>
              <fo:block padding-bottom="10pt" >
              –<fo:inline space-end="15pt"/><xsl:value-of select="para"/>
              </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </xsl:for-each>
      </fo:table-body>
    </fo:table>
  </fo:block>
</xsl:template>

 <fo:list-item>
    <fo:list-item-label start-indent="1.0cm" 
                        end-indent="1.0cm">
      <fo:block>
        <xsl:value-of select="item"/>
       </fo:block>
    </fo:list-item-label>
    <fo:list-item-body start-indent="body-start()">
      <fo:block>
        <xsl:value-of select="para"/>
      </fo:block>
    </fo:list-item-body>
  </fo:list-item>				
<xsl:template match="multimedia|figure">
  <xsl:if test="multimediaObject">
    <fo:block text-align="center" id="{generate-id(.)}">
    </fo:block>
    <fo:block padding-bottom="15pt" text-align="center" font-style="italic">
      
    </fo:block>
  </xsl:if>
  <xsl:if test="graphic">
    <fo:block text-align="center" id="{generate-id(.)}" page-break-inside="avoid">
      <fo:external-graphic width="100%" content-height="100%" content-width="scale-to-fit" scaling="uniform" src="{concat(graphic/@infoEntityIdent,'.png')}">
      </fo:external-graphic>
      <xsl:variable name="id" select="concat(name(parent::node()), @id)"/>
      <xsl:for-each select="graphic/hotspot">
        <xsl:value-of select="JS:SetHots(number(substring(@applicationStructureIdent,4)), $id)"/>
      </xsl:for-each>
      <fo:block padding-bottom="15pt" text-align="center" font-style="italic" id="{concat(name(parent::node()), @id)}">
        Fig <xsl:value-of select="count(preceding::graphic) + count(preceding::multimedia) + 1" /><fo:inline space-end="5pt"/><xsl:value-of select="title"/>
      </fo:block>
    </fo:block>
  </xsl:if>
</xsl:template>

<xsl:template match="table">
  <fo:block id="{concat('tab_', count(preceding::table) + 1)}">
  </fo:block>
  <fo:block padding-bottom="5pt" padding-top="15pt" text-align="center" font-style="italic" id="{generate-id(.)}">
    Table <xsl:value-of select="count(preceding::table) + 1" /><fo:inline space-end="3pt"/><xsl:value-of select="title"/>
  </fo:block>
  <xsl:apply-templates select="tgroup"/>
</xsl:template>

<fo:flow>
    
	<fo:page-number-citation ref-id="last-page"/>
</fo:flow>

<fo:table-and-caption caption-side="bottom">
  <fo:table-caption>
    <fo:block font-weight="bold"
              font-family="Helvetica, Arial, sans"
              font-size="12pt">
      Table <xsl:value-of select="count(preceding::table) + 1" /><fo:inline space-end="3pt"/><xsl:value-of select="title"/> 
    </fo:block>
  </fo:table-caption>
    <fo:table>
        <!-- table contents go here -->
    </fo:table>
	<fo:table>
		<fo:table-header>
			<fo:table-cell>
				<fo:block font-family="Helvetica, Arial, sans"
					font-size="11pt" font-weight="bold">
				<xsl:value-of select="count(preceding::table)" /><fo:inline space-end="3pt"/><xsl:value-of select="para"/> 
				</fo:block>
			</fo:table-cell>
		</fo:table-header>
	</fo:table>
</fo:table-and-caption>

<xsl:template match="tgroup">
  <fo:table-and-caption >
    <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
      <xsl:for-each select="colspec">
        <fo:table-column column-width="{@colwidth}"/>
      </xsl:for-each>

      <fo:table-header >
        <fo:table-row  row-height="40pt" >
          <xsl:for-each select="thead/row/entry">
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt"><xsl:value-of select="para"/></fo:block>
            </fo:table-cell>
          </xsl:for-each>
        </fo:table-row>
      </fo:table-header>

      <fo:table-body>
        <xsl:for-each select="tbody/row">
          <fo:table-row >
            <xsl:for-each select="entry">
              <fo:table-cell>
                <fo:block padding-top="10pt" ><xsl:apply-templates select="@*|node()"/></fo:block>
              </fo:table-cell>
            </xsl:for-each>
          </fo:table-row>
        </xsl:for-each>
      </fo:table-body>
    </fo:table>
  </fo:table-and-caption>
</xsl:template>


<xsl:template match="preliminaryRqmts">
  <fo:block  xsl:use-attribute-sets="h3">
    Required personnel
  </fo:block>
  <fo:block padding-bottom="5pt" padding-top="10pt" text-align="center" font-style="italic" id="reqPersons">
    Table 1 Requirement personnel
  </fo:block>
  <fo:table-and-caption >  
    <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="100pt"/>

      <fo:table-header >
        <fo:table-row  row-height="40pt" >
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Person</fo:block>
            </fo:table-cell>
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Category/Trade</fo:block>
            </fo:table-cell>
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Skill Level</fo:block>
            </fo:table-cell>
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Trade Code</fo:block>
            </fo:table-cell>
            <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Estimated Time</fo:block>
            </fo:table-cell>
        </fo:table-row>
      </fo:table-header>

      <fo:table-body>
        <xsl:for-each select="reqPersons">
            <xsl:for-each select="person">
              <fo:table-row > 
              <fo:table-cell >
                <fo:block  padding-top="5pt" >Man <xsl:value-of select="@man"/></fo:block>
              </fo:table-cell>
              <fo:table-cell >
                <fo:block  padding-top="5pt" ><xsl:value-of select="personCategory/@personCategoryCode"/></fo:block>
              </fo:table-cell>
              <fo:table-cell >
                <fo:block  padding-top="5pt" ></fo:block>
              </fo:table-cell>
              <fo:table-cell >
                <fo:block  padding-top="5pt" ><xsl:value-of select="trade"/></fo:block>
              </fo:table-cell>
              <fo:table-cell >
                <fo:block  padding-top="5pt" ><xsl:value-of select="estimatedTime"/> <xsl:value-of select="estimatedTime/@unitOfMeasure"/></fo:block>
              </fo:table-cell>
            </fo:table-row>
          </xsl:for-each>
        </xsl:for-each>
      </fo:table-body>
    </fo:table>    
  </fo:table-and-caption>

  <fo:block  xsl:use-attribute-sets="h3">
    Support equipment
  </fo:block>
  <fo:block page-break-inside="avoid">
    <fo:block padding-bottom="5pt" padding-top="10pt" text-align="center" font-style="italic" id="supportEquipDescr">
      Table 2 Support equipment
    </fo:block>
    <fo:table-and-caption >  
      <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="80pt"/>
        <fo:table-column column-width="50pt"/>
        
        <fo:table-header >
          <fo:table-row  row-height="40pt" >
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Nomenclature</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Identification No.</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Qty</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Remarks</fo:block>
              </fo:table-cell>
          </fo:table-row>
        </fo:table-header>

        <fo:table-body>
          <xsl:for-each select="reqSupportEquips/supportEquipDescrGroup">
            <xsl:for-each select="supportEquipDescr">
              <fo:table-row >
                <fo:table-cell >
                  <fo:block  padding-top="5pt"  id="{@id}"><xsl:value-of select="name"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" >NSCM: <xsl:value-of select="identNumber/manufacturerCode"/></fo:block>
                  <fo:block  padding-top="5pt" >Pt. No.: <xsl:value-of select="identNumber/partAndSerialNumber/partNumber"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ><xsl:value-of select="reqQuantity"/> <xsl:value-of select="reqQuantity/@unitOfMeasure"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ></fo:block>
                </fo:table-cell>
              </fo:table-row>
            </xsl:for-each>
          </xsl:for-each>
        </fo:table-body>
      </fo:table>    
    </fo:table-and-caption>
  </fo:block>

  <fo:block page-break-inside="avoid">
    <fo:block  xsl:use-attribute-sets="h3">
      Consumables, materials and expendables
    </fo:block>
    <fo:block padding-bottom="5pt" padding-top="10pt" text-align="center" font-style="italic" id="supplyDescr">
      Table 3 Supplies
    </fo:block>
    <fo:table-and-caption >  
      <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="80pt"/>
        <fo:table-column column-width="50pt"/>
        
        <fo:table-header >
          <fo:table-row  row-height="40pt" >
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Nomenclature</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Identification No.</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Qty</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Remarks</fo:block>
              </fo:table-cell>
          </fo:table-row>
        </fo:table-header>

        <fo:table-body>
          <xsl:for-each select="reqSupplies/supplyDescrGroup">
            <xsl:for-each select="supplyDescr">
              <fo:table-row >
                <fo:table-cell >
                  <fo:block  padding-top="5pt"  id="{@id}"><xsl:value-of select="name"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" >NSCM: <xsl:value-of select="identNumber/manufacturerCode"/></fo:block>
                  <fo:block  padding-top="5pt" >Pt. No.: <xsl:value-of select="identNumber/partAndSerialNumber/partNumber"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ><xsl:value-of select="reqQuantity"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ></fo:block>
                </fo:table-cell>
              </fo:table-row>
            </xsl:for-each>
          </xsl:for-each>
        </fo:table-body>
      </fo:table>    
    </fo:table-and-caption>
  </fo:block>
  <fo:block page-break-inside="avoid">
    <fo:block  xsl:use-attribute-sets="h3">
       Replacement Parts/Items
    </fo:block>
    <fo:block padding-bottom="5pt" padding-top="10pt" text-align="center" font-style="italic" id="spareDescr">
      Table 4 Spares
    </fo:block>
    <fo:table-and-caption >  
      <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="200pt"/>
        <fo:table-column column-width="80pt"/>
        <fo:table-column column-width="50pt"/>
        
        <fo:table-header >
          <fo:table-row  row-height="40pt" >
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Nomenclature</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Identification No.</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Qty</fo:block>
              </fo:table-cell>
              <fo:table-cell  border-top="0.1mm solid" border-bottom="0.1mm solid">
                <fo:block font-weight="bold" padding-top="5pt" padding-bottom="5pt">Remarks</fo:block>
              </fo:table-cell>
          </fo:table-row>
        </fo:table-header>

        <fo:table-body>
          <xsl:for-each select="reqSpares/spareDescrGroup">
            <xsl:for-each select="spareDescr">
              <fo:table-row >
                <fo:table-cell >
                  <fo:block  padding-top="5pt"  id="{@id}"><xsl:value-of select="name"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" >NSCM: <xsl:value-of select="identNumber/manufacturerCode"/></fo:block>
                  <fo:block  padding-top="5pt" >Pt. No.: <xsl:value-of select="identNumber/partAndSerialNumber/partNumber"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ><xsl:value-of select="reqQuantity"/></fo:block>
                </fo:table-cell>
                <fo:table-cell >
                  <fo:block  padding-top="5pt" ></fo:block>
                </fo:table-cell>
              </fo:table-row>
            </xsl:for-each>
          </xsl:for-each>
        </fo:table-body>
      </fo:table>    
    </fo:table-and-caption>
  </fo:block>  
</xsl:template>


<xsl:template match="proceduralStep">
  <fo:block padding-top="5pt" padding-bottom="5pt" text-align="justify">
        <fo:table><fo:table-column column-width="10%"/><fo:table-column column-width="90%"/><fo:table-body><fo:table-row>
        
        <xsl:choose>
          <xsl:when test="name(..) != 'proceduralStep'">
            <fo:table-cell><xsl:value-of select="count(preceding-sibling::proceduralStep) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::proceduralStep)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../..) != 'proceduralStep'">
            <fo:table-cell><xsl:value-of select="count(parent::*/preceding-sibling::*) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::proceduralStep) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::proceduralStep)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../../..) != 'proceduralStep'">
            <fo:table-cell><xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::proceduralStep) + 1"/></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::proceduralStep)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
          <xsl:when test="name(../../../..) != 'proceduralStep'">
            <fo:table-cell><xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(preceding-sibling::proceduralStep) + 1" /></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::proceduralStep)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
		  <xsl:when test="name(../../../../..) != 'proceduralStep'">
            <fo:table-cell><xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
            <xsl:value-of select="count(parent::proceduralStep/parent::proceduralStep/preceding-sibling::proceduralStep) + 1"/>.
			<xsl:value-of select="count(parent::proceduralStep/preceding-sibling::proceduralStep) + 1" />.
            <xsl:value-of select="count(preceding-sibling::proceduralStep) + 1" /></fo:table-cell><fo:table-cell>
			<xsl:value-of select="title"/>
            <xsl:for-each select="."><xsl:apply-templates select="@*|node()[not(self::proceduralStep)]"/></xsl:for-each></fo:table-cell>
          </xsl:when>
        </xsl:choose>
        </fo:table-row></fo:table-body></fo:table>
  </fo:block>
</xsl:template>

<xsl:template match="caution">
  <fo:block  text-align="center" color="red" font-weight="bold" font-size="14" padding-top="7pt" padding-bottom="7pt">CAUTION</fo:block>
  <fo:block text-align="justify" font-weight="bold" color="red" padding-top="7pt" padding-bottom="7pt"><xsl:for-each select="warningAndCautionPara"><xsl:apply-templates select="@*|node()"/></xsl:for-each></fo:block>  
</xsl:template>

<xsl:template match="warning">
  <fo:block  text-align="center" color="crimson" font-weight="bold" font-size="14" padding-top="7pt" padding-bottom="7pt">WARNING</fo:block>
  <fo:block text-align="justify" font-weight="bold" color="crimson" padding-top="7pt" padding-bottom="7pt"><xsl:for-each select="warningAndCautionPara"><xsl:apply-templates select="@*|node()"/></xsl:for-each></fo:block>  
</xsl:template>

<xsl:template match="note">
  <fo:block  text-align="center" font-weight="bold" font-size="14" padding-top="7pt" padding-bottom="7pt">NOTE</fo:block>
  <fo:block text-align="justify" font-weight="bold" padding-top="7pt" padding-bottom="7pt"><xsl:for-each select="notePara"><xsl:apply-templates select="@*|node()"/></xsl:for-each></fo:block>  
</xsl:template>

<xsl:template match="illustratedPartsCatalog">
  <xsl:apply-templates select="figure"/>
  <!--<fo:block  xsl:use-attribute-sets="h3">
    Required personnel
  </fo:block>
  <fo:block padding-bottom="5pt" padding-top="10pt" text-align="center" font-style="italic" id="reqPersons">
    Table 1 Requirement personnel
  </fo:block>-->
  <fo:block >
  <fo:table-and-caption >  
    <fo:table border-top="0.1mm solid" border-bottom="0.1mm solid">
      <fo:table-column column-width="30pt"/>
      <fo:table-column column-width="30pt"/>
      <fo:table-column column-width="60pt"/>
      <fo:table-column column-width="60pt"/>
      <fo:table-column column-width="150pt"/>
      <fo:table-column column-width="200pt"/>
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="20pt"/>

      <fo:table-header >
        <fo:table-row  row-height="40pt" >
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="5pt">Fig</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="5pt">Item</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="1pt">Units per</fo:block>
              <fo:block padding-top="1pt" padding-bottom="1pt">assembly/</fo:block>
              <fo:block padding-top="1pt" padding-bottom="1pt">Unit of</fo:block>
              <fo:block padding-top="1pt" padding-bottom="5pt">issue</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="5pt">NCAGE</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="1pt">Part No.</fo:block>
              <fo:block padding-top="1pt" padding-bottom="5pt">NATO stock No.</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="5pt">Nomenclature</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="1pt">* Usable on</fo:block>
              <fo:block padding-top="5pt" padding-bottom="1pt">code assy</fo:block>
              <fo:block padding-top="1pt" padding-bottom="5pt">• MV/Effect</fo:block>
            </fo:table-cell>
            <fo:table-cell display-align="after" border-top="0.1mm solid" border-bottom="0.1mm solid">
              <fo:block padding-top="5pt" padding-bottom="1pt">I</fo:block>
              <fo:block padding-top="1pt" padding-bottom="1pt">C</fo:block>
              <fo:block padding-top="1pt" padding-bottom="5pt">Y</fo:block>
            </fo:table-cell>
        </fo:table-row>
      </fo:table-header>

      <xsl:variable name="id" select="number(substring(figure/@id,5))"/>
      <fo:table-body>
          <fo:table-row >
            <fo:table-cell>
              <fo:block padding-top="5pt" padding-bottom="5pt"><xsl:value-of select="$id"/></fo:block>
            </fo:table-cell>
          </fo:table-row>
          <xsl:for-each select="catalogSeqNumber">
            <xsl:for-each select="itemSequenceNumber">
              <fo:table-row >
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt"></fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    <xsl:value-of select="substring(../@catalogSeqNumberValue, 1)"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    <xsl:value-of select="quantityPerNextHigherAssy"/>
                    <xsl:value-of select="partIdentSegment/unitOfIssue"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    <xsl:value-of select="manufacturerCode"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    <xsl:value-of select="partNumber"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    <xsl:value-of select="substring('• • • ', 1, (number(@indenture)-1)*2)"/>
                     <xsl:value-of select="partIdentSegment/descrForPart"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block padding-top="5pt" padding-bottom="5pt">
                    • <xsl:value-of select="locationRcmdSegment/locationRcmd/modelVersion/@modelVersionValue"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </xsl:for-each>
          </xsl:for-each>
      </fo:table-body>
    </fo:table>    
  </fo:table-and-caption>
  </fo:block>
</xsl:template>

</xsl:stylesheet> 