<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 17, 2008 at 9:25:18 am</time-stamp>


<class>
<name>GiveFoodEventTest</name>
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
<class-id>OregonTrail.GiveFoodEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


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

    wagon := Wagon create.
    event := GiveFoodEvent for: wagon value: 20.</body>
</methods>

<methods>
<class-id>OregonTrail.GiveFoodEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
	"Tests the run method of GiveFoodEvent."

    self assert: ((wagon inventory at: 'Food') quantity = 0).
    event run.
    self deny: ((wagon inventory at: 'Food') quantity = 0).</body>
</methods>

</st-source>
