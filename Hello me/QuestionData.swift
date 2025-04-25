import SwiftUI

struct Question {
    let title: String                 // A pergunta em texto
    let answerText: [String]         // Texto das opções (A, B, C)
    let allVariations: [[Color]]     // As 3 opções de resposta (cores)
    let correctIndex: Int            // Índice da resposta correta

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
                title: "Pergunta 3: Placeholder para você editar depois.",
                answerText: [
                    "Opção A: Placeholder A",
                    "Opção B: Placeholder B",
                    "Opção C: Placeholder C"
                ],
                allVariations: dummyVariations(),
                correctIndex: 1
            ),
            Question(
                title: "Pergunta 4: Outra questão de exemplo.",
                answerText: [
                    "Opção A: Alternativa 1",
                    "Opção B: Alternativa 2",
                    "Opção C: Alternativa 3"
                ],
                allVariations: dummyVariations(),
                correctIndex: 0
            ),
            Question(
                title: "Pergunta 5: Edite essa depois.",
                answerText: [
                    "Opção A: Texto A",
                    "Opção B: Texto B",
                    "Opção C: Texto C"
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
