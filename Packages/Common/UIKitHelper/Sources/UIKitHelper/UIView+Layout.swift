
import UIKit

public extension UIView {
    /// Fitting edges regularly with its parent.
    /// - Parameter insetedBy: inset value between itself and it's parent. Default value is set to `zero`.
    /// - Returns: A collection of `NSLayoutConstraint`.
    @discardableResult
    func alignFitEdges(insetedBy: CGFloat = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leadingAnchor.constraint(
                equalTo: superview!.leadingAnchor,
                constant: insetedBy
            ),
            trailingAnchor.constraint(
                equalTo: superview!.trailingAnchor,
                constant: -insetedBy
            ),
            topAnchor.constraint(
                equalTo: superview!.topAnchor,
                constant: insetedBy
            ),
            bottomAnchor.constraint(
                equalTo: superview!.bottomAnchor,
                constant: -insetedBy
            )
        ]
        return constraints
    }
    
    /// Fitting edges with its parent by the given edge values.
    /// - Parameters:
    ///   - leading: Leading inset value
    ///   - trailing: Trailing inset value
    ///   - top: Top inset value
    ///   - bottom: Bottom inset value
    /// - Returns: A collection of `NSLayoutConstraint`.
    @discardableResult
    func alignEdges(
        leading: CGFloat = .zero,
        trailing: CGFloat = .zero,
        top: CGFloat = .zero,
        bottom: CGFloat = .zero
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            leadingAnchor.constraint(
                equalTo: superview!.leadingAnchor,
                constant: leading
            ),
            trailingAnchor.constraint(
                equalTo: superview!.trailingAnchor,
                constant: -trailing
            ),
            topAnchor.constraint(
                equalTo: superview!.topAnchor,
                constant: top
            ),
            bottomAnchor.constraint(
                equalTo: superview!.bottomAnchor,
                constant: -bottom
            )
        ]
        return constraints
    }
    
    /// Align itself to center of the superview by the given offsets.
    /// - Parameters:
    ///   - xOffSet: x coordinate offset value from the superview center.
    ///   - yOffset: y coordinate offset value from the superview center.
    /// - Returns: A collection of `NSLayoutConstraint`.
    @discardableResult
    func alignCenter(
        xOffSet: CGFloat = .zero,
        yOffset: CGFloat = .zero
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = true
        let constraints = [
            centerXAnchor.constraint(
                equalTo: superview!.centerXAnchor,
                constant: xOffSet
            ),
            centerYAnchor.constraint(
                equalTo: superview!.centerYAnchor,
                constant: yOffset
            )
        ]
        return constraints
    }
}

// MARK: - Activate Constraints
public extension Array where Element == NSLayoutConstraint {
    /// Activates all constraints that included in specified array.
    func activate() {
        NSLayoutConstraint.activate(self)
    }
}
