<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 8:25:47 pm</time-stamp>


<class>
<name>StolenItemEventTest</name>
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
<class-id>OregonTrail.StolenItemEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.StolenItemEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.StolenItemEventTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
    "Sets up required data structures and initializes the data needed for testing."
  
    wagon := Wagon populate: 1.
    event := StolenItemEvent for: wagon value: 20.</body>
</methods>

<methods>
<class-id>OregonTrail.StolenItemEventTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testRun">testRun
    "Tests the run method of StolenItemEventTest."

    |keys|
    keys := wagon inventory keys.
    keys do:[:k | (wagon inventory at: k) quantity: 0].
    self deny: event run.

    wagon inventory: Dictionary new.
    wagon inventory at: 'Money' put: (Item populate: 'Money' wagon: wagon wagon_id).

    self assert: ((wagon inventory at: 'Money') quantity = 500).
    self assert: event run.
    self assert: ((wagon inventory at: 'Money') quantity &lt; 500).

    wagon inventory: Dictionary new.
    wagon inventory at: 'Wheel' put: (Item populate: 'Wheel' wagon: wagon wagon_id).

    self assert: ((wagon inventory at: 'Wheel') quantity = 1).
    self assert: event run.
    self assert: ((wagon inventory at: 'Wheel') quantity = 0).

    wagon inventory: Dictionary new.
    wagon inventory at: 'Axle' put: (Item populate: 'Axle' wagon: wagon wagon_id).

    self assert: ((wagon inventory at: 'Axle') quantity = 2).
    self assert: event run.
    self assert: ((wagon inventory at: 'Axle') quantity = 1).

    wagon inventory: Dictionary new.
    wagon inventory at: 'Tongue' put: (Item populate: 'Tongue' wagon: wagon wagon_id).

    self assert: ((wagon inventory at: 'Tongue') quantity = 3).
    self assert: event run.
    self assert: ((wagon inventory at: 'Tongue') quantity = 2).</body>
</methods>

</st-source>
