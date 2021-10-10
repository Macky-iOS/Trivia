
import UIKit

class HistoryTVC: UITableViewCell {

    //MARK:- Outlet
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblViewAnswers: UITableView!
    
    //MARK:- Variables And Constants
    private var gameResult = GameResult()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tblViewAnswers.register(cells: AnswersTVC.self)
    }

    func congigure(data: GameResult){
        lblDate.text = "Game \(self.tag + 1): \(data.date) \(data.time)"
        lblName.text = "Name: \(data.name)"
        gameResult = data
        tblViewAnswers.reloadData()
    }
    
}

extension HistoryTVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameResult.questionSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AnswersTVC.dequeReusably(for: tableView, at: indexPath)
        cell.configure(data: gameResult.questionSet[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(tableView.contentSize)
       return  UITableView.automaticDimension
    }
    
}
