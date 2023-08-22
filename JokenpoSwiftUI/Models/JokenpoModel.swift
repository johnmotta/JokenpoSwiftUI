//

import Foundation

class JokenpoModel {
    private var rock = RockPaperScissorsModel.rock
    private var paper = RockPaperScissorsModel.paper
    private var scissors = RockPaperScissorsModel.scissors
    
    private(set) var endGame = false
    
    var checkCreateRock: Int { rock.description }
    var checkCreatePaper: Int { paper.description }
    var checkCreateScissors: Int { scissors.description }
    
    func checkPlayerAndMachineMove(_ move: Int) -> Bool {
        if move >= 0 && move <= 2 {
            return true
        } else {
            return false
        }
    }
    
    func checkRoundWinner(player: Int, machine: Int) -> String {
        if player == machine {
            return "Draw"
        } else if player == rock.description && machine == paper.description ||
                    player == paper.description && machine == scissors.description ||
                    player == scissors.description && machine == rock.description {
           return "Machine"
        } else {
            return "Player"
        }
    }
    
    func checkEndGame(rounds: Int) -> Bool {
        if rounds == 10 {
            return true
        } else {
            return false
        }
    }
    
    class Score {
        var player: Int
        var machine: Int
        var scoreBoard: Int
        
        init(player: Int, machine: Int, scoreBoard: Int) {
            self.player = player
            self.machine = machine
            self.scoreBoard = scoreBoard
        }
    }
    
    class Move {
        var player: Int
        var machine: Int
        
        init(player: Int, machine: Int) {
            self.player = player
            self.machine = machine
        }
    }

}
