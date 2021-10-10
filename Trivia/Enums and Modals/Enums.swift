

import UIKit

enum OptionType{
    case singleSelection, multipleSelection
}


extension OptionType{
    enum imageType: String{
        case singleSelection,singleSelectionSelected,multipleSelectionselected
        
        var value: UIImage {
            return UIImage(named: rawValue) ?? UIImage()
        }
    }
}
