import SwiftUI
import AVKit

struct TutorialView: View {
    let currentIndex: Int
    var goToNext: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    videoBox(
                        videoName: "TutorialOuvirMusica",
                        text: "Clique no botão para ouvir a musica"
                    )
                    
                    videoBox(
                        videoName: "TutorialClicarTambor",
                        text: "Clique no tambor para ouvir partes da musica"
                    )
                }
                
                HStack(spacing: 0) {
                    videoBox(
                        videoName: "TutorialClicarTambor",
                        text: "Clique neste botão para reouvir a musica"
                    )
                    
                    videoBox(
                        videoName: "TutorialClicarResposta",
                        text: "Baseado na musica, ordene as cores clicando nos tambores para descobrir a resposta"
                    )
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: goToNext) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.blue))
                            .padding(.trailing, 30)
                            .padding(.bottom, 30)
                    }
                }
            }
        }
    }
    
    func videoBox(videoName: String, text: String) -> some View {
        ZStack(alignment: .bottom) {
            if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .border(Color.white, width: 2)
            } else {
                Color.gray
                    .overlay(Text("Vídeo \(videoName).mp4 não encontrado").foregroundColor(.red))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .border(Color.white, width: 2)
            }
            
            Text(text)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func imageBox(imageName: String, text: String) -> some View {
        ZStack(alignment: .bottom) {
            if let _ = UIImage(named: imageName) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                    .border(Color.white, width: 2)
            } else {
                Color.gray
                    .overlay(Text("Imagem \(imageName) não encontrada").foregroundColor(.red))
                    .border(Color.white, width: 2)
            }
            
            Text(text)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

