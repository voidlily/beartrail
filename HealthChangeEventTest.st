<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 26, 2008 at 4:00:18 pm</time-stamp>


<class>
<name>HealthChangeEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon event person </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.HealthChangeEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.HealthChangeEventTest</class-id>
<body>Tests health change event

Instance Variables:
	event	&lt;AuxCodeInfoExtractor | CodeRegenerator | Event | InputState | LintRule | Smalllint | SmalllintChecker | SmalllintCodeTool | TestCase | TestSuite&gt;	description of event
	person	&lt;Person&gt;	description of person
	wagon	&lt;Wagon&gt;	description of wagon

</body>
</comment>

<methods>
<class-id>OregonTrail.HealthChangeEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.HealthChangeEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	"Creates necessary data structures for testing."

    wagon := Wagon populate: 1.
    wagon people: OrderedCollection new.
    event := HealthChangeEvent for: wagon value:1.
    person := Person named: 'Jack'.
    person health: #poor.
    wagon addPerson: person.</body>
</methods>

<methods>
<class-id>OregonTrail.HealthChangeEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of HealthChangeEvent."

     self assert: person health == #poor.
     self assert: event run.
     self assert: person health == #fair.
     self assert: event run.
     self assert: person health == #good.
     self deny: event run.     
     person health: #dead.
     self deny: event run.

    event := HealthChangeEvent for: wagon value: -1.
    person health: #good.
    self assert: event run.
    self assert: person health == #fair.
    self assert: event run.
    self assert: person health == #poor.
    self deny: event run.
    person health: #dead.
    self deny: event run.</body>
</methods>

</st-source>
