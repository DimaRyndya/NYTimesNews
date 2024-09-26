import Foundation

extension String {

    func toFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if let date = formatter.date(from: self) {
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter.string(from: date)
        }

        return self
    }
}
