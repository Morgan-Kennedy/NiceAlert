
import Foundation
import UIKit

class NiceAlertPresentationManager {
    static func presentAlertOver(controller: UIViewController, title: String?, message: String?, button1: NiceAlertButton?, button2: NiceAlertButton?, button3: NiceAlertButton?, button4: NiceAlertButton?, cancelButton: NiceAlertButton?) {
        let alert = NiceAlert.init(title: title, message: message, button1: button1, button2: button2, button3: button3, button4: button4, cancelButton: cancelButton)
        NiceAlertPresentationManager.presentAlertOver(controller: controller, alert: alert)
    }
    
    static func presentAlertOver(controller: UIViewController, title: String?, message: String?, button1: NiceAlertButton?, button2: NiceAlertButton?, button3: NiceAlertButton?, button4: NiceAlertButton?, usesDefaultCancelButton: Bool) {
        let alert = NiceAlert.init(title: title, message: message, button1: button1, button2: button2, button3: button3, button4: button4, usesDefaultCancelButton: usesDefaultCancelButton)
        NiceAlertPresentationManager.presentAlertOver(controller: controller, alert: alert)
    }
    
    static func presentAlertOver(controller: UIViewController, okAlertTitle: String?, message: String?) {
        let alert = NiceAlert.init(okAlertTitle: okAlertTitle, message: message)
        NiceAlertPresentationManager.presentAlertOver(controller: controller, alert: alert)
    }
    
    static func presentAlertOver(controller: UIViewController, alert: NiceAlert) {
        let alertViewController = NiceAlertViewController(nibName: "NiceAlertViewController", bundle: nil)
        alertViewController.configure(alert: alert)
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        controller.present(alertViewController, animated: true, completion: nil)
    }
}
