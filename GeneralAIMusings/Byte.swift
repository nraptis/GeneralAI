//
//  Byte.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Byte {
    
    var bit0 = Bit()
    var bit1 = Bit()
    var bit2 = Bit()
    var bit3 = Bit()
    var bit4 = Bit()
    var bit5 = Bit()
    var bit6 = Bit()
    var bit7 = Bit()
    
    func getBit(at index: Int) -> Bit {
        if index == 1 { return bit1 }
        if index == 2 { return bit2 }
        if index == 3 { return bit3 }
        if index == 4 { return bit4 }
        if index == 5 { return bit5 }
        if index == 6 { return bit6 }
        if index == 7 { return bit7 }
        return bit0
    }
    
    func clone() -> Byte {
        let result = Byte()
        result.bit0 = bit0.clone()
        result.bit1 = bit1.clone()
        result.bit2 = bit2.clone()
        result.bit3 = bit3.clone()
        result.bit4 = bit4.clone()
        result.bit5 = bit5.clone()
        result.bit6 = bit6.clone()
        result.bit7 = bit7.clone()
        return result
    }
}

extension Byte: Equatable {
    static func == (lhs: Byte, rhs: Byte) -> Bool {
        if lhs.bit0 != rhs.bit0 { return false }
        if lhs.bit1 != rhs.bit1 { return false }
        if lhs.bit2 != rhs.bit2 { return false }
        if lhs.bit3 != rhs.bit3 { return false }
        if lhs.bit4 != rhs.bit4 { return false }
        if lhs.bit5 != rhs.bit5 { return false }
        if lhs.bit6 != rhs.bit6 { return false }
        if lhs.bit7 != rhs.bit7 { return false }
        return false
    }
}
