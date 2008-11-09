<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 9, 2008 at 1:35:26 pm</time-stamp>


<class>
<name>GameData</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon profession route turnsTaken milesTraveled currentDate lastLocation gameEnd gameWon wagon_id </inst-vars>
<class-inst-vars>instance </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.GameData class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="instance">instance
	instance ifNil:[instance := self basicNew initialize.].
	^instance</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: wagon_id

	| conn sess ans result gamedata |
	gamedata := GameData new.
	gamedata wagon_id: wagon_id.
	conn := DBInfo connection.
		[conn connect.
		sess := conn getSession.
		sess prepare: 'SELECT prof_id, route, turns_taken, miles_traveled, date_format(date,"%M %e, %Y"), last_location from gamedata where wagon_id = ', wagon_id, ';'.
		sess bindInput: (Array with: 'SELECT').
		sess execute.
		ans := sess answer.
		[ans = #noMoreAnswers] whileFalse:
		     [ans = #noAnswerStream ifFalse: [result := ans upToEnd].
		     ans := sess answer]]
		ensure: [conn disconnect].

	result isEmpty ifFalse:
		[gamedata wagon: (Wagon populate: wagon_id);
			"profession: ((result at: 1) at: 2);"
			route: ((result at: 1) at: 2);
			milesTraveled: ((result at: 1) at: 3);
			currentDate: (Date readFrom: ((result at: 1) at: 4));
			lastLocation: ((result at: 1) at: 5)].
	^gamedata</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.GameData</class-id>
<body>This class is used to represent the state of the game, such that when saving or loading conditions such as location, inventory, and party are persistent.

wagon   &lt;Wagon&gt;   The player's wagon.
profession   &lt;Profession&gt;   The lead character's profession.
route   &lt;Symbol&gt;
turnsTaken   &lt;Integer&gt;   Days elapsed since the journey began.
milesTraveled   &lt;Integer&gt;   How many miles the player has traveled.
currentDate   &lt;Date&gt;
lastLocation   &lt;Location&gt;   Which major location the player was at last.
gameEnd    &lt;Boolean&gt;   Has the game ended - true if it has, false otherwise.
gameWon   &lt;Boolean&gt;   Has the game been won - true if the player successfully made it, false otherwise.

</body>
</comment>

<methods>
<class-id>OregonTrail.GameData</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.GameData</class-id> <category>accessing</category>

<body package="OregonTrail" selector="currentDate">currentDate
     "Returns the current date in this game."

	^self currentDate.</body>

<body package="OregonTrail" selector="currentDate:">currentDate: newDate
     "Sets the date."

	currentDate := newDate.</body>

<body package="OregonTrail" selector="gameEnd">gameEnd
	"Returns true if the game has ended; false otherwise."

	^self gameEnd.</body>

<body package="OregonTrail" selector="gameEnd:">gameEnd: anObject
	gameEnd := anObject</body>

<body package="OregonTrail" selector="gameWon">gameWon
    "Returns whether the game has been won."

	^self gameWon.</body>

<body package="OregonTrail" selector="gameWon:">gameWon: anObject
	gameWon := anObject</body>

<body package="OregonTrail" selector="lastLocation">lastLocation
	"Returns the last major location the player was at in this game."

	^self lastLocation.</body>

<body package="OregonTrail" selector="lastLocation:">lastLocation: lastPlace
	"Sets the last major location the player was at in this game."

	lastLocation := lastPlace.</body>

<body package="OregonTrail" selector="milesTraveled">milesTraveled
	"Returns the number of miles that have been traveled in this game."

	^self milesTraveled.</body>

<body package="OregonTrail" selector="milesTraveled:">milesTraveled: numberOfMiles
	"Sets the number of miles that have been traveled in this game."

	milesTraveled := numberOfMiles.</body>

<body package="OregonTrail" selector="profession">profession
	"Returns the lead character's profession."

	^self profession.</body>

<body package="OregonTrail" selector="profession:">profession: newProfession
	"The lead character's profession is set."

	profession := newProfession.</body>

<body package="OregonTrail" selector="route">route
	"Returns the route."

	^self route.</body>

<body package="OregonTrail" selector="route:">route: aSymbol
	"Sets the route."

	route := aSymbol.</body>

<body package="OregonTrail" selector="save">save
	| conn sess |
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: 'UPDATE gamedata set (route, turns_taken, miles_traveled, date, last_location, game_end, game_won) values ("', (route printString), '", "', (turnsTaken printString), '", str_to_date("', (currentDate printString), '", "%M %e, %Y")',  (lastLocation printString), '", "', (gameEnd printString), '", "', (gameWon printString), '") where wagon_id = "', wagon_id, '";'.
	sess execute.
	sess answer.]
	     ensure: [conn disconnect].

	wagon save: wagon_id.</body>

<body package="OregonTrail" selector="turnsTaken">turnsTaken
	"Returns the number of days elapsed since the journey for this game began (turns taken)."

	^self turnsTaken.</body>

<body package="OregonTrail" selector="turnsTaken:">turnsTaken: numberOfTurns
	"Sets the elapsed number of days (turns) taken for this game."

	turnsTaken := numberOfTurns.</body>

<body package="OregonTrail" selector="wagon">wagon
	"Returns the player's wagon."

	^self wagon.</body>

<body package="OregonTrail" selector="wagon:">wagon: aWagon
	"Sets this game's wagon."

	wagon := aWagon.</body>

<body package="OregonTrail" selector="wagon_id">wagon_id
	^wagon_id</body>

<body package="OregonTrail" selector="wagon_id:">wagon_id: anObject
	wagon_id := anObject</body>
</methods>

</st-source>
