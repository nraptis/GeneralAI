//
//  Word.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation

class Word {
    
    var bit_00 = Bit()
    var bit_01 = Bit()
    var bit_02 = Bit()
    var bit_03 = Bit()
    var bit_04 = Bit()
    var bit_05 = Bit()
    var bit_06 = Bit()
    var bit_07 = Bit()
    
    var bit_08 = Bit()
    var bit_09 = Bit()
    var bit_10 = Bit()
    var bit_11 = Bit()
    var bit_12 = Bit()
    var bit_13 = Bit()
    var bit_14 = Bit()
    var bit_15 = Bit()
    
    init() {
        
    }
    
    init(uint16: UInt16) {
        bit_00.value = (((uint16 >>  0) & 1) == 1) ? true : false
        bit_01.value = (((uint16 >>  1) & 1) == 1) ? true : false
        bit_02.value = (((uint16 >>  2) & 1) == 1) ? true : false
        bit_03.value = (((uint16 >>  3) & 1) == 1) ? true : false
        bit_04.value = (((uint16 >>  4) & 1) == 1) ? true : false
        bit_05.value = (((uint16 >>  5) & 1) == 1) ? true : false
        bit_06.value = (((uint16 >>  6) & 1) == 1) ? true : false
        bit_07.value = (((uint16 >>  7) & 1) == 1) ? true : false
        
        bit_08.value = (((uint16 >>  8) & 1) == 1) ? true : false
        bit_09.value = (((uint16 >>  9) & 1) == 1) ? true : false
        bit_10.value = (((uint16 >> 10) & 1) == 1) ? true : false
        bit_11.value = (((uint16 >> 11) & 1) == 1) ? true : false
        bit_12.value = (((uint16 >> 12) & 1) == 1) ? true : false
        bit_13.value = (((uint16 >> 13) & 1) == 1) ? true : false
        bit_14.value = (((uint16 >> 14) & 1) == 1) ? true : false
        bit_15.value = (((uint16 >> 15) & 1) == 1) ? true : false
    }
    
    func getBit(at index: Int) -> Bit {
        if index ==  1 { return bit_01 }
        else if index ==  2 { return bit_02 }
        else if index ==  3 { return bit_03 }
        else if index ==  4 { return bit_04 }
        else if index ==  5 { return bit_05 }
        else if index ==  6 { return bit_06 }
        else if index ==  7 { return bit_07 }
        
        else if index ==  8 { return bit_08 }
        else if index ==  9 { return bit_09 }
        else if index == 10 { return bit_10 }
        else if index == 11 { return bit_11 }
        else if index == 12 { return bit_12 }
        else if index == 13 { return bit_13 }
        else if index == 14 { return bit_14 }
        else if index == 15 { return bit_15 }
        else { return bit_00 }
    }
    
    func clone() -> Word {
        let result = Word()
        result.bit_00 = bit_00.clone()
        result.bit_01 = bit_01.clone()
        result.bit_02 = bit_02.clone()
        result.bit_03 = bit_03.clone()
        result.bit_04 = bit_04.clone()
        result.bit_05 = bit_05.clone()
        result.bit_06 = bit_06.clone()
        result.bit_07 = bit_07.clone()
        result.bit_08 = bit_08.clone()
        result.bit_09 = bit_09.clone()
        result.bit_10 = bit_10.clone()
        result.bit_11 = bit_11.clone()
        result.bit_12 = bit_12.clone()
        result.bit_13 = bit_13.clone()
        result.bit_14 = bit_14.clone()
        result.bit_15 = bit_15.clone()
        return result
    }
    
    var uint16: UInt16 {
        let bit_00: UInt16 = (self.bit_00.value ? 1 : 0) << 0
        let bit_01: UInt16 = (self.bit_01.value ? 1 : 0) << 1
        let bit_02: UInt16 = (self.bit_02.value ? 1 : 0) << 2
        let bit_03: UInt16 = (self.bit_03.value ? 1 : 0) << 3
        let bit_04: UInt16 = (self.bit_04.value ? 1 : 0) << 4
        let bit_05: UInt16 = (self.bit_05.value ? 1 : 0) << 5
        let bit_06: UInt16 = (self.bit_06.value ? 1 : 0) << 6
        let bit_07: UInt16 = (self.bit_07.value ? 1 : 0) << 7
        
        let bit_08: UInt16 = (self.bit_08.value ? 1 : 0) << 8
        let bit_09: UInt16 = (self.bit_09.value ? 1 : 0) << 9
        let bit_10: UInt16 = (self.bit_10.value ? 1 : 0) << 10
        let bit_11: UInt16 = (self.bit_11.value ? 1 : 0) << 11
        let bit_12: UInt16 = (self.bit_12.value ? 1 : 0) << 12
        let bit_13: UInt16 = (self.bit_13.value ? 1 : 0) << 13
        let bit_14: UInt16 = (self.bit_14.value ? 1 : 0) << 14
        let bit_15: UInt16 = (self.bit_15.value ? 1 : 0) << 15
        
        var result = UInt16(0)
        
        result |= bit_00
        result |= bit_01
        result |= bit_02
        result |= bit_03
        result |= bit_04
        result |= bit_05
        result |= bit_06
        result |= bit_07
        
        result |= bit_08
        result |= bit_09
        result |= bit_10
        result |= bit_11
        result |= bit_12
        result |= bit_13
        result |= bit_14
        result |= bit_15
        
        return result
    }
    
    var unicodeScalar: UnicodeScalar? {
        let value = self.uint16
        return UnicodeScalar(value)
    }
    
    var string: String {
        if let unicodeScalar = unicodeScalar {
            return String(unicodeScalar)
        } else {
            return ""
        }
    }
    
    func equals(uint16: UInt16) -> Bool {
        
        let value_00 = (((uint16 >>  0) & 1) == 1) ? true : false
        let value_01 = (((uint16 >>  1) & 1) == 1) ? true : false
        let value_02 = (((uint16 >>  2) & 1) == 1) ? true : false
        let value_03 = (((uint16 >>  3) & 1) == 1) ? true : false
        let value_04 = (((uint16 >>  4) & 1) == 1) ? true : false
        let value_05 = (((uint16 >>  5) & 1) == 1) ? true : false
        let value_06 = (((uint16 >>  6) & 1) == 1) ? true : false
        let value_07 = (((uint16 >>  7) & 1) == 1) ? true : false
        
        let value_08 = (((uint16 >>  8) & 1) == 1) ? true : false
        let value_09 = (((uint16 >>  9) & 1) == 1) ? true : false
        let value_10 = (((uint16 >> 10) & 1) == 1) ? true : false
        let value_11 = (((uint16 >> 11) & 1) == 1) ? true : false
        
        let value_12 = (((uint16 >> 12) & 1) == 1) ? true : false
        let value_13 = (((uint16 >> 13) & 1) == 1) ? true : false
        let value_14 = (((uint16 >> 14) & 1) == 1) ? true : false
        let value_15 = (((uint16 >> 15) & 1) == 1) ? true : false
        
        if bit_00.value != value_00 { return false }
        if bit_01.value != value_01 { return false }
        if bit_02.value != value_02 { return false }
        if bit_03.value != value_03 { return false }
        if bit_04.value != value_04 { return false }
        if bit_05.value != value_05 { return false }
        if bit_06.value != value_06 { return false }
        if bit_07.value != value_07 { return false }
        
        if bit_08.value != value_08 { return false }
        if bit_09.value != value_09 { return false }
        if bit_10.value != value_10 { return false }
        if bit_11.value != value_11 { return false }
        if bit_12.value != value_12 { return false }
        if bit_13.value != value_13 { return false }
        if bit_14.value != value_14 { return false }
        if bit_15.value != value_15 { return false }

        return true
    }
    
}
