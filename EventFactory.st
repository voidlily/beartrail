<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 30, 2008 at 1:45:50 pm</time-stamp>


<class>
<name>EventFactory</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
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
<class-id>OregonTrail.EventFactory class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="huntingEvent:">huntingEvent: aWagon
	|event|
	event := HuntingEvent for: aWagon value: 0.
	event run.</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="randomEvent:">randomEvent: aWagon
	"needs populate methods - select random row - test for nonzero value for each column - if true, make that kind of event and run"
	"return the replaced string for the event generation code in UI to dialog warn the results"
	"on that note, might need to refactor the methods to instead of returning booleans to return the replaced result string"
	"have to look into that though"</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.EventFactory</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

</st-source>
