
import UIKit

class AnswersTVC: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    
    func configure(data: QuestionAnswerSet){
        lblQuestion.text = data.question
        lblAnswer.text = data.answer
    }
    
}
