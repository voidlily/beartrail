<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 23, 2008 at 12:45:29 pm</time-stamp>


<class>
<name>OxenDeathEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon event </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.OxenDeathEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.OxenDeathEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.OxenDeathEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	"Creates necessary data structures for testing."

	|oxen|
    wagon := Wagon create.
    oxen := Item populate: 'Oxen' wagon: wagon wagon_id.
    oxen quantity: 2.
    wagon inventory at: 'Oxen' put: oxen.
    event := OxenDeathEvent for: wagon value: 20.</body>
</methods>

<methods>
<class-id>OregonTrail.OxenDeathEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of OxenDeathEvent."

	self assert: ((wagon inventory at: 'Oxen') quantity == 2).
     event run.
     self assert: ((wagon inventory at: 'Oxen') quantity == 1).</body>
</methods>

</st-source>