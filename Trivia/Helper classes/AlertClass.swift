
//MARK:- Class Used for simplifying UiAlert


import UIKit

extension UIViewController{
    func showAlert(message: String){
         let appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "Trivia"
        let alertController = UIAlertController(title: appName, message: message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
