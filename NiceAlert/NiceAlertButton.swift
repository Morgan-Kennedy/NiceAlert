
import Foundation

typealias NiceAlertButtonHandler = () -> Void

class NiceAlertButton {
    // MARK: Properties
    let title: String
    var handler: NiceAlertButtonHandler?
    
    // MARK: Lifecycle Methods
    required init(title: String, handler: NiceAlertButtonHandler?) {
        self.title = title
        self.handler = handler
    }
    
    convenience init(localizedKeyTitle: String, handler: NiceAlertButtonHandler?) {
        self.init(title: NSLocalizedString(localizedKeyTitle, comment: ""), handler: handler)
    }
    
    convenience init(cancelButtonHandler: NiceAlertButtonHandler?) {
        self.init(localizedKeyTitle: "GCancelButton", handler: cancelButtonHandler)
    }
    
    convenience init(okButtonHandler: NiceAlertButtonHandler?) {
        self.init(localizedKeyTitle: "GOkButton", handler: okButtonHandler)
    }
}
