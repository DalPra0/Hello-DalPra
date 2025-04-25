import SwiftUI

struct FinalScoreView: View {
    let score: Int
    var goToMenu: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("wallpaperPontuacao")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("\(score)")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(.yellow)
                
                VStack(spacing: 20) {
                    Button("Menu Principal", action: goToMenu)
                        .buttonStyle(GameButtonStyle(backgroundColor: .yellow))
                    
                    Button("Sair") {
                        exit(0)
                    }
                    .buttonStyle(GameButtonStyle(backgroundColor: .yellow))
                }
            }
        }
    }
}
