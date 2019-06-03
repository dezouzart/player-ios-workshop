import Foundation
import WMPlayer

class SharePlugin: MediaControlPlugin {
    var shareView: ShareView = .fromNib()
    
    open class override var name: String {
        return "SharePlugin"
    }
    
    override open var panel: MediaControlPanel {
        return .top
    }
    
    override open var position: MediaControlPosition {
        return .right
    }
    
    required init(context: UIObject) {
        super.init(context: context)
        bindEvents()
    }
    
    private func bindEvents() {
        stopListening()
        
        bindCoreEvents()
        bindContainerEvents()
        bindPlaybackEvents()
    }
    
    private func bindCoreEvents() {
        if let core = core {
            listenTo(core, eventName: Event.didChangeActiveContainer.rawValue) { [weak self] _ in self?.bindEvents() }
        }
    }
    
    private func bindContainerEvents() {
        if let container = core?.activeContainer {
            listenTo(container,
                     eventName: Event.didChangePlayback.rawValue) { [weak self] _ in self?.bindEvents() }
        }
    }
    
    private func bindPlaybackEvents() {
        if let playback = core?.activePlayback {
            listenTo(playback, eventName: Event.playing.rawValue) { _ in print("playing") }
        }
    }
    
    override open func render() {
        setupView()
        setupShareView()
    }
    
    private func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func setupShareView() {
        view.addSubview(shareView)
        shareView.translatesAutoresizingMaskIntoConstraints = false
        shareView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        shareView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        shareView.setupButton()
    }
}
