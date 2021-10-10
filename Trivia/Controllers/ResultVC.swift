

import UIKit

class ResultVC: UIViewController {

    //MARK:- Outlets & Variables
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnfinishOutlet: UIButton!
    @IBOutlet weak var tblViewAnswers: UITableView!
    var gameResult = GameResult()
    
    //MARK:- Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewAnswers.register(cells: AnswersTVC.self)
        setUp()
    }
    
    //MARK:- PrivateFunctions
    private func setUp(){
        lblName.text = "Hello \(gameResult.name)"
        saveData()
        btnfinishOutlet.layer.cornerRadius = 25
        btnfinishOutlet.layer.borderColor = UIColor.white.cgColor
        btnfinishOutlet.layer.borderWidth = 2
    }
    
    private func saveData(){
        GameData.saveGameDataDict(Response: gameResult.convertToDict() as NSDictionary)
    }
    
    
    //MARK:- Button Actions
    
    @IBAction func btnFinish(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnHistory(_ sender: UIButton) {
        let vc = GameHistoryVC.instantiateFrom(storyboard: .main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK:- Table View Delegate & Datasource

extension ResultVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameResult.questionSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AnswersTVC.dequeReusably(for: tableView, at: indexPath)
        cell.configure(data: gameResult.questionSet[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
