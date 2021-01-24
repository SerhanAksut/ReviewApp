
import UIKit

public protocol ErrorHandler where Self: UIViewController {
    func showAlert(
        title: String,
        message: String,
        buttonTitle: String
    )
}

public extension ErrorHandler {
    func showAlert(
        title: String,
        message: String,
        buttonTitle: String
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
