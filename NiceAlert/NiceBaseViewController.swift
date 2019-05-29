
import UIKit

enum NiceBaseViewControllerTransitionIn {
    case fromTop, fromBottom, fromRight, fromLeft, fadeFromCenter
}

enum NiceBaseViewControllerTransitionOut {
    case toTop, toBottom, toRight, toLeft, fadeOutInCenter
}

class NiceBaseViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var modalView: UIView! // NOTE: Override
    @IBOutlet var contentView: UIView! // NOTE: Override
    @IBOutlet var backgroundView: NiceBaseBackgroundView! // NOTE: Override
    
    // MARK: - Properties to set
    var isFaded = false // NOTE: Set start faded state
    var transitionIn: NiceBaseViewControllerTransitionIn = .fromTop // NOTE: Set Transition
    var transitionOut: NiceBaseViewControllerTransitionOut = .toBottom
    var shouldFadeOut = true // NOTE: Set different if you want it to not fade
    var accountForStatusBarHeight = true
    var modalCenterPoint = CGPoint.zero
    
    // MARK: - Properties
    let fadeDuration: Double = 0.15
    let tranisitonDuration: Double = 0.15
    let transitionDamping: CGFloat = 0.8
    let transitionSpringVelocity: CGFloat = 3.0
    let windowCornerRadius: CGFloat = 5.0
    let windowShadowRadius: CGFloat = 8.0
    let windowShadowOpacity: Float = 0.5
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFaded {
            backgroundView.alpha = 1.0
        }
        
        modalView.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        modalCenterPoint = modalView.center
        
        contentView.layer.cornerRadius = windowCornerRadius
        contentView.clipsToBounds = true
        
        modalView.clipsToBounds = true
        modalView.layer.cornerRadius = windowCornerRadius
        modalView.layer.shadowRadius = windowShadowRadius
        modalView.layer.shadowOffset = CGSize.zero
        modalView.layer.shadowOpacity = windowShadowOpacity
        modalView.layer.masksToBounds = false
        modalView.layer.shadowPath = UIBezierPath(roundedRect:modalView.bounds, cornerRadius:modalView.layer.cornerRadius).cgPath
        
        if isFaded == false {
            self.viewTransitionIn()
            
            UIView.animate(withDuration: fadeDuration, animations: {
                self.backgroundView.alpha = 1.0
            }, completion: {(completion: Bool) in
                self.isFaded = true
            })
        } else {
            viewTransitionIn()
        }
    }
    
    // MARK: - Public Methods
    func viewTransitionOutAndClose(completionBlock: (() -> Swift.Void)?) {
        var toPoint = CGPoint(x: view.bounds.size.width * 0.5, y: view.bounds.size.height * 0.5)
        let extraDistance: CGFloat = 30.0
        
        switch transitionOut {
        case .toTop:
            toPoint = CGPoint(x: toPoint.x, y: -((modalView.bounds.size.height * 0.5) + extraDistance))
        case .toBottom:
            toPoint = CGPoint(x: toPoint.x, y: view.bounds.size.height + ((modalView.bounds.size.height * 0.5) + extraDistance))
        case .toLeft:
            toPoint = CGPoint(x: -((modalView.bounds.size.width * 0.5) + extraDistance), y: toPoint.y)
        case .toRight:
            toPoint = CGPoint(x: view.bounds.size.width + ((modalView.bounds.size.width * 0.5) + extraDistance), y: toPoint.y)
        case .fadeOutInCenter:
            break
        }
        
        UIView.animate(withDuration: tranisitonDuration,
                       delay: 0.0,
                       usingSpringWithDamping: transitionDamping,
                       initialSpringVelocity: transitionSpringVelocity,
                       options: .curveEaseInOut,
                       animations: {
                        self.modalView.center = toPoint
                        if self.transitionOut == .fadeOutInCenter {
                            self.modalView.alpha = 0.0 // NOTE: only applies for fade
                        }
        },
                       completion: { (complete: Bool) in
                        if self.shouldFadeOut == false {
                            completionBlock?()
                        } else {
                            UIView.animate(withDuration: self.fadeDuration, animations: {
                                self.backgroundView.alpha = 0.0
                            }, completion: {(completion: Bool) in
                                self.isFaded = false
                                completionBlock?()
                            })
                        }
        })
    }
    
    // MARK: - Private Methods
    func viewTransitionIn() {
        switch transitionIn {
        case .fromTop:
            modalView.center = CGPoint(x: modalCenterPoint.x, y: -(modalView.bounds.size.height * 0.5))
            modalView.alpha = 1.0
        case .fromBottom:
            modalView.center = CGPoint(x: modalCenterPoint.x, y: view.bounds.size.height + (modalView.bounds.size.height * 0.5))
            modalView.alpha = 1.0
        case .fromLeft:
            modalView.center = CGPoint(x: -(modalView.bounds.size.width * 0.5), y: modalCenterPoint.y)
            modalView.alpha = 1.0
        case .fromRight:
            modalView.center = CGPoint(x: view.bounds.size.width + (modalView.bounds.size.width * 0.5), y: modalCenterPoint.y)
            modalView.alpha = 1.0
        case .fadeFromCenter:
            modalView.center = modalCenterPoint
            modalView.alpha = 0.0
        }
        
        UIView.animate(withDuration: tranisitonDuration,
                       delay: 0.0,
                       usingSpringWithDamping: transitionDamping,
                       initialSpringVelocity: transitionSpringVelocity,
                       options: .curveEaseInOut,
                       animations: {
                        self.modalView.center = self.modalCenterPoint
                        self.modalView.alpha = 1.0 // NOTE: only applies for fade
        },
                       completion: nil)
    }
}

