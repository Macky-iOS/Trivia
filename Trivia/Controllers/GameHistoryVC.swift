
import UIKit

class GameHistoryVC: UIViewController {

    //MARK:- Outlets and Variables
    @IBOutlet weak var tblViewHistory: UITableView!
    
    private var arrGameData = [GameResult]()
    
    //MARK:- Controller Life Cycle And Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewHistory.register(cells: HistoryTVC.self)
        fetchData()
    }
    
    //MARK:- Private function
    private func fetchData(){
        let data = GameData.fetchAllGameDataArray()
        for each in data{
            var dicData = [String: Any]()
            dicData["name"] = (each.value(forKey: "name") as! String)
            dicData["date"] = (each.value(forKey: "date") as! String)
            dicData["time"] = (each.value(forKey: "time") as! String)
            dicData["questonSet"] = (each.value(forKey: "questionAnswerSet") as? [NSDictionary] ?? [:])
            let result = GameResult(data: dicData)
            arrGameData.append(result)
        }
        tblViewHistory.reloadData()
    }
    
    //MARK:- Btn Actions
    
    @IBAction func btnBackPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension GameHistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrGameData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HistoryTVC.dequeReusably(for: tableView, at: indexPath)
        cell.tag = indexPath.row
        cell.congigure(data: arrGameData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
