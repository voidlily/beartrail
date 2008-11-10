<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 10, 2008 at 2:30:14 pm</time-stamp>


<class>
<name>Event</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon value </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Event class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Event</class-id>
<body>Events run methods will return a boolean - true if event was successful, false if it couldn't happen. If all events in EventFactory's queue return false, don't display the error message

Subclasses must implement the following messages:
	initialize-release
		run

Instance Variables:
	wagon	&lt;Wagon&gt;	description of wagon

</body>
</comment>

<methods>
<class-id>OregonTrail.Event</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="isValid">isValid</body>

<body package="OregonTrail" selector="run">run
	^self subclassResponsibility</body>
</methods>

<methods>
<class-id>OregonTrail.Event</class-id> <category>accessing</category>

<body package="OregonTrail" selector="value">value
	^value</body>

<body package="OregonTrail" selector="value:">value: anObject
	value := anObject</body>

<body package="OregonTrail" selector="wagon">wagon
	^wagon</body>

<body package="OregonTrail" selector="wagon:">wagon: anObject
	wagon := anObject</body>
</methods>

</st-source>
