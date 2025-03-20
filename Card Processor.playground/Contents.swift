import Foundation


protocol PaymentProcessor {
    func processPayment(amount: Double, card: CreditCard) -> Bool
}

protocol RewardClubVerifier {
    func verifyMembership(card: CreditCard) -> Bool
}


struct CreditCard {
    let number: String
    let expiryDate: String
    let cardholderName: String
}


class CreditCardProcessor: PaymentProcessor {
    func processPayment(amount: Double, card: CreditCard) -> Bool {
        return true
    }
}


class RewardClubChecker: RewardClubVerifier {
    func verifyMembership(card: CreditCard) -> Bool {
        print("Verifying reward club membership for card ")
        return true
    }
}



class CreditCardVerification {
    private let paymentProcessor: PaymentProcessor
    private let rewardClubVerifier: RewardClubVerifier
    
    init(paymentProcessor: PaymentProcessor, rewardClubVerifier: RewardClubVerifier) {
        self.paymentProcessor = paymentProcessor
        self.rewardClubVerifier = rewardClubVerifier
    }
    
    func verifyAndProcessPayment(amount: Double, card: CreditCard) -> Bool {
        if rewardClubVerifier.verifyMembership(card: card) {
            print("club membership verified.")
            return paymentProcessor.processPayment(amount: amount, card: card)
        } else {
            print("Not a member of the reward club.")
            return false
        }
    }
}


let paymentProcessor = CreditCardProcessor()
let rewardClubVerifier = RewardClubChecker()
let verification = CreditCardVerification(paymentProcessor: paymentProcessor, rewardClubVerifier: rewardClubVerifier)

let card = CreditCard(number: "1534 5698 5601 9021", expiryDate: "11/25", cardholderName: "David")


let paymentSuccess = verification.verifyAndProcessPayment(amount: 109.0, card: card)
print("Payment success: \(paymentSuccess)")


