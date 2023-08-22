//

import SwiftUI

struct ChooseRockPaperScissorsView: View {
    @EnvironmentObject var viewModel: JokenpoObservable
    
    private var rock = RockPaperScissorsModel.rock
    private var paper = RockPaperScissorsModel.paper
    private var scissors = RockPaperScissorsModel.scissors
    
    @State private var isButtonDisabled = false
    @State private var isToggledscissors = false
    @State private var isToggledPaper = false
    @State private var isToggledRock = false

    var body: some View {
        HStack {
            Spacer()
            
            if viewModel.gameOver() {
                EndGameButtonView()
                Spacer()
            } else {
                Button(action : {
                    viewModel.playerAndMachineMove(playerMove: rock.description, machineMove: Int.random(in: 0...2))
                    viewModel.updateScore()


                    withAnimation{
                        isButtonDisabled = true
                        isToggledRock.toggle()
                        viewModel.isShowMachineMove.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isButtonDisabled = false
                            viewModel.isShowMachineMove.toggle()
                            isToggledRock.toggle()
                        }
                    }
                    
                }) {
                    Text("Rock")
                        .scaleEffect(isToggledRock ? 1.2 : 1)
                        .springAnimation(stiffness: 50, damping: 2)
                }
                .disabled(isButtonDisabled)
                .buttonStyle(CustomButtonStyle())

                
                Spacer()
                
                Button(action : {
                    
                    viewModel.playerAndMachineMove(playerMove: paper.description, machineMove: Int.random(in: 0...2))
                    viewModel.updateScore()
                    isButtonDisabled = true
                    withAnimation{
                        isToggledPaper.toggle()
                        viewModel.isShowMachineMove.toggle()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isToggledPaper.toggle()
                            isButtonDisabled = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                            viewModel.isShowMachineMove.toggle()
                           
                        }
                    }
                    
                })  {
                    Text("Paper")
                        .scaleEffect(isToggledPaper ? 1.2 : 1)
                        .springAnimation(stiffness: 50, damping: 4)
                }
                .buttonStyle(CustomButtonStyle())
                .disabled(isButtonDisabled)
                
                Spacer()
                
                Button(action : {
                    
                    viewModel.playerAndMachineMove(playerMove: scissors.description, machineMove: Int.random(in: 0...2))
                    viewModel.updateScore()
                    isButtonDisabled = true
                    withAnimation{
                        isToggledscissors.toggle()
                        viewModel.isShowMachineMove.toggle()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isToggledscissors.toggle()
                            isButtonDisabled = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                            viewModel.isShowMachineMove.toggle()
                           
                        }
                    }
                    
                })  {
                    Text("Scissors")
                        .scaleEffect(isToggledscissors ? 1.2 : 1)
                        .springAnimation(stiffness: 50, damping: 4)
                }
                .buttonStyle(CustomButtonStyle())
                .disabled(isButtonDisabled)
                
                Spacer()
            }
        }
    }
}

struct ChooseRockPaperScissorsView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRockPaperScissorsView()
            .environmentObject(JokenpoObservable())
    }
}
