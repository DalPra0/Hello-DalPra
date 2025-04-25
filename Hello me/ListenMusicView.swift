import SwiftUI

struct ListenMusicView: View {
    let questionIndex: Int
    var goToGame: () -> Void
    @State private var isPlaying = false
    @EnvironmentObject var audioManager: AudioManager
    
    let questions = QuestionData.allQuestions


    
    
    var body: some View {
        ZStack {
            // Wallpaper específico para esta tela
            Image("wallpaperMusica")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3)
                    .padding(.bottom, 80)
                
                // Botão de play/stop
                Button(action: toggleSequence) {
                    Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.purple)
                        .padding()
                        .background(Circle().fill(Color.yellow.opacity(0.9)))
                }
                
                // Botão para ir para o jogo
                Button("Responder") {
                    stopSequence()
                    goToGame()
                }
                .buttonStyle(GameButtonStyle(backgroundColor: .drumGreen))
                .padding(.top, 40)
            }
        }
        .onAppear { playSequence() } // Toca automaticamente ao abrir
        .onDisappear { stopSequence() } // Para ao sair
    }
    
    // MARK: - Controle de Áudio
    private func toggleSequence() {
        isPlaying.toggle()
        isPlaying ? playSequence() : stopSequence()
    }
    
    private func playSequence() {
        let question = QuestionData.allQuestions[questionIndex]
        let sequence = question.correctSequence

        print(">>> Tocando sequência da resposta correta (index: \(question.correctIndex))")
        for (i, color) in sequence.enumerated() {
            print(" - Cor [\(i)]: \(color.drumColorName)")
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.5) {
                audioManager.playSound(named: color.drumColorName)
            }
        }
    }


    
    private func stopSequence() {
        QuestionData.allQuestions[questionIndex].correctSequence.forEach { color in
            audioManager.stopSound(named: color.drumColorName)
        }
        isPlaying = false
    }
    
    private func generateOptions(for index: Int) -> [Color] {
        return QuestionData.allQuestions[questionIndex].allVariations[index]
    }




}

// Pré-visualização
struct ListenMusicView_Previews: PreviewProvider {
    static var previews: some View {
        ListenMusicView(
            questionIndex: 0,
            goToGame: {}
        )
        .environmentObject(AudioManager.shared)
    }
}


