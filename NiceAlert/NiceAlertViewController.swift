
import UIKit

class NiceAlertViewController: NiceBaseViewController {

    // MARK: - Outlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    @IBOutlet var titleArea: UIView!
    @IBOutlet var messageArea: UIView!
    @IBOutlet var button1Area: UIView!
    @IBOutlet var button2Area: UIView!
    @IBOutlet var button3Area: UIView!
    @IBOutlet var button4Area: UIView!
    
    // MARK: - Private Properties
    private var viewModel: NiceAlertViewModel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil, "configure not called")
        
        viewModel.callback = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .initial(let titleText, let messageText, let button1Text, let button2Text, let button3Text, let button4Text, let cancelButtonText):
                self.initialViewSetup(titleText: titleText, messageText: messageText, button1Text: button1Text, button2Text: button2Text, button3Text: button3Text, button4Text: button4Text, cancelButtonText: cancelButtonText)
                
            case .dismiss:
                self.dismiss(animated: false, completion: nil)
            }
        }
        
        viewModel.setupInitialState()
    }
    // MARK: - Public Methods
    func configure(alert: NiceAlert) {
        viewModel = NiceAlertViewModel.init(alert: alert)
    }
    
    // MARK: - Private Methods
    func initialViewSetup(titleText: String?, messageText: String?, button1Text: String?, button2Text: String?, button3Text: String?, button4Text: String?, cancelButtonText: String?) {
        
        var hasCancelButton = false
        if let cancelButtonText = cancelButtonText {
            hasCancelButton = true
            cancelButton.setTitle(cancelButtonText, for: .normal)
        } else {
            cancelButton.isHidden = true
        }
        
        if let titleText = titleText {
            titleLabel.text = titleText
        } else if !hasCancelButton {
            titleArea.isHidden = true
        }
        
        if let messageText = messageText {
            messageLabel.text = messageText
        } else {
            messageArea.isHidden = true
        }
        
        if let button1Text = button1Text {
            button1.setTitle(button1Text, for: .normal)
        } else {
            button1Area.isHidden = true
        }
        
        if let button2Text = button2Text {
            button2.setTitle(button2Text, for: .normal)
        } else {
            button2Area.isHidden = true
        }
        
        if let button3Text = button3Text {
            button3.setTitle(button3Text, for: .normal)
        } else {
            button3Area.isHidden = true
        }
        
        if let button4Text = button4Text {
            button4.setTitle(button4Text, for: .normal)
        } else {
            button4Area.isHidden = true
        }
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        viewTransitionOutAndClose {
            self.viewModel.cancelTapped()
        }
    }
    
    @IBAction func button1Tapped(_ sender: Any) {
        viewTransitionOutAndClose {
            self.viewModel.button1Tapped()
        }
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        viewTransitionOutAndClose {
            self.viewModel.button2Tapped()
        }
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        viewTransitionOutAndClose {
            self.viewModel.button3Tapped()
        }
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        viewTransitionOutAndClose {
            self.viewModel.button4Tapped()
        }
    }
}
