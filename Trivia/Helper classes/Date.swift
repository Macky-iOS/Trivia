

import UIKit

enum DateFormat: String{
    case date = "MMM dd ", time = "hh:mm a"
}

extension Date{
    static func getLocalDate(format: DateFormat) -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
    
   
}
