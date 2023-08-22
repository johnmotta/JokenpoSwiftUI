//

import Foundation

class JokenpoObservable: ObservableObject {
    
    private var jokenpo = JokenpoModel()
    
    @Published var attScore = false
    @Published var endGame = false
    @Published var isShowMachineMove = false
    
    private(set) var score = JokenpoModel.Score(player: 0, machine: 0, scoreBoard: 0)
    private(set) var move = JokenpoModel.Move(player: 0, machine: 0)
    
    func playerAndMachineMove(playerMove: Int, machineMove: Int) {
        move.player = playerMove
        move.machine = machineMove
    }
    
    private func checkRoundWinner() {
        let result = jokenpo.checkRoundWinner(player: move.player, machine: move.machine)
        if result == "Player" {
            self.score.player += 1
        } else if result == "Machine" {
            self.score.machine += 1
        }
    }
    
    func showMachineMove() -> String {
        if isShowMachineMove {
            switch move.machine {
            case 0:
                return "Rock"
            case 1:
                return "Paper"
            default:
                return "Scissors"
            }
        }
        return "Waiting for the move..."
    }
    
    func updateScore() {
        self.score.scoreBoard += 1
        checkRoundWinner()
        self.attScore.toggle()
    }
    
    func checkGameOver() {
        if gameOver() {
            move.machine = 0
            move.player = 0
            score.player = 0
            score.machine = 0
            score.scoreBoard = 0
            self.endGame.toggle()
        }
    }
    
    func gameOver() -> Bool {
        return jokenpo.checkEndGame(rounds: score.scoreBoard)
    }
    
    func winner() -> String {
        if score.player == score.machine {
            return "Draw!"
        } else if score.player > score.machine {
            return "Player Win!"
        } else if score.player < score.machine {
            return "IA Win!"
        } else {
            return ""
        }
    }
}
