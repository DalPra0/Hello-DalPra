import SwiftUI

struct ContentView: View {
    @State private var currentState: GameState = .mainMenu
    @State private var score: Int = 0
    @State private var resetGame = false
    @State private var currentQuestionIndex: Int = 0

    
    var body: some View {
        ZStack {
            if !resetGame {
                switch currentState {
                case .mainMenu:
                    MainMenuView(goToTutorial: {
                        currentState = .tutorial(index: 0)
                    })
                
                case .tutorial(let index):
                    TutorialView(
                        currentIndex: index,
                        goToNext: { handleTutorial(index: index) }
                    )
                
                case .listenMusic:
                    ListenMusicView(
                        questionIndex: currentQuestionIndex,
                        goToGame: { currentState = .game(questionIndex: currentQuestionIndex) }
                    )


                
                case .game(let questionIndex):
                    GameView(
                        goToMenu: resetGameState,
                        score: $score,
                        currentQuestion: questionIndex
                    )
                }
            }
        }
    }
    
    // MARK: - Funções de Navegação
    private func handleTutorial(index: Int) {
        if index < 3 {
            currentState = .tutorial(index: index + 1)
        } else {
            currentQuestionIndex = Int.random(in: 0..<QuestionData.allQuestions.count)
            currentState = .listenMusic(questionIndex: currentQuestionIndex)
        }
    }

    
    private func resetGameState() {
        resetGame = true
        score = 0

        // 🔁 Recria as perguntas com novos índices corretos
        QuestionData.allQuestions = QuestionData.generateQuestions()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            currentState = .mainMenu
            resetGame = false
        }
    }

}
