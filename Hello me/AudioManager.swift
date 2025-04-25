import AVFoundation

class AudioManager: ObservableObject {
    static let shared = AudioManager()
    private var players: [String: AVAudioPlayer] = [:]
    
    func playSound(named: String) {
        guard let url = Bundle.main.url(forResource: named, withExtension: "mp3") else { return }
        
        do {
            if let player = players[named] {
                player.currentTime = 0
                player.play()
                return
            }
            
            let player = try AVAudioPlayer(contentsOf: url)
            players[named] = player
            player.play()
        } catch {
            print("Erro ao reproduzir som: \(error)")
        }
    }
    
    func stopSound(named: String) {
        players[named]?.stop()
    }
}
