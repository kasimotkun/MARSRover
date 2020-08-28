using FluentAssertions;
using TechTalk.SpecFlow;
using MARSRovers;
using NUnit.Framework;

namespace Rover.SpecFlowNUnit.Drivers
{
    public class RoverDriver
    {
        private MARSRovers.Rover _rover;

        public void NewRover(int upperX, int upperY)
        {
            _rover = new MARSRovers.Rover(upperX, upperY);
        }

        public void ProcessCommands(string commands)
        {
            _rover.process(commands);
        }

        public void SetRoverPosition(int x, int y, string dir)
        {
            int facing = 1;
            if (dir.Equals("N"))
            {
                facing = 1;
            }
            else  if (dir.Equals("E"))
            {
                facing = 2;
            }
            else if (dir.Equals("S"))
            {
                facing = 3;
            }
            else if (dir.Equals("W"))
            {
                facing = 4;
            }
            _rover.setRoverPosition(x, y, facing);
        }

        public void CheckPosition(string expected)
        {
            Assert.AreEqual(expected, _rover.printPosition()); ;
        }


    }
}
