import SwiftUI

struct MainMenuView: View {
    var goToTutorial: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hello, DalPra")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                Button(action: goToTutorial) {
                    Text("Jogar")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(15)
                }
            }
        }
    }
}
