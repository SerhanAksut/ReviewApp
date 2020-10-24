
import UIKit

public final class LoadingView: UIView {
    
    // MARK: - Properties
    private let indicator = with(UIActivityIndicatorView(style: .large)) {
        $0.hidesWhenStopped = true
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        addSubview(indicator)
        indicator.alignCenter().activate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - External Helpers
public extension LoadingView {
    func showLoading() {
        indicator.startAnimating()
    }
    
    func hideLoading() {
        indicator.stopAnimating()
    }
}
