//
//  Question.swift
//  Personality Quiz
//
//  Created by David Santiago Jamaica Galvis on 2/27/25.
//

import Foundation
struct Question {
    var text : String
    var type : ResponseType
    var answers : [Answer]
}

enum ResponseType {
    case single , multiple , ranged
}
struct Answer {
    var text: String
    var type: AnimalType
}
enum AnimalType: String{
    case ludicolo, mewtwo , wooloo  , torterra
    
    
    var definition : String {
        switch self {
        case .ludicolo :
            return "Often describe it as an incredibly cheerful and outgoing Pokemon that becomes even more energetic when surrounded by people or when it hears music . It thrives in lively enviroments and loves to have fun."
        case .mewtwo :
            return "Is Know for being mischievous yet not outright aggressive. It often does things on its own terms"
        case .wooloo :
            return "Its a healthy and energetic Pokemon that thrives in comfortable and cozy environments, making it a great fit for someone who loves soft things and has a lively spirit"
        case .torterra :
            return "Wise and patient , carrying an entire ecosystem on its back. It moves slowly and steadily, embodying the idea that careful, deliberate actions lead to success"

        }
    }
}
