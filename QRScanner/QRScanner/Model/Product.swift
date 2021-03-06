import Foundation
import Firebase
import FirebaseDatabase

struct Product {
    var name: String?
    var icon: String?
    var description: String?
    var price: Int?
    var ref: DatabaseReference?

    var completed: Bool = false

    init(name: String, price: Int ,icon: String, description: String) {
        self.name = name
        self.icon = icon
        self.description = description
        self.price = price
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as? [String: AnyObject]
        name = snapshotValue?["name"] as? String
        icon = snapshotValue?["icon"] as? String
        description = (snapshotValue?["description"] as! String)
        price = snapshotValue?["price"] as? Int
        completed = snapshotValue?["completed"] as! Bool
        ref = snapshot.ref
    }

    func convertToDictionary() -> Any {
        return ["name": name,"price": price, "icon": icon, "description": description,"price": price, "completed": completed]
    }
}
