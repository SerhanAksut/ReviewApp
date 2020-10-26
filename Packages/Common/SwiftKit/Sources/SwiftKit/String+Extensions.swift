
import Foundation

public extension String {
    var trimmed: Self {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
