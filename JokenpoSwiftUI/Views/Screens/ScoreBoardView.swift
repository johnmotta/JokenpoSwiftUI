//

import SwiftUI

struct ScoreBoardView: View {
    @EnvironmentObject var viewModel: JokenpoObservable
    
    var body: some View {
        VStack {
            Spacer()
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
            Spacer()
            Text(viewModel.gameOver() ? "End Game." : viewModel.showMachineMove())
                .modifier(CustomTextStyle())
                
            Spacer()
        }
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
            .environmentObject(JokenpoObservable())
    }
}
