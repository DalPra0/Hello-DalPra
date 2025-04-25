enum GameState {
    case mainMenu
    case tutorial(index: Int)
    case listenMusic(questionIndex: Int)
    case game(questionIndex: Int)
}
