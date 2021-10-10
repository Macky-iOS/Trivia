
import UIKit

final class AnswersTVC: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet private weak var lblQuestion: UILabel!
    @IBOutlet private weak var lblAnswer: UILabel!
    
    func configure(data: QuestionAnswerSet){
        lblQuestion.text = data.question
        lblAnswer.text = data.answer
    }
    
}
