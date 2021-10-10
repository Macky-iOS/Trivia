
//MARK:- It is visible that I have use table/colloection view cells so this is just a class I made so that I don't have to write all that bulky code everytime to initialize any cell or registering any XIB.


import UIKit

protocol Registerable {
    static var identifier: String { get }
    static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self
}

extension Registerable {
    static var identifier: String { return "\(self)" }

    internal static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T {
        if let table = parent as? UITableView {
            return table.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        } else {
            return (parent as! UICollectionView).dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
        }
    }
    
    /**
     Instantiate via Dequeing cells(TableViewCell or CollectionViewCells) reusably
     - parameter parent: (TableView or CollectionView) object for which cells are required
     - parameter indexPath: IndexPath for the cell
     */
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self {
        return cellFor(parent, indexPath)
    }
}

extension UITableViewCell: Registerable { }
extension UICollectionViewCell: Registerable { }

extension UIDataSourceTranslating {
    /**
     Register cells from XIB to your collection or table views
     - parameter cells: Class names of required TableView or Collectionview cells you need to register to your table or collectionview
     */
    func register(cells: Registerable.Type...) {
        if let tableViewCells = cells as? [UITableViewCell.Type] {
            tableViewCells.forEach {
                (self as? UITableView)?.register(UINib(nibName: $0.identifier, bundle: nil),
                                                 forCellReuseIdentifier: $0.identifier)
            }
        } else if let clctionViewCells = cells as? [UICollectionViewCell.Type] {
            clctionViewCells.forEach {
                (self as? UICollectionView)?.register(UINib(nibName: $0.identifier, bundle: nil),
                                                      forCellWithReuseIdentifier: $0.identifier)
            }
        }
    }
    
}
