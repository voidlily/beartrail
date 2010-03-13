<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:09:05 pm</time-stamp>


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
<body>Events run methods will return a result string (to be displayed by Dialog warn: or checkec against nil) or nil if the event doesn't happen. Constructors for Event subclasses take a wagon and a value. The value is a nonzero number that some events care about, such as health change. For that event, if the value is positive, someone gets better, and if the value is negative, a person gets worse.

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
	"abstract method - command pattern, as all subclasses have a run method"
	^self subclassResponsibility</body>
</methods>

<methods>
<class-id>OregonTrail.Event</class-id> <category>accessing</category>

<body package="OregonTrail" selector="value">value
	"a value used by some events - in some events, a negative value means something different from a positive value"
	^value</body>

<body package="OregonTrail" selector="value:">value: anObject
	value := anObject</body>

<body package="OregonTrail" selector="wagon">wagon
	^wagon</body>

<body package="OregonTrail" selector="wagon:">wagon: anObject
	wagon := anObject</body>
</methods>

</st-source>
