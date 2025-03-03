import UIKit
protocol MyCustomEquatable {
    func isEqual(to other: Self) -> Bool
}

struct Car: MyCustomEquatable {
    var make: String
    var model: String
    
    func isEqual(to other: Car) -> Bool {
        return self.make == other.make && self.model == other.model
    }
}

let car1 = Car(make: "Toyota", model: "Corolla")
let car2 = Car(make: "Toyota", model: "Corolla")

if car1.isEqual(to: car2) {
    print("These cars are the same")
}
