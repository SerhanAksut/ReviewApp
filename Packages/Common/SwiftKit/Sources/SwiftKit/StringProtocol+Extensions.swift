
public extension StringProtocol {
    var onlyWords: String {
        split(whereSeparator: \.isLetter.negation).joined()
    }
}

private extension Bool {
    var negation: Bool {
        !self
    }
}
