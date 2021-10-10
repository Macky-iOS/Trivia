
import Foundation
import CoreData


extension GameData {

    static func fetchAllGameDataArray() -> [GameData]{
        let managedContext = AppDelegate.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "GameData")
        do {
            let people = try managedContext.fetch(fetchRequest)
            return (people as? [GameData])!
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }




    static func saveGameDataDict(Response: NSDictionary) {
        let context = AppDelegate.shared.persistentContainer.viewContext
        guard let gameDict = NSEntityDescription
            .insertNewObject(forEntityName: "GameData", into: context) as? GameData else {
                return
        }

        gameDict.date = Response["date"] as? String ?? ""
        gameDict.time = Response["time"] as? String ?? ""
        gameDict.name = Response["name"] as? String ?? ""
        gameDict.questionAnswerSet = Response["questonSet"] as? NSObject


        AppDelegate.shared.saveContext()
    }
}

