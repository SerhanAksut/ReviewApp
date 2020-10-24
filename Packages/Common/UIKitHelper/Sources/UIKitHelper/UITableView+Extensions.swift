
import UIKit

public extension UITableView {
    func dequeue<T: ViewIdentifier>(at indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(
            withIdentifier: T.identifier,
            for: indexPath
        ) as? T {
            return cell
        }
        fatalError("can not dequeue cell with identifier \(T.identifier) from tableView \(self)")
    }
}
