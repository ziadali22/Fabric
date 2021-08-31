
/*import Foundation
import SwiftEntryKit
extension UIViewController {
func showpopView(myView: UIView,hieght: CGFloat) {
    var attributes = EKAttributes()
    attributes = .centerFloat
    attributes.hapticFeedbackType = .success
    attributes.displayDuration = .infinity
    attributes.screenBackground = .visualEffect(style: .light)
    attributes.entryBackground = .clear
    attributes.screenInteraction = .dismiss
    attributes.entryInteraction = .absorbTouches
    
    attributes.entranceAnimation = .init(translate: .init(duration: 0.6, spring: .init(damping: 0.9, initialVelocity: 0)),
                                         scale: .init(from: 0.8, to: 1, duration: 0.6, spring: .init(damping: 0.8, initialVelocity: 0)),
                                         fade: .init(from: 0.7, to: 1, duration: 0.3))
    attributes.exitAnimation = .init(translate: .init(duration: 0.5),
                                     scale: .init(from: 1, to: 0.8, duration: 0.5),
                                     fade: .init(from: 1, to: 0, duration: 0.5))
    attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3),
                                                        scale: .init(from: 1, to: 0.8, duration: 0.3)))
    attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 6))
    attributes.positionConstraints.verticalOffset = 10
    attributes.positionConstraints.size = .init(width: .offset(value: 20), height: .constant(value: hieght))
    attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.minEdge), height: .intrinsic)
    attributes.statusBar = .inferred
    SwiftEntryKit.display(entry: myView, using: attributes)
}

}
extension UIScreen {
    var minEdge: CGFloat {
        return UIScreen.main.bounds.minEdge
    }
}
extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}
extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(type(of: self).className, owner: self, options: nil)?.first as? T else {
            return nil
        }
        addSubview(contentView)
        contentView.fillSuperview()
        return contentView
    }
}
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

*/
