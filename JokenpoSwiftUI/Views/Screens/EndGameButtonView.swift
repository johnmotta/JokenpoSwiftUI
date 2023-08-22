//

import SwiftUI

struct EndGameButtonView: View {
    @EnvironmentObject var viewModel: JokenpoObservable
    
    @State var restart = false
    
    var body: some View {
        Button("End game") {
            restart = true
        }
        .buttonStyle(CustomButtonStyle())
        
        .alert(isPresented: $restart) {
            Alert(
                title: Text("\(viewModel.winner())"),
                primaryButton: .destructive(Text("Restart")) {
                    viewModel.checkGameOver()
                },
                secondaryButton: .cancel()
            )
        }
    }
}
