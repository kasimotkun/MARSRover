Feature: The Rover Position Border Check
  In order to check the rover position if it is inside the border
  As a controller
  I want to set the rover position outside the defined border

Background:
  Given x=5, y=5 the upper-right coordinates of the plateau

Scenario: set the rover position upper than the upper-right coordinates of the plateau - upper Y
  Given a new rover with position x=5, y=6 and facing is 'N'
  Then the user is presented with an error message 'the upper-right coordinates are 5,5 and facing = S!'

Scenario: set the rover position upper than the upper-right coordinates of the plateau - upper X
  Given a new rover with position x=6, y=5 and facing is 'S'
  Then the user is presented with an error message 'the upper-right coordinates are 5,5 and facing = S!'

Scenario: set the rover position upper than the upper-right coordinates of the plateau - North
  Given a new rover with position x=5, y=5 and facing is 'N'
  Then the user is presented with an error message 'the upper-right coordinates are 5,5 and facing = S!'

Scenario: set the rover position upper than the upper-right coordinates of the plateau - West
  Given a new rover with position x=5, y=5 and facing is 'W'
  Then the user is presented with an error message 'the upper-right coordinates are 5,5 and facing = S!'

Scenario: set the rover position upper than the upper-right coordinates of the plateau - East
  Given a new rover with position x=5, y=5 and facing is 'E'
  Then the user is presented with an error message 'the upper-right coordinates are 5,5 and facing = S!'

Scenario: set the rover position lower than the lower-left coordinates of the plateau - lower X
  Given a new rover with position x=-1, y=4 and facing is 'N'
  Then the user is presented with an error message 'the lower-left coordinates are 0,0 and facing = N !'

Scenario: set the rover position lower than the lower-left coordinates of the plateau - lower Y
  Given a new rover with position x=0, y=-1 and facing is 'N'
  Then the user is presented with an error message 'the lower-left coordinates are 0,0 and facing = N !'

Scenario: set the rover position lower than the lower-left coordinates of the plateau - East
  Given a new rover with position x=0, y=0 and facing is 'E'
  Then the user is presented with an error message 'the lower-left coordinates are 0,0 and facing = N !'

Scenario: set the rover position lower than the lower-left coordinates of the plateau - West
  Given a new rover with position x=0, y=0 and facing is 'W'
  Then the user is presented with an error message 'the lower-left coordinates are 0,0 and facing = N !'

Scenario: set the rover position lower than the lower-left coordinates of the plateaua - South
  Given a new rover with position x=0, y=0 and facing is 'S'
  Then the user is presented with an error message 'the lower-left coordinates are 0,0 and facing = N !'

Scenario: move the rover inside the upper and lower coordinates - out of upperY 
  Given a new rover with position x=5, y=4 and facing is 'N'
  When I move the rover with 'MM' commands
  Then the user is presented with an error message 'the final position is the out of the upper-right coordinates are 5,5. Please search for the rover in out space!'

Scenario: move the rover inside the upper and lower coordinates - out of upperX
  Given a new rover with position x=4, y=5 and facing is 'E'
  When I move the rover with 'MM' commands
  Then the user is presented with an error message 'the final position is the out of the upper-right coordinates are 5,5. Please search for the rover in out space!'

Scenario: move the rover inside the upper and lower coordinates - out of lowerY
  Given a new rover with position x=4, y=0 and facing is 'S'
  When I move the rover with 'MM' commands
  Then the user is presented with an error message 'the final position is the out of the lower-left coordinates are 0,0. Please search for the rover in out space!'

Scenario: move the rover inside the upper and lower coordinates - out of lowerX
  Given a new rover with position x=0, y=4 and facing is 'W'
  When I move the rover with 'MM' commands
  Then the user is presented with an error message 'the final position is the out of the lower-left coordinates are 0,0. Please search for the rover in out space!'


