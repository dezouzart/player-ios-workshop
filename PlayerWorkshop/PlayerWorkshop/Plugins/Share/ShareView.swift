import UIKit

class ShareView: UIView {
    @IBOutlet weak var shareButton: UIButton!
    
    func setupButton() {
        let shareIcon = UIImage.fromName("shareImg", for: ShareView.self)
        shareButton.setImage(shareIcon, for: .normal)
        shareButton.imageView?.contentMode = .scaleAspectFit
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
    }
    
    @objc func share() {
        print("share")
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        let nib = UINib(nibName: String(describing: T.self), bundle: Bundle(for: T.self))
        return (nib.instantiate(withOwner: nil, options: nil).last as? T)!
    }
}
