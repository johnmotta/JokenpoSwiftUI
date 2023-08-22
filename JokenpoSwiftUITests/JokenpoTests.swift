//

import XCTest
@testable import JokenpoSwiftUI

final class JokenpoTests: XCTestCase {
    
    // rock = 0
    // paper = 1
    // scissors = 2
    
    var jokenpo: JokenpoModel!
    
    // instance the game
    override func setUp() {
        jokenpo = JokenpoModel()
    }
    
    // Clear Memory - Every time you run the test it will create a new test and clear the old one from memory
    override func tearDown() {
        jokenpo = nil
    }
    
    // Checks if the initial state of the game is valid
    func testNewGameIsVoid() {
        XCTAssertFalse(jokenpo.endGame)
    }
    
    // Checks if options were created in an array
    func testRockPaperAndScissosCreate() {
        XCTAssertEqual(jokenpo.checkCreateRock, 0)
        XCTAssertEqual(jokenpo.checkCreatePaper, 1)
        XCTAssertEqual(jokenpo.checkCreateScissors, 2)
    }
    
    // Checks if the moves are valid
    func testChooseSomeOption() {
        for i in 0...2 {
            XCTAssertTrue(jokenpo.checkPlayerAndMachineMove(i))
        }
        for i in 3...10 {
            XCTAssertFalse(jokenpo.checkPlayerAndMachineMove(i))
        }
    }
    
    func testRoundWinner() {
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 0, machine: 0), "Draw")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 1, machine: 1), "Draw")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 2, machine: 2), "Draw")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 0, machine: 2), "Player")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 1, machine: 0), "Player")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 2, machine: 1), "Player")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 2, machine: 0), "Machine")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 0, machine: 1), "Machine")
        XCTAssertEqual(jokenpo.checkRoundWinner(player: 1, machine: 2), "Machine")
    }
    
    func testEndGame() {
        for i in 0...9 {
            XCTAssertEqual(jokenpo.checkEndGame(rounds: i), false)
        }
        XCTAssertEqual(jokenpo.checkEndGame(rounds: 10), true)
    }
}
