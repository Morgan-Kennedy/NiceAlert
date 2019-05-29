
import Foundation

class NiceAlert {
    // MARK: Properties
    let title: String?
    let message: String?
    let button1: NiceAlertButton?
    let button2: NiceAlertButton?
    let button3: NiceAlertButton?
    let button4: NiceAlertButton?
    let cancelButton: NiceAlertButton?
    
    // MARK: Lifecycle Methods
    required init(title: String?, message: String?, button1: NiceAlertButton?, button2: NiceAlertButton?, button3: NiceAlertButton?, button4: NiceAlertButton?, cancelButton: NiceAlertButton?) {
        self.title = title
        self.message = message
        self.button1 = button1
        self.button2 = button2
        self.button3 = button3
        self.button4 = button4
        self.cancelButton = cancelButton
    }
    
    convenience init(title: String?, message: String?, button1: NiceAlertButton?, button2: NiceAlertButton?, button3: NiceAlertButton?, button4: NiceAlertButton?, usesDefaultCancelButton: Bool) {
        var defaultCancelButton: NiceAlertButton? = nil
        if usesDefaultCancelButton {
            defaultCancelButton = NiceAlertButton.init(cancelButtonHandler: nil)
        }
        
        self.init(title: title, message: message, button1: button1, button2: button2, button3: button3, button4: button4, cancelButton: defaultCancelButton)
    }
    
    convenience init(okAlertTitle: String?, message: String?) {
        self.init(title: okAlertTitle, message: message, button1: NiceAlertButton.init(okButtonHandler: nil), button2: nil, button3: nil, button4: nil, cancelButton: nil)
    }
}
