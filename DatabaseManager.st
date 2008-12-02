<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:09:00 pm</time-stamp>


<class>
<name>DatabaseManager</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>connection </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.DatabaseManager class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="inputQuery:">inputQuery: aQuery
	"deals with insert and update queries"
	| session rowsAffected |
	connection class externalDatabaseErrorSignal handle:
		[ :ex | "If the connection was left open, it is closed"
			connection disconnect.
			Transcript show: 'invalidConnectionState error caught'; cr.
			connection connect.
		]
	do: [ connection connect ].
	connection begin.

	session := connection getSession.
	session prepare: aQuery;
		execute;
		answer.

	rowsAffected := session rowCount.

	connection commit.
	connection disconnect.

	^rowsAffected</body>

<body package="OregonTrail" selector="new">new
	connection := ODBCConnection new.
	connection
		environment: '2340';
		username: 'oregontrail';
		password: 'Chooy0ba'.
	^self</body>

<body package="OregonTrail" selector="selectQuery:">selectQuery: aQuery
	"select query handler - takes in a string for the select statement
	returns an array with elements of arrays (1 array for each row, in order of parameters for select queries"
	| session answer result |
	connection class externalDatabaseErrorSignal handle:
		[ :ex | "If the connection was left open, it is closed"
			connection disconnect.
			Transcript show: 'invalidConnectionState error caught'; cr.
			connection connect.
		]
	do: [ connection connect ].
	connection begin.

	session := connection getSession connect.
	session prepare: aQuery;
		execute.

	answer := session answer.
	result := answer upToEnd.

	connection commit.
	connection disconnect.

	^result</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.DatabaseManager</class-id>
<body>Returns the result of a query with DBManager query: aQuery.

</body>
</comment>

<methods>
<class-id>OregonTrail.DatabaseManager</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	^self</body>
</methods>

</st-source>
