
Feature: The Rover Moving Commands Format Check
  In order to check the rover move commands
  As a controller
  I want to move the rover with wrong commands

Background:
  Given x=5, y=5 the upper-right coordinates of the plateau
  
Scenario: set the rover position with ouf of N,S,E and W facing characters - N by default facing
  Given a new rover with position x=1, y=2 and facing is 'K'
  When I move the rover with 'LMLMLMLMM' commands
  Then the final position should be '1 3 N'

Scenario: move the rover with out of L,R,M direction commands
  Given a new rover with position x=1, y=2 and facing is 'N'
  When I move the rover with 'LMLMXLMLMM' commands
  Then the user is presented with an error message 'Speak in Mars language, please!'
