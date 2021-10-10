
import UIKit

final class AskQuestionsVC: UIViewController {

    //MARK:- Outlets and Variable
    @IBOutlet weak var clcViewQuestions: UICollectionView!
    private var dataSet: [[String: Any]] = [DataClass.setFirstQuestion(), DataClass.setSecondQuestion()]
    private var questionSet = QuestionAnswerSet()
    var gameResult = GameResult()
    
    //MARK:- Contoller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        clcViewQuestions.register(cells: QuestionsCVC.self)
    }
    
}

//MARK:- Collection View Delegate and Datasources
extension AskQuestionsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = QuestionsCVC.dequeReusably(for: collectionView, at: indexPath)
        cell.tag = indexPath.row
        cell.delegate = self
        cell.Configure(dict: dataSet[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width,
                      height: collectionView.frame.size.height)
    }
    
}

extension AskQuestionsVC: QuestionDelegate{
    func selectedOptions(data: [String], question: String) {
        questionSet.question = question
        let str = data.joined(separator: ", ")
        questionSet.answer = str
    }
        
    func nextAction(tag: Int) {
        if questionSet.answer == "" {
            showAlert(message: "Please select atleast one of the following options to proceed")
        }else{
            gameResult.questionSet.append(questionSet)
            switch tag {
            case dataSet.count - 1:
                let vc = ResultVC.instantiateFrom(storyboard: .main)
                vc.gameResult = gameResult
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                questionSet = QuestionAnswerSet()
                let collectionBounds = clcViewQuestions.bounds
                let contentOffset = CGFloat(floor(clcViewQuestions.contentOffset.x + collectionBounds.size.width))
                self.moveCollectionToFrame(contentOffset: contentOffset)
            }
        }
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
           let frame: CGRect = CGRect(x : contentOffset ,y : clcViewQuestions.contentOffset.y ,width : clcViewQuestions.frame.width,height : clcViewQuestions.frame.height)
           clcViewQuestions.scrollRectToVisible(frame, animated: true)
       }
}
