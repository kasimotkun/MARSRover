namespace MARSRovers
{
    public class Rover
    {
    public  static readonly int N = 1;
    public  static readonly int E = 2;
    public  static readonly int S = 3;
    public  static readonly int W = 4;

    public  static readonly int lowerX = 0;

    public  static readonly int lowerY = 0;
    int x = 0;
    int _upperX =0;
    int _upperY=0;

    
    int y = 0;
    int _facing = N;
    public Rover( int upperX, int upperY) {

        this._upperX = upperX;
        this._upperY = upperY;
    }

    public void setRoverPosition(int x, int y, int facing) {
        
        if ( x < lowerX | y < lowerY)
            throw new System.ArgumentException("the lower-left coordinates are 0,0 and facing = N !");       
        else if ( x ==lowerX && y ==lowerY && facing !=N )
            throw new System.ArgumentException("the lower-left coordinates are 0,0 and facing = N !");   
        
        if ( x > _upperY | y > _upperY)
            throw new System.ArgumentException("the upper-right coordinates are "+_upperX+","+_upperY+" and facing = S!");
        else if ( x ==_upperY && y ==_upperY && facing !=S )
            throw new System.ArgumentException("the upper-right coordinates are "+_upperX+","+_upperY+" and facing = S!");      
        
        this.x = x;
        this.y = y;
        this._facing = facing;
    }
    public string printPosition() {
        
        char dir = 'N';
        if (_facing == 1) {
            dir = 'N';
        } else if (_facing == 2) {
            dir = 'E';
        } else if (_facing == 3) {
            dir = 'S';
        } else if (_facing == 4) {
            dir = 'W';
        }


        return x +  " " +  y  + " " +  dir;
    }
    public void process(string commands) {

        char[] commandlist = commands.ToCharArray();
        for (int idx = 0; idx < commandlist.Length; idx++  ) {
            process(commandlist[idx]);
        }
        
        if ( this.x < lowerX | this.y < lowerY)
            throw new System.ArgumentException("the final position is the out of the lower-left coordinates are 0,0. Please search for the rover in outer space!");         
        
        if ( this.x > _upperX | this.y > _upperY)
            throw new System.ArgumentException("the final position is the out of the upper-right coordinates are "+_upperX+","+_upperY+". Please search for the rover in outer space!");
         
    }
    private void process(char command) {
        if (command.Equals('L')) {
            turnLeft();
        } else if (command.Equals('R')) {
            turnRight();
        } else if (command.Equals('M')) {
            move();
        } else {
            throw new System.ArgumentException("Speak in Mars language, please!");
        }
    }
    private void move() {
        if (_facing == N) {
            this.y++;
        } else if (_facing == E) {
            this.x++;
        } else if (_facing == S) {
            this.y--;
        } else if (_facing == W) {
            this.x--;
        }
    }
    private void turnLeft() {
        _facing = (_facing - 1) < N ? W : _facing - 1;
    }
    private void turnRight() {
        _facing = (_facing + 1) > W ? N : _facing + 1;
    }

    }
}
