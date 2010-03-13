<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 2, 2008 at 6:43:34 pm</time-stamp>


<class>
<name>GiveFoodEvent</name>
<environment>OregonTrail</environment>
<super>OregonTrail.Event</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.GiveFoodEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := GiveFoodEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.GiveFoodEvent</class-id>
<body>gives food. indians are pretty awesome like that</body>
</comment>

<methods>
<class-id>OregonTrail.GiveFoodEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	"gives between 10-100 food to wagon"
	|rand food toGive|
	rand := Random new.
	food := wagon inventory at: 'Food'.
	toGive := ((rand next * 90) + 10) truncated.
	food quantity: food quantity + toGive.
	^'First Nation hunting party feels sorry for you, gives you ',toGive printString,' food'.</body>
</methods>

</st-source>
