/*:
## Exercise - Numeric Type Conversion

 Create an integer constant `x` with a value of 10, and a double constant `y` with a value of 3.2. Create a constant `multipliedAsIntegers` equal to `x` times `y`. Does this compile? If not, fix it by converting your `Double` to an `Int` in the mathematical expression. Print the result.
 */
let X : Double = 10
let Y = 3.2
let multipliedAsIntegres = (Int(X) * Int(Y))
print (multipliedAsIntegres)


let multipliedAsDoubles = (X * Y)
print (multipliedAsDoubles)

//:  Are the values of `multipliedAsIntegers` and `multipliedAsDoubles` different? Print a statement to the console explaining why.
//No because both give the same result and the expresion is the same multiplication

/*:
[Previous](@previous)  |  page 7 of 8  |  [Next: App Exercise - Converting Types](@next)
 */
