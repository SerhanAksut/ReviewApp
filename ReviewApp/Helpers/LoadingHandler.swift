
import UIKit

public protocol LoadingHandler where Self: UIViewController {
    func showLoading()
    func removeLoading()
}

public extension LoadingHandler {
    func showLoading() {
        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        NSLayoutConstraint.activate([
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func removeLoading() {
        view.subviews.forEach {
            if $0 is LoadingView {
                $0.removeFromSuperview()
            }
        }
    }
}
