import UIKit
import WMPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var playerContainer: UIView!
    var player: WMPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
    }
    
    func setupPlayer() {
        let options = [kSourceUrl : "5995939"]
        player = WMPlayer(options: options)
        player.attachTo(playerContainer, controller: self)
    }
}
