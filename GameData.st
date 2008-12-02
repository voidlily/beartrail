<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:09:42 pm</time-stamp>


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

<body package="OregonTrail" selector="discard">discard
    "Dumps the current instance of GameData by setting instance to nil."

    instance := nil.</body>

<body package="OregonTrail" selector="gamesForUser:">gamesForUser: user_id
	"using DB queries, returns an OrderedCollection for all games owned by a specific user"
	| query result games |
	games := OrderedCollection new.
	query := 'SELECT prof_id, route, turns_taken, miles_traveled, date_format(date,"%M %e, %Y"), last_location, wagon_id from gamedata where user_id = ', user_id printString, ' and game_end = 0;'.
	result := DBManager selectQuery: query.
	result do:
		[:x | games add: GameData new.
			(games at: games size) wagon: (Wagon populate: (x at: 7));
			profession: (Profession populate: (x at: 1));
			route: (x at: 2) asSymbol;
			turnsTaken: (x at: 3);
			milesTraveled: (x at: 4);
			currentDate: (Date readFrom: (x at: 5) readStream);
			lastLocation: (x at: 6).].
	^games.</body>

<body package="OregonTrail" selector="instance">instance
	"singleton implementation"
	instance ifNil:[instance := self basicNew initialize.].
	^instance</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: wagon_id
	"gets game data from database and assigns to singleton instance"
	| query result gamedata |
	gamedata := GameData new.
	gamedata wagon_id: wagon_id.
	query := 'SELECT prof_id, route, turns_taken, miles_traveled, date_format(date,"%M %e, %Y"), last_location, game_end, game_won from gamedata where wagon_id = ', wagon_id printString, ';'.
	result := DBManager selectQuery: query.

	result isEmpty ifFalse:
		[gamedata wagon: (Wagon populate: wagon_id);
			profession: (Profession populate: ((result at: 1) at: 1));
			route: ((result at: 1) at: 2) asSymbol;
			turnsTaken: ((result at: 1) at: 3);
			milesTraveled: ((result at: 1) at: 4);
			currentDate: (Date readFrom: ((result at: 1) at: 5) readStream);
			lastLocation: ((result at: 1) at: 6);
			gameEnd: ((result at: 1) at: 7);
			gameWon: ((result at: 1) at: 8)].
	instance := gamedata.</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.GameData</class-id>
<body>This class is used to represent the state of the game, such that when saving or loading conditions such as location, inventory, and party are persistent. Implemented as a singleton for extra credit.

wagon   &lt;Wagon&gt;   The player's wagon.
profession   &lt;Symbol&gt;   The lead character's profession.
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
	route := #normal.
	turnsTaken := 0.
	milesTraveled := 0.
	currentDate := Date readFrom: 'May 1, 1848' readStream.
	lastLocation := nil.
	gameEnd := 0.
	gameWon := 0.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.GameData</class-id> <category>accessing</category>

<body package="OregonTrail" selector="currentDate">currentDate
     "Returns the current date in this game."

	^currentDate.</body>

<body package="OregonTrail" selector="currentDate:">currentDate: newDate
     "Sets the date."

	currentDate := newDate.
	self changed: #currentDate.</body>

<body package="OregonTrail" selector="gameEnd">gameEnd
	"Returns true if the game has ended; false otherwise."

	^gameEnd.</body>

<body package="OregonTrail" selector="gameEnd:">gameEnd: anObject
	gameEnd := anObject.
	self changed: #gameEnd.</body>

<body package="OregonTrail" selector="gameWon">gameWon
    "Returns whether the game has been won."

	^gameWon.</body>

<body package="OregonTrail" selector="gameWon:">gameWon: anObject
	gameWon := anObject.
	self changed: #gameWon.</body>

<body package="OregonTrail" selector="lastLocation">lastLocation
	"Returns the last major location the player was at in this game."

	^lastLocation.</body>

<body package="OregonTrail" selector="lastLocation:">lastLocation: lastPlace
	"Sets the last major location the player was at in this game."

	lastLocation := lastPlace.
	self changed: #lastLocation.</body>

<body package="OregonTrail" selector="lastLocationName">lastLocationName
	"Returns the last major location the player was at in this game.
	Returns the name instead of the reference for UI display"

	^lastLocation printString.</body>

<body package="OregonTrail" selector="milesTraveled">milesTraveled
	"Returns the number of miles that have been traveled in this game."

	^milesTraveled.</body>

<body package="OregonTrail" selector="milesTraveled:">milesTraveled: numberOfMiles
	"Sets the number of miles that have been traveled in this game."

	milesTraveled := numberOfMiles.
	self changed: #milesTraveled.</body>

<body package="OregonTrail" selector="nextDay">nextDay
	"sets the date to the next day"
	self currentDate: (currentDate addDays:1)</body>

<body package="OregonTrail" selector="profession">profession
	"Returns the lead character's profession."

	^profession.</body>

<body package="OregonTrail" selector="profession:">profession: newProfession
	"The lead character's profession is set."

	profession := newProfession.</body>

<body package="OregonTrail" selector="route">route
	"Returns the route, either #normal or #bridger"

	^route.</body>

<body package="OregonTrail" selector="route:">route: aSymbol
	"Sets the route."

	route := aSymbol.
	self changed: #route.</body>

<body package="OregonTrail" selector="save">save
	"saves the game data"
	| update |
	update := 'UPDATE gamedata set route = ', (route printString), ', turns_taken = ', (turnsTaken printString), ', miles_traveled = ', (milesTraveled printString), ', date = str_to_date("', (currentDate printString), '", "%M %e, %Y"), last_location = ',  (lastLocation printString), ' where wagon_id = ', wagon_id printString, ';'.
	DBManager inputQuery: update.</body>

<body package="OregonTrail" selector="turnsTaken">turnsTaken
	"Returns the number of days elapsed since the journey for this game began (turns taken)."

	^turnsTaken.</body>

<body package="OregonTrail" selector="turnsTaken:">turnsTaken: numberOfTurns
	"Sets the elapsed number of days (turns) taken for this game."

	turnsTaken := numberOfTurns.
	self changed: #turnsTaken.</body>

<body package="OregonTrail" selector="wagon">wagon
	"Returns the player's wagon."

	^wagon.</body>

<body package="OregonTrail" selector="wagon:">wagon: aWagon
	"Sets this game's wagon."

	wagon := aWagon.</body>

<body package="OregonTrail" selector="wagon_id">wagon_id
	^wagon_id</body>

<body package="OregonTrail" selector="wagon_id:">wagon_id: anObject
	wagon_id := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.GameData</class-id> <category>printing</category>

<body package="OregonTrail" selector="printString">printString
	^(wagon people at: 1) name, ' the ', profession name, ' (', self milesTraveled printString,' miles traveled)'.</body>
</methods>

</st-source>
