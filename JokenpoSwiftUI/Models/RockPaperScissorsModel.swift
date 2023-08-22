//

import Foundation

enum RockPaperScissorsModel {
    case rock
    case paper
    case scissors
    
    var description: Int {
        switch self {
        case .rock:
            return 0
        case .paper:
            return 1
        case .scissors:
            return 2
        }
    }
}
