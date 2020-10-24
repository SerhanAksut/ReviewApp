
import UIKit

public protocol LoadingHandler where Self: UIViewController {
    func showLoading()
    func removeLoading()
}

public extension LoadingHandler {
    func showLoading() {
        let loadingView = LoadingView()
        view.addSubview(loadingView)
        loadingView.alignFitEdges().activate()
    }
    
    func removeLoading() {
        view.subviews.forEach {
            if $0 is LoadingView {
                $0.removeFromSuperview()
            }
        }
    }
}
