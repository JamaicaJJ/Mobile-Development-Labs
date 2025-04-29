import UIKit

func printGeneric<T>(_ generic: T) {
    print(generic)
}

printGeneric(10)
printGeneric(10.5)
printGeneric("hello World")

