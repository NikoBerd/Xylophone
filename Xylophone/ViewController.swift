import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var player: AVAudioPlayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func keyPressed(_ sender: UIButton) {
    /* sender.currentTitle - is that UIView that or "button" that gets pressed.
     */
    playSound(soundName: sender.currentTitle!)
    //changing UIView alpha setting to 0.5 when it's pressed
    sender.alpha = 0.5
    // a smooth transition + getting original alpha = 1.0 back
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 ) {
      UIView.animate(withDuration: 0.15) {
        sender.alpha = 1.0
      }
    }
    
    func playSound(soundName: String) {
      let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
      player = try! AVAudioPlayer(contentsOf: url!)
      player.play()
      
    }
  }
}
