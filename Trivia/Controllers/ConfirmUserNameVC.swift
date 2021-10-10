
import UIKit

final class ConfirmUserNameVC: UIViewController {

    //MARK:- Outlet and Variables
    @IBOutlet private weak var txtFldName: UITextField!
    @IBOutlet private weak var btnNextOutlet: UIButton!
    private var gameResult = GameResult()
    
    //MARK:- Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNextOutlet.layer.borderColor = UIColor.white.cgColor
        btnNextOutlet.layer.borderWidth = 2
        btnNextOutlet.layer.cornerRadius = 25
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtFldName.text = nil
    }
    
    //MARK:- Private function and Btn Actions
    
    private func checkValidations(){
        if txtFldName.text == ""{
            showAlert(message: ConstantsStrings.Stringss.needNameMessage)
        }else{
            gameResult.name = txtFldName.text ?? ""
            gameResult.date = Date.getLocalDate(format: .date)
            gameResult.time = Date.getLocalDate(format: .time)
            let vc = AskQuestionsVC.instantiateFrom(storyboard: .main)
            vc.gameResult = gameResult
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func btnNEXT(_ sender: UIButton) {
        checkValidations()
    }
    

}
