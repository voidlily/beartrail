<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 23, 2008 at 12:44:59 pm</time-stamp>


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

	wagon := Wagon create.
    event := HealthChangeEvent for: wagon value:1.
    person := Person named: 'Jack'.</body>
</methods>

<methods>
<class-id>OregonTrail.HealthChangeEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of HealthChangeEvent."

	person health: #fair.
     event run.
     self assert: person health == #good.
     person health: #poor.
     event run.
     self assert: person health == #fair.

    event := HealthChangeEvent for: wagon value: -1.
    person health: #good.
    event run.
    self assert: person health == #fair.
    person health: #fair.
    event run.
    self assert: person health == #poor. </body>
</methods>

</st-source>
