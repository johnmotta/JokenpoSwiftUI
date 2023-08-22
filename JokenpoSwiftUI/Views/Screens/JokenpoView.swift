//

import SwiftUI

struct JokenpoView: View {
    @StateObject var viewModel = JokenpoObservable()
    
    var body: some View {
        NavigationView{
            ZStack {
                
                VStack(spacing: 0) {
                                    LinearGradient(gradient: Gradient(stops: [
                                        .init(color: .purple, location: 0.45),
                                        .init(color: .black, location: 0.55),
                                    ]), startPoint: .top, endPoint: .bottom)
                }
                
                VStack {
                    Spacer()
                    ScoreBoardView()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                VStack {
                    ChooseRockPaperScissorsView()
                }
            }
            .navigationTitle("Jokenpô")
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JokenpoView()
            .environmentObject(JokenpoObservable())
    }
}
