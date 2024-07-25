//
//  Word16able.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation

protocol Wordable {
    static var numberOfBits: Int { get }
    init(value: UInt32)
    var bits: [Bool] { get set }
}

extension Wordable {
    
    var unicodeScalar: UnicodeScalar? {
        let value = getValue()
        return UnicodeScalar(value)
    }
    
    func getBit(at index: Int) -> Bool {
        if index >= 0 && index < Self.numberOfBits {
            return bits[index]
        }
        return false
    }
    
    mutating func setBit(at index: Int, to value: Bool) {
        if index >= 0 && index < Self.numberOfBits {
            bits[index] = value
        }
    }
    
    mutating func setValue(_ value: UInt32) {
        let numberOfBits = Self.numberOfBits
        var loopIndex = 0
        while loopIndex < numberOfBits {
            bits[loopIndex] = (((value >>  loopIndex) & 1) == 1) ? true : false
            loopIndex += 1
        }
    }
    
    func getValue() -> UInt32 {
        var result = UInt32(0)
        let numberOfBits = Self.numberOfBits
        var loopIndex = 0
        while loopIndex < numberOfBits {
            if bits[loopIndex] {
                result |= (1 << loopIndex)
            }
            loopIndex += 1
        }
        return result
    }
    
    func getUnicodeScalar() -> UnicodeScalar? {
        let value = getValue()
        if let unicodeScalar = UnicodeScalar(value) {
            return unicodeScalar
        } else {
            return nil
        }
    }
    
    func getString() -> String? {
        let value = getValue()
        if let unicodeScalar = UnicodeScalar(value) {
            return String(unicodeScalar)
        } else {
            return nil
        }
    }
    
    func equals(value: UInt32) -> Bool {
        return getValue() == value
    }
    
    /*
    func clone() -> Self {
        var result = Self(value: 0)
        let numberOfBits = Self.numberOfBits
        var loopIndex = 0
        while loopIndex < numberOfBits {
            result.bits[loopIndex] = bits[loopIndex]
            loopIndex += 1
        }
        return result
    }
    */
}

extension Wordable {
 
    func invert() -> Self {
        var result = Self(value: 0)
        var loopIndex = 0
        while loopIndex < Self.numberOfBits {
            result.bits[loopIndex] = !bits[loopIndex]
            loopIndex += 1
        }
        return result
    }
    
    func and(_ word: Self) -> Self {
        var result = Self(value: 0)
        var loopIndex = 0
        while loopIndex < Self.numberOfBits {
            result.bits[loopIndex] = (bits[loopIndex] && word.bits[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
    func or(_ word: Self) -> Self {
        var result = Self(value: 0)
        var loopIndex = 0
        while loopIndex < Self.numberOfBits {
            result.bits[loopIndex] = (bits[loopIndex] || word.bits[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
    func xor(_ word: Self) -> Self {
        var result = Self(value: 0)
        var loopIndex = 0
        while loopIndex < Self.numberOfBits {
            result.bits[loopIndex] = (bits[loopIndex] != word.bits[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
    func equals(_ word: Self) -> Self {
        var result = Self(value: 0)
        var loopIndex = 0
        while loopIndex < Self.numberOfBits {
            result.bits[loopIndex] = (bits[loopIndex] == word.bits[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
}
