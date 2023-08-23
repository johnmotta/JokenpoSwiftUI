//

import SwiftUI

struct ScoreBoardView: View {
    @EnvironmentObject var viewModel: JokenpoObservable
    
    var body: some View {
        VStack(spacing: 100) {
            HStack {
                Spacer()
                
                Text("\(viewModel.score.player)")
                    .modifier(CustomTextStyle())
                Spacer()
                
                Text("Round \(viewModel.score.scoreBoard)/10")
                    .modifier(CustomTextStyle())
                Spacer()
                
                Text("\(viewModel.score.machine)")
                    .modifier(CustomTextStyle())
                Spacer()
            }
            Text(viewModel.gameOver() ? "[🪨-📃-✂️]" : viewModel.showMachineMove())
                .modifier(CustomTextStyle())
                
            ChooseRockPaperScissorsView()
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
            .environmentObject(JokenpoObservable())
    }
}
