
import UIKit

class NiceBaseBackgroundView: UIView {
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        isOpaque = true
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let componentCount: Int = 2
        let locations: [CGFloat] = [0.0, 1.0]
        let colors: [CGFloat] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: colors, locations: locations, count: componentCount)
        let center = CGPoint.init(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        let radius: CGFloat = min(self.bounds.size.width, self.bounds.size.height)
        
        if let context = context,
            let gradient = gradient {
            context.drawRadialGradient(gradient, startCenter: center, startRadius: 0, endCenter: center, endRadius: radius, options: .drawsAfterEndLocation)
        }
    }
    
}
