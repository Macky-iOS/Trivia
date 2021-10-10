//
//  ConfirmUserNameVC.swift
//  Trivia
//
//  Created by Mayank Sharma  on 10/10/21.
//

import UIKit

class ConfirmUserNameVC: UIViewController {

    //MARK:- Outlet and Variables
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var btnNextOutlet: UIButton!
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
            showAlert(message: "Please enter your name to proceed any further.")
        }else{
            gameResult.name = txtFldName.text ?? ""
            let vc = AskQuestionsVC.instantiateFrom(storyboard: .main)
            vc.gameResult = gameResult
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func btnNEXT(_ sender: UIButton) {
        checkValidations()
    }
    

}
