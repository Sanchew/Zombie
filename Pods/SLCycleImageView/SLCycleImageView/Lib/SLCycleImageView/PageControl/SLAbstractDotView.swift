import UIKit
class SLAbstractDotView: UIView {
    
    @objc func changeActivityState(_ active: Bool) {
//        NSException.exceptionWithName(NSInternalInconsistencyException, reason: "You must override \(NSStringFromSelector(cmd)) in \(self.self)", userInfo: nil)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}

