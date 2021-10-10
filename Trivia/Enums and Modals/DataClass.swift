
import UIKit

//MARK:- This class is just made so that we can get data in the format of JSON so if any data come from the API it can get processed and we don't have to change anything. This is basically the raw assuption of data coming from API.


class DataClass{
    static func setFirstQuestion() -> [String: Any]{
        let param: [String: Any] = ["question": "Who is the best cricketer in the world?",
                                    "option1": "Sachin Tendulkar",
                                    "option2": "Virat Kolli",
                                    "option3": "Adam Gilchirst",
                                    "option4": "Jacques Kallis",
                                    "singleSelection": true
        ]
        return param
    }
    
    static func setSecondQuestion() -> [String: Any]{
        let param: [String: Any] = ["question": "What are the colors in the Indian national flag?",
                                    "option1": "White",
                                    "option2": "Yellow",
                                    "option3": "Orange",
                                    "option4": "Green",
                                    "singleSelection": false
        ]
        return param
    }
}

