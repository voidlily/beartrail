<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 24, 2008 at 8:38:20 pm</time-stamp>


<class>
<name>Person</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name daysStarving health fedState </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Person class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="named:">named: aName
	|newPerson| newPerson := Person new.
	newPerson name: aName.
	^newPerson</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Person</class-id>
<body>A wagon holds a number of people. The Person class keeps track of the person's name and health status.

Instance Variables:
	daysStarving	&lt;Integer&gt;	how many days the person has gone without eating. 2 days means the person is starving. If starving for more than 10 days, the person dies.
	fedState	&lt;Symbol&gt;	current eating status (#wellFed,#meager,#starving)
	health	&lt;Symbol&gt;	how healthy the person is (#good,#fair,#poor,#dead)
	name	&lt;String&gt;		the person's name

</body>
</comment>

<methods>
<class-id>OregonTrail.Person</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	name := nil.
	daysStarving := 0.
	health := #good.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.Person</class-id> <category>accessing</category>

<body package="OregonTrail" selector="daysStarving">daysStarving
	^daysStarving</body>

<body package="OregonTrail" selector="daysStarving:">daysStarving: numDaysStarving
	daysStarving := numDaysStarving.
	numDaysStarving &lt; 0 ifTrue:[daysStarving:=0].
	self changed: #daysStarving.</body>

<body package="OregonTrail" selector="health">health
	^health</body>

<body package="OregonTrail" selector="health:">health: aSymbol
	health := aSymbol.
	self changed: #health.</body>

<body package="OregonTrail" selector="isDead">isDead
	^health=#dead</body>

<body package="OregonTrail" selector="isStarving">isStarving
	^daysStarving&gt;2</body>

<body package="OregonTrail" selector="name">name
	^name</body>

<body package="OregonTrail" selector="name:">name: aName
	name := aName.
	self changed: #name.</body>
</methods>

<methods>
<class-id>OregonTrail.Person</class-id> <category>printing</category>

<body package="OregonTrail" selector="printString">printString
	"Example string: 'Bob, #good 2 days starving'"
	^(name, ' ', health printString, ' ', daysStarving printString, ' days starving')</body>
</methods>

<methods>
<class-id>OregonTrail.Person</class-id> <category>changing</category>

<body package="OregonTrail" selector="eat:">eat: aRation
	self health = #dead ifTrue:[^self].
	aRation = #none ifTrue:[self daysStarving: self daysStarving+2]. "not eating should hurt a lot"
	aRation = #bareBones ifTrue:[self daysStarving: self daysStarving+1].
	aRation = #meager ifTrue:[self daysStarving: self daysStarving+0].
	(aRation = #normal) &amp; (daysStarving&gt;0) ifTrue:[self daysStarving: self daysStarving-1]. "should give the player a huge motivation to eat well"
	(aRation = #wellFed) &amp; (daysStarving&gt;-0) ifTrue:[self daysStarving: self daysStarving-2].
	daysStarving&gt;10 ifTrue:[self health: #dead. self daysStarving: 10].</body>
</methods>

</st-source>
