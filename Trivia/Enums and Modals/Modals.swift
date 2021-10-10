

import Foundation

struct Questions{
    var question: String?
    var option1: String?
    var option2: String?
    var option3: String?
    var option4: String?
    var singleSelection: Bool?
    
    init(data: [String: Any]) {
        question = data["question"] as? String ?? ""
        option1 = data["option1"] as? String ?? ""
        option2 = data["option2"] as? String ?? ""
        option3 = data["option3"] as? String ?? ""
        option4 = data["option4"] as? String ?? ""
        singleSelection = data["singleSelection"] as? Bool ?? false
    }
}

class GameResult{
    var name = String()
    var questionSet = [QuestionAnswerSet]()
    var date = String()
    var time = String()
    
    convenience init(data: [String: Any]){
        self.init()
        name = data["name"] as? String ?? ""
        date = data["date"] as? String ?? ""
        time = data["time"] as? String ?? ""
        let set = data["questonSet"] as? [[String: Any]] ?? []
        for each in set{
            var question = QuestionAnswerSet()
            question.question = each["question"] as? String ?? ""
            question.answer = each["answer"] as? String ?? ""
            questionSet.append(question)
        }
    }
    
    func convertToDict() -> [String: Any]{
        var dictQuestions = [[String: Any]]()
        for each in questionSet{
            let dict: [String: Any] = ["question": each.question, "answer": each.answer]
            dictQuestions.append(dict)
        }
        let param: [String: Any] = ["name": name, "questonSet": dictQuestions, "date": date, "time": time]
        return param
        
    }
}

struct QuestionAnswerSet{
    var question = String()
    var answer = String()
}
