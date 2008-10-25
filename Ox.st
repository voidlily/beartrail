<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 24, 2008 at 8:38:15 pm</time-stamp>


<class>
<name>Ox</name>
<environment>OregonTrail</environment>
<super>OregonTrail.Item</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>health </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<comment>
<class-id>OregonTrail.Ox</class-id>
<body>Ox is one of many oxen a settler or pioneer on the Oregon Trail may bring along with him or her.  Is essentially an Item with health.

health   &lt;Symbol&gt;   This ox's health - #good, #fair, #poor, #dead.

</body>
</comment>

<methods>
<class-id>OregonTrail.Ox</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.Ox</class-id> <category>accessing</category>

<body package="OregonTrail" selector="health">health
	"Returns the health of this ox."

	^health.</body>

<body package="OregonTrail" selector="health:">health: aSymbol
	"Changes this ox's health, for better or worse."

	health := aSymbol.</body>
</methods>

</st-source>
