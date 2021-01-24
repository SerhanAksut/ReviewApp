
import UIKit

public final class LoadingView: UIView {
    
    // MARK: - Properties
    private let indicator = with(UIActivityIndicatorView(style: .large)) {
        $0.hidesWhenStopped = true
        $0.startAnimating()
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.appBlackColor.withAlphaComponent(0.3)
        
        addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
