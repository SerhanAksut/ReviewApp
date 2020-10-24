
#if canImport(SwiftUI) && DEBUG
import SwiftUI
import UIKit

/// Makes UIView previewable
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    public let view: View

    /// - Parameter builder: a closure that returns a UIView
    public init(_ builder: @escaping () -> View) {
        view = builder()
    }

    // MARK: - UIViewRepresentable
    public func makeUIView(context: Context) -> UIView {
        return view
    }

    public func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

/// Makes UIViewController previewable
public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    public let viewController: ViewController

    /// - Parameter builder: any closure that returns a UIViewController
    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    public func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    public func updateUIViewController(
        _ uiViewController: ViewController,
        context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>
    ) {
        return
    }
}
#endif
