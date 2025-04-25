import SwiftUI
import AVFoundation

struct GameView: View {
    var goToMenu: () -> Void
    @State private var selectedAnswer: Int?
    @State private var showResult = false
    @State private var isCorrect = false
    @EnvironmentObject var audioManager: AudioManager
    @Binding var score: Int
    @State var currentQuestion: Int

    var body: some View {
        Group {
            if currentQuestion < QuestionData.allQuestions.count {
                gameContent
            } else {
                FinalScoreView(score: score, goToMenu: goToMenu)
            }
        }
    }

    private var gameContent: some View {
        GeometryReader { geometry in
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height)

                VStack(spacing: 20) {
                    HStack {
                        Text("Pontuação: \(score)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)

                        Spacer()

                        Text("\(currentQuestion + 1)/\(QuestionData.allQuestions.count)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)

                        Spacer()

                        Button(action: playSequence) {
                            Image(systemName: "repeat")
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)

                    // Exibir a pergunta
                    Text(QuestionData.allQuestions[currentQuestion].title)
                        .font(.title2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .shadow(color: .black, radius: 2)

                    // Exibir as opções em texto
                    HStack(alignment: .top, spacing: 15) {
                        ForEach(0..<3, id: \.self) { i in
                            Text(QuestionData.allQuestions[currentQuestion].answerText[i])
                                .font(.footnote)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)

                    HStack(spacing: 15) {
                        ForEach(0..<3, id: \.self) { index in
                            AnswerOption(
                                colors: generateOptions(for: index),
                                isSelected: selectedAnswer == index,
                                optionLetter: ["A", "B", "C"][index]
                            ) {
                                checkAnswer(index)
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    DrumSetView(playSequence: playSequence)
                        .frame(height: geometry.size.height * 0.25)
                        .padding(.bottom, 20)
                }
                .padding(.top, 40)

                if showResult {
                    ResultOverlay(isCorrect: isCorrect) {
                        showResult = false
                        if isCorrect {
                            score += 10
                        }
                        if currentQuestion < QuestionData.allQuestions.count - 1 {
                            currentQuestion += 1
                            playSequence()
                        } else {
                            currentQuestion += 1  // Just increment to trigger the FinalScoreView
                        }
                    }
                }
            }
        }
    }

    private func generateOptions(for index: Int) -> [Color] {
        return QuestionData.allQuestions[currentQuestion].allVariations[index]
    }

    private func checkAnswer(_ index: Int) {
        selectedAnswer = index
        isCorrect = index == QuestionData.allQuestions[currentQuestion].correctIndex
        showResult = true
    }

    private func playSequence() {
        let question = QuestionData.allQuestions[currentQuestion]
        let sequence = question.correctSequence

        print("🎯 Tocando sequência correta (index \(question.correctIndex))")
        for (i, color) in sequence.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.0) {
                audioManager.playSound(named: color.drumColorName)
            }
        }
    }
}

struct DrumSetView: View {
    var playSequence: () -> Void

    var body: some View {
        HStack(spacing: 25) {
            DrumView(color: .drumPink, drumColorName: "pink")
            DrumView(color: .drumGreen, drumColorName: "green")
            DrumView(color: .drumCyan, drumColorName: "cyan")
            DrumView(color: .drumOrange, drumColorName: "orange")
        }
    }
}

struct DrumView: View {
    let color: Color
    let drumColorName: String
    @State private var currentFrame = 0
    @State private var isAnimating = false
    @EnvironmentObject var audioManager: AudioManager

    var body: some View {
        Image("\(drumColorName)_frame\(currentFrame)")
            .resizable()
            .scaledToFit()
            .shadow(radius: 5)
            .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                guard isAnimating else { return }
                currentFrame = (currentFrame + 1) % 4
                if currentFrame == 0 {
                    isAnimating = false
                }
            }
            .onTapGesture {
                isAnimating = true
                audioManager.playSound(named: drumColorName)
            }
    }
}

struct AnswerOption: View {
    let colors: [Color]
    let isSelected: Bool
    let optionLetter: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(optionLetter)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1)

                HStack(spacing: 5) {
                    ForEach(colors, id: \.self) { color in
                        color
                            .frame(width: 25, height: 25)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.blue.opacity(0.4) : Color.black.opacity(0.3))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.white, lineWidth: 2)
            )
        }
    }
}

struct ResultOverlay: View {
    let isCorrect: Bool
    var dismiss: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text(isCorrect ? "Correto! 🎉" : "Errado! 😞")
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 3)

                Button("Continuar") {
                    dismiss()
                }
                .buttonStyle(GameButtonStyle(backgroundColor: isCorrect ? .green : .red))
            }
            .padding(30)
            .background(Color.black.opacity(0.9))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(goToMenu: {}, score: .constant(0), currentQuestion: 0)
            .environmentObject(AudioManager.shared)
    }
}

