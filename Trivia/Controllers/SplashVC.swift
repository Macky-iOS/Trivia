
import UIKit

final class SplashVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        goToMainScreen()
    }
    
    private func goToMainScreen(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let vc = ConfirmUserNameVC.instantiateFrom(storyboard: .main)
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }

}
