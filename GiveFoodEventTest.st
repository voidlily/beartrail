<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:13:43 am</time-stamp>


<class>
<name>GiveFoodEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon event food </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.GiveFoodEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.GiveFoodEventTest</class-id>
<body>Giving food is good, so is testing it

Instance Variables:
	event	&lt;AuxCodeInfoExtractor | CodeRegenerator | Event | InputState | LintRule | Smalllint | SmalllintChecker | SmalllintCodeTool | TestCase | TestSuite&gt;	description of event
	food	&lt;Item&gt;	description of food
	wagon	&lt;Wagon&gt;	description of wagon

</body>
</comment>

<methods>
<class-id>OregonTrail.GiveFoodEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.GiveFoodEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	"Prepares necessary data structures for testing."

    wagon := Wagon populate: 1.
    food := Item populate: 'Food' wagon: wagon wagon_id.
    food quantity: 0.
    wagon inventory at: 'Food' put: food.
    event := GiveFoodEvent for: wagon value: 20.</body>
</methods>

<methods>
<class-id>OregonTrail.GiveFoodEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of GiveFoodEvent."

    self assert: ((wagon inventory at: 'Food') quantity = 0).
    event run.
    self assert: ((wagon inventory at: 'Food') quantity &gt; 0).</body>
</methods>

</st-source>
