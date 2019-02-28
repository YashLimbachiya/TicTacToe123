pragma solidity ^0.5.0;

contract TicTacToe {
    uint8 public boardSize = 3;
    
    address[3][3] board;
    
    address public player1;
    address public player2;
    
    address activePlayer;
    
    constructor() public {
        player1 = msg.sender;
    }
    
    function joinGame() public {
        assert(player2 == address(0));
        player2 = msg.sender;
        activePlayer = player2;
    }
    
    function getBoard() public view returns(address[3][3] memory) {
        return board;
    }
    
    function setStone(uint8 x, uint8 y) public {
        require(board[x][y] == address(0), "Field not empty, aborting");
        assert(x < boardSize);
        assert(y < boardSize);
        require(msg.sender == activePlayer, "Player not the active player, aborting");
        board[x][y] = msg.sender;
        
        for(uint8 i = 0; i < boardSize; i++) {
            if(board[i][y] != activePlayer) {
                break;
            }
            //win
            if(i == boardSize - 1) {
                //winner
            }
        }
        for(uint i = 0; i < boardSize; i++) {
            if(board[x][i] != activePlayer) {
                break;
            }
            //win
            
            if(i == boardSize - 1) {
                //winner
            }
        }
        
        //diagonale
        if(x == y) {
            for(uint i = 0; i < boardSize; i++) {
                if(board[i][i] != activePlayer) {
                    break;
                }
                //win
                if(i == boardSize - 1) {
                    //winner
                }
            }
        }
        
        //anti-diagonale
        if((x+y) == boardSize-1) {
            for(uint i = 0; i < boardSize; i++) {
                if(board[i][(boardSize-1)-i] != activePlayer) {
                    break;
                }
                //win
                
                if(i == boardSize - 1) {
                    //winner
                }
            }
        }
        
        //draw
        
        if(activePlayer == player1) {
            activePlayer = player2;
        } else {
            activePlayer = player1;
        }
    }
}