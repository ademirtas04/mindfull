
import Foundation
import AVFoundation

class AudioPlayer {
    static let shared = AudioPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func startBackgroundMusic() {
        let path = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                //audioPlayer?.numberOfLoops = -1
                //audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print(error)
            }
    }
    
    func stopBackgroundMusic() {

        audioPlayer?.stop()
    }
}
