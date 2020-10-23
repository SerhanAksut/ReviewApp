
/// This function is used to configure values inline as single expression
/// - Parameters:
///   - val: value that will be configured
///   - configure: configuration closure
/// - Returns: configured value
@discardableResult
public func with<T>(_ val: T, _ configure: (inout T) -> Void) -> T {
    var copy = val
    configure(&copy)
    return copy
}
