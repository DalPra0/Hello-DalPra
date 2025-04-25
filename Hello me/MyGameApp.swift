import SwiftUICore
import SwiftUI
@main
struct MyGameApp: App {
    @StateObject private var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
    
    
}
