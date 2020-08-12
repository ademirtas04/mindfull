
import Foundation
import AVFoundation

class AudioPlayer {
    static let shared = AudioPlayer()
    var audioPlayer: AVAudioPlayer?
    var aPlayer1: AVAudioPlayer?
    var aPlayer2: AVAudioPlayer?
    var aPlayer3: AVAudioPlayer?
    var aPlayer4: AVAudioPlayer?
    var aPlayer5: AVAudioPlayer?
    var playBird: Bool = false
    var playLeaves: Bool = false
    var playWaves: Bool = false
    var playBreeze: Bool = false
    var playWater: Bool = false
    
    func startBackgroundMusic() {
        let path = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print(error)
            }
        if(playBird){
            let path = Bundle.main.path(forResource: "birds", ofType: "mp3")
            do {
               aPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
               aPlayer1?.numberOfLoops = -1
               aPlayer1?.play()
            } catch {
               print(error)
            }
        }
        if(playLeaves){
            let path = Bundle.main.path(forResource: "leaves", ofType: "mp3")
            do {
               aPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
               aPlayer2?.numberOfLoops = -1
               aPlayer2?.play()
            } catch {
               print(error)
            }
        }
        if(playWaves){
            let path = Bundle.main.path(forResource: "waves", ofType: "mp3")
            do {
               aPlayer3 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
               aPlayer3?.numberOfLoops = -1
               aPlayer3?.play()
            } catch {
               print(error)
            }
        }
        if(playBreeze){
            let path = Bundle.main.path(forResource: "breeze", ofType: "mp3")
            do {
               aPlayer4 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
               aPlayer4?.numberOfLoops = -1
               aPlayer4?.play()
            } catch {
               print(error)
            }
        }
        if(playWater){
            let path = Bundle.main.path(forResource: "water", ofType: "mp3")
            do {
               aPlayer5 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
               aPlayer5?.numberOfLoops = -1
               aPlayer5?.play()
            } catch {
               print(error)
            }
        }
    }
    
    func startBackgroundMusic(forResource: String, ofType: String) {
        let path = Bundle.main.path(forResource: forResource, ofType: ofType)
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
        aPlayer1?.stop()
        aPlayer2?.stop()
        aPlayer3?.stop()
        aPlayer4?.stop()
        aPlayer5?.stop()
    }
    
    func addBirds(){
        playBird = true
    }
    
    func addBreeze(){
        playBreeze = true
    }
    func addWater(){
        playWater = true
    }
    
    func addWaves(){
        playWaves = true
    }
    func addLeaves(){
        playLeaves = true
    }
    
    func isPlaying() -> Bool {
        return (audioPlayer?.isPlaying)!
    }
    
    func musicLength(name: String, ofType: String) -> Float {
        let path = Bundle.main.path(forResource: name, ofType: ofType)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        } catch {}
        return Float((audioPlayer?.duration)!)
    }
}
