import SwiftUI

struct Question {
    let title: String
    let answerText: [String]
    let allVariations: [[Color]]
    let correctIndex: Int           

    var correctSequence: [Color] {
        allVariations[correctIndex]
    }
}

struct QuestionData {
    static var allQuestions: [Question] = generateQuestions()

    static func generateQuestions() -> [Question] {
        return [
            Question(
                title: "Qual meu sabor de pizza favorito?",
                answerText: [
                    "Opção A: Lombo com catupiry",
                    "Opção B: Frango",
                    "Opção C: Milho"
                ],
                allVariations: dummyVariations(),
                correctIndex: 0
            ),
            Question(
                title: "Qual meu jogo favorito?",
                answerText: [
                    "Opção A: LOL",
                    "Opção B: Valorant",
                    "Opção C: Persona 3"
                ],
                allVariations: dummyVariations(),
                correctIndex: 2
            ),
            Question(
                title: "Pergunta 3: Do que eu vim fantasiado no primeiro dia?",
                answerText: [
                    "Opção A: Ben 10",
                    "Opção B: Rango",
                    "Opção C: Jojo"
                ],
                allVariations: dummyVariations(),
                correctIndex: 1
            ),
            Question(
                title: "Pergunta 4: Sobre o que foi a minha primeira tatuagem?",
                answerText: [
                    "Opção A: Jojo",
                    "Opção B: Animal",
                    "Opção C: Persona 3"
                ],
                allVariations: dummyVariations(),
                correctIndex: 0
            ),
            Question(
                title: "Pergunta 5: Qual o meu curso?",
                answerText: [
                    "Opção A: Engenharia de software",
                    "Opção B: Sistema de informacao",
                    "Opção C: Ciencia da computacao"
                ],
                allVariations: dummyVariations(),
                correctIndex: 2
            )
        ]
    }

    static func dummyVariations() -> [[Color]] {
        return [
            [.drumPink, .drumGreen, .drumCyan, .drumOrange],
            [.drumGreen, .drumCyan, .drumOrange, .drumPink],
            [.drumCyan, .drumPink, .drumGreen, .drumOrange]
        ]
    }
}
