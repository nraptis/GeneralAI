//
//  Word16.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation

struct Word1: Wordable {
    static var numberOfBits = 1
    var bits: [Bool]
    init(value: UInt32) {
        bits = [Bool](repeating: false, count: Self.numberOfBits)
        setValue(value)
    }
}

struct Word4: Wordable {
    static var numberOfBits = 4
    var bits: [Bool]
    init(value: UInt32) {
        bits = [Bool](repeating: false, count: Self.numberOfBits)
        setValue(value)
    }
}

struct Word8: Wordable {
    static var numberOfBits = 8
    var bits: [Bool]
    init(value: UInt32) {
        bits = [Bool](repeating: false, count: Self.numberOfBits)
        setValue(value)
    }
}

struct Word16: Wordable {
    static var numberOfBits = 16
    var bits: [Bool]
    init(value: UInt32) {
        bits = [Bool](repeating: false, count: Self.numberOfBits)
        setValue(value)
    }
}

struct Word32: Wordable {
    static var numberOfBits = 32
    var bits: [Bool]
    init(value: UInt32) {
        bits = [Bool](repeating: false, count: Self.numberOfBits)
        setValue(value)
    }
}
