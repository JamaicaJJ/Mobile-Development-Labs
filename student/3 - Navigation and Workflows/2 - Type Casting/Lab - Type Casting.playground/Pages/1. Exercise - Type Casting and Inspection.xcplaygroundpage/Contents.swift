/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let cosas = [1, 2, 5, 2.4, 3.4, 5.4, "Goku", "Bella", "Alejandro"] as [Any]

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for cosa in cosas {
    if let number = cosa as? Int {
        print("The integer has a value of \(cosa)")
    }
    if let duble = cosa as? Double {
        print("The double has a value of \(cosa)")
    }
    if let strin = cosa as? String {
        print("The String has a value of \(cosa)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var bakery = ["Cookies": 4 , "Conos": 5 , "Pasteles": 3.4 , "Empanadas" : false , "Bunuelos": "13"] as [String : Any]

//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total : Double = 0
for (key, value) in bakery {
    if let conteo = value as? Int {
        total += Double(conteo)
    }
    if let dos = value as? Double{
        total += dos
    }
    if let palabara = value as? String {
        total += 1
    }
    if let verdadero = value as? Bool {
        total += 2
    }
    
}
print(total)

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 : Double = 0
for (key, value) in bakery {
    if let conteo = value as? Int {
        total += Double(conteo)
    }
    if let dos = value as? Double{
        total += dos
    }
    if let palabara = value as? String {
        total += Double(palabara)!
        
        
    }
    
}
print(total)


/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
