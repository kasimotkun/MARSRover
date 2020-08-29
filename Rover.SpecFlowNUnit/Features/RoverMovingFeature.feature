
Feature: The Rover Moving Steps
  In order to check the rover moves correctly
  As a controller
  I want to move the rover with commands

Background:
  Given x=5, y=5 the upper-right coordinates of the plateau
  
Scenario: move the rover inside the upper and lower coordinates - only move
  Given a new rover with position x=1, y=2 and facing is 'N'
  When I move the rover with 'M' commands
  Then the final position should be '1 3 N'

Scenario: move the rover inside the upper and lower coordinates - only left
  Given a new rover with position x=1, y=2 and facing is 'N'
  When I move the rover with 'L' commands
  Then the final position should be '1 2 W'

Scenario: move the rover inside the upper and lower coordinates - only right
  Given a new rover with position x=1, y=2 and facing is 'N'
  When I move the rover with 'R' commands
  Then the final position should be '1 2 E'

Scenario: move the rover inside the upper and lower coordinates - more moves
  Given a new rover with position x=1, y=1 and facing is 'E'
  When I move the rover with 'MMM' commands
  Then the final position should be '4 1 E'

Scenario: move the rover inside the upper and lower coordinates - more lefts
  Given a new rover with position x=3, y=3 and facing is 'W'
  When I move the rover with 'LLL' commands
  Then the final position should be '3 3 N'

Scenario: move the rover inside the upper and lower coordinates - more rights
  Given a new rover with position x=3, y=3 and facing is 'E'
  When I move the rover with 'RRR' commands
  Then the final position should be '3 3 N'

Scenario: move the rover inside the upper and lower coordinates - mixed commands-1
  Given a new rover with position x=3, y=3 and facing is 'E'
  When I move the rover with 'MMRMMRMRRM' commands
  Then the final position should be '5 1 E'

Scenario: move the rover inside the upper and lower coordinates - mixed commands-2
  Given a new rover with position x=1, y=2 and facing is 'N'
  When I move the rover with 'LMLMLMLMM' commands
  Then the final position should be '1 3 N'
