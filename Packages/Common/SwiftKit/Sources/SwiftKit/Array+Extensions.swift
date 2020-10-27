
import Foundation

public extension Array where Element == String {
    func findTopWords(prefix: Int) -> Self {
        var uniqueWords: [String: UInt] = [:]
        self.forEach {
            let words = $0.components(separatedBy: .whitespacesAndNewlines)
            words.forEach {
                guard $0.count >= 4 else { return }
                let word = $0.lowercased().onlyWords
                if let count = uniqueWords[word] {
                    uniqueWords[word] = count + 1
                } else {
                    uniqueWords[word] = 1
                }
            }
        }
        let topWords = uniqueWords
            .sorted(by: { $0.value > $1.value })
            .prefix(prefix)
            .map { $0.key }
        
        return topWords
    }
}
