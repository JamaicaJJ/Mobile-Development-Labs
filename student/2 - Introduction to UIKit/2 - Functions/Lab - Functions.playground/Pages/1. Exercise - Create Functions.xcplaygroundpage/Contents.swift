/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself (inTro:String){
    print("Hello, \(inTro)")
}
introduceMyself(inTro:"My name is David")
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation
func magicEightBall(randomNum : Int) {
    let randomNum = Int.random(in: 0...4)
    if randomNum == 0 {
        print("No luck")
    } else if randomNum == 1 {
        print("vas a tener un dia estresante")
    }else if randomNum == 2 {
        print ("hoy sera un dia tranquilo ")
    }else if randomNum == 3 {
        print ("hoy sera un Gran dia")
    }else if randomNum == 4 {
        print ("Hoy sera un dia de logros")
        
    }
}
magicEightBall(randomNum: 8)
