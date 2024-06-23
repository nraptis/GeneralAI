//
//  Bit.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Bit {
    var value = false
    
    func clone() -> Bit {
        var result = Bit()
        result.value = value
        return result
    }
    
}

extension Bit: Equatable {
    static func == (lhs: Bit, rhs: Bit) -> Bool {
        lhs.value == rhs.value
    }
}
