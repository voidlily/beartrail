<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 2, 2008 at 12:01:36 am</time-stamp>


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

<body package="OregonTrail" selector="huntingEvent:">huntingEvent: aWagon</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="randomEvent:">randomEvent: aWagon</body>
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
