import Foundation

/// Parses the five-level battery marker used by the Android implementation.
enum BatteryAdvertisementParser {
    static func parse(_ scanRecord: Data?) -> Int? {
        guard let scanRecord, !scanRecord.isEmpty else { return nil }
        var offset = 0
        while offset < scanRecord.count {
            let length = Int(scanRecord[offset])
            if length == 0 { break }
            let end = offset + 1 + length
            guard end > offset, end <= scanRecord.count else { break }
            if length >= 2, scanRecord[offset + 1] == 0xFF {
                let value = Int(scanRecord[end - 1])
                if (1...5).contains(value) { return value }
            }
            offset = end
        }
        let last = Int(scanRecord[scanRecord.count - 1])
        return (1...5).contains(last) ? last : nil
    }
}
