/*:
## Exercise - Functions and Optionals

 If an app asks for a user's age, it may be because the app requires a user to be over a certain age to use some of the services it provides. Write a function called `checkAge` that takes one parameter of type `String`. The function should try to convert this parameter into an `Int` value and then check if the user is over 18 years old. If he/she is old enough, print "Welcome!", otherwise print "Sorry, but you aren't old enough to use our app." If the `String` parameter cannot be converted into an `Int` value, print "Sorry, something went wrong. Can you please re-enter your age?" Call the function and pass in `userInputAge` below as the single parameter. Then call the function and pass in a string that can be converted to an integer.
 */
func checkAge(agevar: String) -> Int {
     if let intAge = Int(agevar) {
         if intAge >= 18 {
             print("Welcome!")
         } else {
             print("Sorry, but you aren't old enough to use our app.")
         }
         return intAge
     } else {
         print("Sorry, something went wrong. Can you please re-enter your age?")
         return -1
     }
 }


//:  Go back and update your function to return the age as an integer. Will your function always return a value? Make sure your return type accurately reflects this. Call the function and print the return value.
let userInputAge1 = "20"
let returnedAge1 = checkAge(agevar: userInputAge1)
print("Returned age: \(returnedAge1)")

//:  Imagine you are creating an app for making purchases. Write a function that will take in the name of an item for purchase as a `String` and will return the cost of that item as an optional `Double`. In the body of the function, check to see if the item is in stock by accessing it in the dictionary `stock`. If it is, return the price of the item by accessing it in the dictionary `prices`. If the item is out of stock, return `nil`. Call the function and pass in a `String` that exists in the dictionaries below. Print the return value.
var prices = ["Chips": 3.69, "Donuts": 1.89, "Juice": 4.99, "Apple": 0.70, "Banana": 0.53, "Broccoli": 1.99]
var stock = ["Chips": 4, "Donuts": 0, "Juice": 12, "Apple": 6, "Banana": 6, "Broccoli": 3]

func getItemPrice(for item: String) -> Double? {
    if let itemStock = stock[item], itemStock > 0 {
        if let itemPrice = prices[item] {
            return itemPrice
        }
    }
    return nil
}

let product = "Chips"
if let price = getItemPrice(for: product) {
    print("The price of \(product) is $\(price).")
} else {
    print("\(product) is out of stock or unavailable.")
}

let outOfStockProduct = "Donuts"
if let price = getItemPrice(for: outOfStockProduct) {
    print("The price of \(outOfStockProduct) is $\(price).")
} else {
    print("\(outOfStockProduct) is out of stock or unavailable.")
}


/*:
[Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Food Functions](@next)
 */
