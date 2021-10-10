
import UIKit

protocol QuestionDelegate: class {
    func selectedOptions(data: [String], question: String)
    func nextAction(tag: Int)
}

final class QuestionsCVC: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var lblQuestion: UILabel!
    @IBOutlet private weak var lblOption4: UILabel!
    @IBOutlet private weak var lblOption3: UILabel!
    @IBOutlet private weak var lblOption1: UILabel!
    @IBOutlet private weak var lblOption2: UILabel!
    @IBOutlet private weak var btnOption1: UIButton!
    @IBOutlet private weak var btnOption2: UIButton!
    @IBOutlet private weak var btnOption3: UIButton!
    @IBOutlet private weak var btnOption4: UIButton!
    @IBOutlet private weak var btnNextoutlet: UIButton!
    
    
    //MARK:- Variables and Constants
    private var selectionOption: OptionType = .singleSelection
    private var arrSelectedOption = [String]()
    weak var delegate: QuestionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- Internal Helper Function
    
    func Configure(dict: [String: Any]){
        let data = Questions(data: dict)
        lblQuestion.text = data.question
        lblOption1.text = data.option1
        lblOption2.text = data.option2
        lblOption3.text = data.option3
        lblOption4.text = data.option4
        selectionOption = data.singleSelection ?? false ? (OptionType.singleSelection) : (OptionType.multipleSelection)
        changeButtonAppereance()
        
    }
    
    private func changeButtonAppereance(){
        let selectionImage: UIImage = selectionOption == OptionType.singleSelection ?
            (OptionType.imageType.singleSelectionSelected.value) : (OptionType.imageType.multipleSelectionselected.value)
        btnOption1.setImage(OptionType.imageType.singleSelection.value, for: .normal)
        btnOption2.setImage(OptionType.imageType.singleSelection.value, for: .normal)
        btnOption3.setImage(OptionType.imageType.singleSelection.value, for: .normal)
        btnOption4.setImage(OptionType.imageType.singleSelection.value, for: .normal)
        btnOption1.setImage(selectionImage, for: .selected)
        btnOption2.setImage(selectionImage, for: .selected)
        btnOption3.setImage(selectionImage, for: .selected)
        btnOption4.setImage(selectionImage, for: .selected)
        btnNextoutlet.layer.borderColor = UIColor.white.cgColor
        btnNextoutlet.layer.borderWidth = 2
        btnNextoutlet.layer.cornerRadius = 25
    }
    
    private func disableSelection(btn: UIButton){
        btnOption1.isSelected = false
        btnOption2.isSelected = false
        btnOption3.isSelected = false
        btnOption4.isSelected = false
        btn.isSelected = true
        confirmSelectedItems()
    }
    
    private func confirmSelectedItems(){
        arrSelectedOption.removeAll()
        let arr = [btnOption1, btnOption2, btnOption3, btnOption4]
        for each in arr{
            if each?.isSelected ?? false{
                arrSelectedOption.append(getDataByButton(btn: each ?? UIButton()))
            }
        }
        delegate?.selectedOptions(data: arrSelectedOption, question: lblQuestion.text ?? "")
    }
    
    private func getDataByButton(btn: UIButton) -> String{
        switch btn {
        case btnOption1: return lblOption1.text ?? ""
        case btnOption2: return lblOption2.text ?? ""
        case btnOption3: return lblOption3.text ?? ""
        default: return lblOption4.text ?? ""
        }
    }
    
    //MARK:- Button Actions
    @IBAction func btnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if selectionOption == .singleSelection{
            disableSelection(btn: sender)
        }else{
            confirmSelectedItems()
        }
    }
    
    @IBAction func btnNextAction(_ sender: UIButton) {
        delegate?.nextAction(tag: self.tag)
    }
    
}
