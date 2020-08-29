using System;
using NUnit.Framework;
using Rover.SpecFlowNUnit.Drivers;
using TechTalk.SpecFlow;

namespace Rover.SpecFlowNUnit.StepDefinitions
{
    [Binding]
    public class RoverSteps
    {
        private readonly RoverDriver _driver;

        private int _upperX=0;
        private int _upperY=0;

        private string errorMessage = "";

        public RoverSteps(RoverDriver driver)
        {
            _driver = driver ?? throw new ArgumentNullException(nameof(driver));
        }

        [Given(@"x=(.*), y=(.*) the upper-right coordinates of the plateau")]
        public void GivenTheUpperPosition(int x, int y)
        {
            this._upperX=x;
            this._upperY=y;
        }

        [Given(@"a new rover with position x=(.*), y=(.*) and facing is '(.*)'")]
        public void GivenTheRoverPosition(int x, int y, string facing)
        {
            try
            {
                _driver.NewRover(this._upperX, this._upperY);
                _driver.SetRoverPosition(x, y, facing);
            }
            catch (Exception err)
            {
                errorMessage = err.Message;
            }
        }


        [When(@"I move the rover with '(.*)' commands")]
        public void WhenMoveTheRoverWithCommands(string commands)
        {
            

            try
            {
                _driver.ProcessCommands(commands);
            }
            catch (Exception err)
            {
                errorMessage = err.Message;
            }
        }



        [Then(@"the final position should be '(.*)'")]
        public void ThenTheFinalPositionShouldBe(string expected)
        {
            _driver.CheckPosition(expected);
        }

        [Then(@"the user is presented with an error message '(.*)'")]
        public void ThenTheErrorMessage(string expected)
        {
            Assert.AreEqual(expected, errorMessage);
        }



    }
}
