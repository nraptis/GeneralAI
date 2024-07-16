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
    
    init() {
        
    }
    
    init(uint8: UInt8) {
        bit0.value = (((uint8 >> 0) & 1) == 1) ? true : false
        bit1.value = (((uint8 >> 1) & 1) == 1) ? true : false
        bit2.value = (((uint8 >> 2) & 1) == 1) ? true : false
        bit3.value = (((uint8 >> 3) & 1) == 1) ? true : false
        bit4.value = (((uint8 >> 4) & 1) == 1) ? true : false
        bit5.value = (((uint8 >> 5) & 1) == 1) ? true : false
        bit6.value = (((uint8 >> 6) & 1) == 1) ? true : false
        bit7.value = (((uint8 >> 7) & 1) == 1) ? true : false
    }
    
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
    
    var uint8: UInt8 {
        let bit0: UInt8 = (self.bit0.value ? 1 : 0) << 0
        let bit1: UInt8 = (self.bit1.value ? 1 : 0) << 1
        let bit2: UInt8 = (self.bit2.value ? 1 : 0) << 2
        let bit3: UInt8 = (self.bit3.value ? 1 : 0) << 3
        let bit4: UInt8 = (self.bit4.value ? 1 : 0) << 4
        let bit5: UInt8 = (self.bit5.value ? 1 : 0) << 5
        let bit6: UInt8 = (self.bit6.value ? 1 : 0) << 6
        let bit7: UInt8 = (self.bit7.value ? 1 : 0) << 7
        var result = UInt8(0)
        result |= bit0
        result |= bit1
        result |= bit2
        result |= bit3
        result |= bit4
        result |= bit5
        result |= bit6
        result |= bit7
        return result
    }
    
    var unicodeScalar: UnicodeScalar {
        let value = self.uint8
        return UnicodeScalar(value)
    }
    
    var string: String {
        String(unicodeScalar)
    }
    
    func equals(uint8: UInt8) -> Bool {
        
        
        let value0 = (((uint8 >> 0) & 1) == 1) ? true : false
        let value1 = (((uint8 >> 1) & 1) == 1) ? true : false
        let value2 = (((uint8 >> 2) & 1) == 1) ? true : false
        let value3 = (((uint8 >> 3) & 1) == 1) ? true : false
        let value4 = (((uint8 >> 4) & 1) == 1) ? true : false
        let value5 = (((uint8 >> 5) & 1) == 1) ? true : false
        let value6 = (((uint8 >> 6) & 1) == 1) ? true : false
        let value7 = (((uint8 >> 7) & 1) == 1) ? true : false
        
        if bit0.value != value0 { return false }
        if bit1.value != value1 { return false }
        if bit2.value != value2 { return false }
        if bit3.value != value3 { return false }
        if bit4.value != value4 { return false }
        if bit5.value != value5 { return false }
        if bit6.value != value6 { return false }
        if bit7.value != value7 { return false }

        return true
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
