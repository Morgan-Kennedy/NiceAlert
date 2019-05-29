
import Foundation

final class NiceAlertViewModel {
    // MARK: - States
    enum State {
        // Initial: Set the assotiative text to the correct elements and hide null elements
        case initial(title: String?, message: String?, button1: String?, button2: String?, button3: String?, button4: String?, cancelButton: String?)
        
        // Dismiss: pop the whole view controller
        case dismiss
    }
    
    // MARK: - Private Properties
    private let alert: NiceAlert
    
    // MARK: - State Logic
    var callback: ((State) -> Void)?
    var state: State {
        didSet {
            callback?(state)
        }
    }
    
    // MARK: - Lifecycle Methods
    required init(alert: NiceAlert) {
        state = .initial(title: alert.title,
                         message: alert.message,
                         button1: alert.button1?.title,
                         button2: alert.button2?.title,
                         button3: alert.button3?.title,
                         button4: alert.button4?.title,
                         cancelButton: alert.cancelButton?.title)
        self.alert = alert
    }
    
    // MARK: Public Methods
    func setupInitialState() {
        state = .initial(title: alert.title,
                         message: alert.message,
                         button1: alert.button1?.title,
                         button2: alert.button2?.title,
                         button3: alert.button3?.title,
                         button4: alert.button4?.title,
                         cancelButton: alert.cancelButton?.title)
    }
    
    func button1Tapped() {
        state = .dismiss
        if let handler = alert.button1?.handler {
            handler()
        }
    }
    
    func button2Tapped() {
        state = .dismiss
        if let handler = alert.button2?.handler {
            handler()
        }
    }
    
    func button3Tapped() {
        state = .dismiss
        if let handler = alert.button3?.handler {
            handler()
        }
    }
    
    func button4Tapped() {
        state = .dismiss
        if let handler = alert.button4?.handler {
            handler()
        }
    }
    
    func cancelTapped() {
        state = .dismiss
        if let handler = alert.cancelButton?.handler {
            handler()
        }
    }
}

