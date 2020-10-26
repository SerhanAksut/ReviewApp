
import Foundation

public extension Array where Element == String {
    func findTopWords(prefix: Int) -> Self {
        var uniqueWords: [(String, UInt)] = []
        
        self.flatMap { $0.components(separatedBy: .whitespacesAndNewlines) }
            .map { $0.lowercased().onlyWords }
            .filter { $0.count >= 4 }
            .enumerated()
            .forEach { index, word in
                let wordIndex = uniqueWords.firstIndex {
                    $0.0.trimmed == word.trimmed
                }
                if let index = wordIndex {
                    let copy = uniqueWords[index]
                    uniqueWords[index] = (copy.0, copy.1 + 1)
                } else {
                    uniqueWords.append((word, 1))
                }
            }
        
        return uniqueWords
            .sorted(by: { $0.1 > $1.1 })
            .prefix(prefix)
            .map { $0.0 }
    }
}
