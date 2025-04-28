# 🥁 Hello, DalPra



## 📖 Sobre o Jogo

**Tambor Musical** é um jogo divertido que testa sua memória auditiva e capacidade de reconhecer padrões musicais. Os jogadores escutam uma sequência de sons de tambores coloridos e devem identificar a sequência correta entre as opções apresentadas para ganhar pontos.

O jogo combina elementos de entretenimento com desafio cognitivo, tornando-o uma experiência envolvente para todas as idades.

## ✨ Características Principais

- 🎵 Sequências musicais únicas de tambores coloridos
- 🎮 Interface visual intuitiva e atraente
- 📱 Design responsivo para diferentes tamanhos de tela
- 🏆 Sistema de pontuação para acompanhar seu desempenho
- 🎓 Tutorial interativo para aprender a jogar facilmente

## 🎮 Como Jogar

1. **Menu Principal**: Inicie o jogo clicando no botão "Jogar"
2. **Tutorial**: Aprenda como jogar seguindo as orientações visuais
3. **Ouça a Música**: Preste atenção na sequência de sons dos tambores
4. **Responda**: Escolha entre as opções A, B ou C qual representa a sequência que você ouviu
5. **Ganhe Pontos**: Cada resposta correta vale 10 pontos
6. **Pontuação Final**: Veja sua pontuação total ao final de todas as perguntas

## 📷 Capturas de Tela

### Menu Principal
![Menu Principal](https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/screenshots/menu.png)

### Tutorial
![Tutorial](https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/screenshots/tutorial.png)

### Tela de Escuta
![Escutando Música](https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/screenshots/listen.png)

### Jogo
![Jogo](https://raw.githubusercontent.com/seu-usuario/seu-repositorio/main/screenshots/gameplay.png)

## 🔧 Tecnologias Utilizadas

- SwiftUI para interface do usuário
- AVFoundation para reprodução de áudio
- Arquitetura MVVM para organização do código
- Animações nativas do SwiftUI

## 📋 Requisitos do Sistema

- iOS 15.0 ou superior
- macOS 12.0 ou superior (para versão Mac)
- 50MB de espaço de armazenamento

## 🚀 Instalação

1. Clone este repositório:
```bash
git clone https://github.com/seu-usuario/tambor-musical.git
```

2. Abra o projeto no Xcode:
```bash
cd tambor-musical
open TamborMusical.xcodeproj
```

3. Execute o projeto no simulador ou dispositivo físico

## 🧩 Estrutura do Projeto

O código está organizado da seguinte forma:

```
TamborMusical/
├── Assets/ (recursos como imagens e sons)
├── Views/
│   ├── MainMenuView.swift
│   ├── TutorialView.swift
│   ├── ListenMusicView.swift
│   ├── GameView.swift
│   └── FinalScoreView.swift
├── Models/
│   ├── GameState.swift
│   └── QuestionData.swift
├── Utilities/
│   ├── AudioManager.swift
│   ├── ColorExtensions.swift
│   └── DeviceRotation.swift
└── Styles/
    └── GameButtonStyle.swift
```

## 🛠️ Personalizando o Jogo

O jogo vem pré-configurado com algumas perguntas, mas você pode facilmente personalizá-las:

1. Abra o arquivo `QuestionData.swift`
2. Modifique a função `generateQuestions()` para adicionar suas próprias perguntas e respostas
3. Para cada pergunta, defina:
   - Um título (pergunta)
   - Textos para as opções A, B e C
   - Variações de cores para cada opção
   - O índice da resposta correta

Exemplo:
```swift
Question(
    title: "Qual é o seu animal favorito?",
    answerText: [
        "Opção A: Gato",
        "Opção B: Cachorro",
        "Opção C: Papagaio"
    ],
    allVariations: [
        [.drumPink, .drumCyan, .drumGreen, .drumOrange],
        [.drumGreen, .drumOrange, .drumPink, .drumCyan],
        [.drumCyan, .drumPink, .drumOrange, .drumGreen]
    ],
    correctIndex: 0
)
```

## ⚠️ Problemas Conhecidos

- A reprodução de áudio pode sofrer atrasos em dispositivos mais antigos
- O tutorial requer vídeos específicos presentes no bundle do aplicativo

## 🤝 Contribuindo

Contribuições são bem-vindas! Siga estes passos:

1. Faça um fork do projeto
2. Crie uma branch para sua funcionalidade (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 📞 Contato

- **Desenvolvedor**: [Seu Nome]
- **E-mail**: [seu.email@exemplo.com]
- **GitHub**: [seu-usuario](https://github.com/seu-usuario)



```sql
 create table teste (
    pk int PRIMARY KEY
)
```
