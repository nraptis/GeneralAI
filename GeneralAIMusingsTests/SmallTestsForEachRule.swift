//
//  SmallTestsForEachRule.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/16/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class SmallTestsForEachRule: XCTestCase {
    
    func testOne() {
        let rule = Rule<Word1>.one
        let result = rule.process(words: [])
        if result.count != 1 {
            XCTFail("testOne, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testOne, expected value = 1")
            return
        }
    }
    
    func testZero() {
        let rule = Rule<Word1>.zero
        let result = rule.process(words: [])
        if result.count != 1 {
            XCTFail("testZero, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testZero, expected value = 0")
            return
        }
    }
    
    func testRemove() {
        let word = Word1(value: 1)
        let rule = Rule<Word1>.remove
        let result = rule.process(words: [word])
        if result.count != 0 {
            XCTFail("testRemove, expected count = 0")
            return
        }
    }
    
    func testCopy_A() {
        let word = Word1(value: 1)
        let rule = Rule<Word1>.copy
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testCopy_A, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testCopy_A, expected value = 1")
            return
        }
    }
    
    func testCopy_B() {
        let word = Word8(value: 254)
        let rule = Rule<Word8>.copy
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testCopy_B, expected count = 1")
            return
        }
        if result[0].getValue() != 254 {
            XCTFail("testCopy_B, expected value = 254")
            return
        }
    }
    
    func testCopy_C() {
        let word = Word32(value: 0)
        let rule = Rule<Word32>.copy
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testCopy_C, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testCopy_C, expected value = 0")
            return
        }
    }
    
    func testDupe_A() {
        let word = Word1(value: 1)
        let rule = Rule<Word1>.dupe
        let result = rule.process(words: [word])
        if result.count != 2 {
            XCTFail("testDupe_A, expected count = 2")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testDupe_A, expected value = 1")
            return
        }
        if result[1].getValue() != 1 {
            XCTFail("testDupe_A, expected value = 1")
            return
        }
    }
    
    func testDupe_B() {
        let word = Word1(value: 0)
        let rule = Rule<Word1>.dupe
        let result = rule.process(words: [word])
        if result.count != 2 {
            XCTFail("testDupe_A, expected count = 2")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testDupe_A, expected value = 0")
            return
        }
        if result[1].getValue() != 0 {
            XCTFail("testDupe_A, expected value = 0")
            return
        }
    }
    
    func testDupe_C() {
        let word = Word16(value: 57)
        let rule = Rule<Word16>.dupe
        let result = rule.process(words: [word])
        if result.count != 2 {
            XCTFail("testDupe_A, expected count = 2")
            return
        }
        if result[0].getValue() != 57 {
            XCTFail("testDupe_A, expected value = 57")
            return
        }
        if result[1].getValue() != 57 {
            XCTFail("testDupe_A, expected value = 57")
            return
        }
    }
    
    func testDupe_D() {
        let word = Word16(value: 0)
        let rule = Rule<Word16>.dupe
        let result = rule.process(words: [word])
        if result.count != 2 {
            XCTFail("testDupe_A, expected count = 2")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testDupe_A, expected value = 0")
            return
        }
        if result[1].getValue() != 0 {
            XCTFail("testDupe_A, expected value = 0")
            return
        }
    }
    
    func testInvert_A() {
        let word = Word1(value: 1)
        let rule = Rule<Word1>.invert
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testInvert_A, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testInvert_A, expected value = 0")
            return
        }
    }
    
    func testInvert_B() {
        let word = Word1(value: 0)
        let rule = Rule<Word1>.invert
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testInvert_A, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testInvert_A, expected value = 1")
            return
        }
    }
    
    func testInvert_C() {
        let word = Word32(value: 0xFF00FF00)
        let rule = Rule<Word32>.invert
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testInvert_A, expected count = 1")
            return
        }
        if result[0].getValue() != 0x00FF00FF {
            XCTFail("testInvert_A, expected value = 0x00FF00FF")
            return
        }
    }
    
    func testInvert_D() {
        let word = Word32(value: 0x00FF00FF)
        let rule = Rule<Word32>.invert
        let result = rule.process(words: [word])
        if result.count != 1 {
            XCTFail("testInvert_A, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF00FF00 {
            XCTFail("testInvert_A, expected value = 0xFF00FF00")
            return
        }
    }
    
    func testXOR_A() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_A, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testXOR_A, expected value = 0")
            return
        }
    }
    
    func testXOR_B() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_B, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testXOR_B, expected value = 1")
            return
        }
    }
    
    func testXOR_C() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_C, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testXOR_C, expected value = 1")
            return
        }
    }
    
    func testXOR_D() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_D, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testXOR_D, expected value = 0")
            return
        }
    }
    
    func testXOR_E() {
        let word1 = Word32(value: 0xFF0000)
        let word2 = Word32(value: 0x0000FF)
        
        let rule = Rule<Word32>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_E, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF00FF {
            XCTFail("testXOR_E, expected value = 0xFF00FF. got \(result[0].getValue())")
            return
        }
    }
    
    func testXOR_F() {
        let word1 = Word32(value: 0xFF000F)
        let word2 = Word32(value: 0x0F00F0)
        
        let rule = Rule<Word32>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_F, expected count = 1")
            return
        }
        if result[0].getValue() != 0xF000FF {
            XCTFail("testXOR_F, expected value = 0xF000FF. got \(result[0].getValue())")
            return
        }
    }
    
    func testXOR_G() {
        let word1 = Word32(value: 0xF0F0F0)
        let word2 = Word32(value: 0x00F00F)
        
        let rule = Rule<Word32>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_G, expected count = 1")
            return
        }
        if result[0].getValue() != 0xF000FF {
            XCTFail("testXOR_G, expected value = 0xF000FF. got \(result[0].getValue())")
            return
        }
    }
    
    func testXOR_H() {
        let word1 = Word32(value: 0x0FF0F0)
        let word2 = Word32(value: 0xF0F0FF)
        
        let rule = Rule<Word32>.xor
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testXOR_H, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF000F {
            XCTFail("testXOR_H, expected value = 0xFF000F. got \(result[0].getValue())")
            return
        }
    }
    
    func testEqual_A() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_A, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testEqual_A, expected value = 1")
            return
        }
    }
    
    func testEqual_B() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_B, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testEqual_B, expected value = 0")
            return
        }
    }
    
    func testEqual_C() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_C, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testEqual_C, expected value = 0")
            return
        }
    }
    
    func testEqual_D() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_D, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testEqual_D, expected value = 1")
            return
        }
    }
    
    func testEqual_E() {
        let word1 = Word32(value: 0xFF0000)
        let word2 = Word32(value: 0x0000FF)
        
        let rule = Rule<Word32>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_E, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF00FF00 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testEqual_E, expected value = 0xFF0FFF00. got 0x\(hex)")
            return
        }
    }
    
    func testEqual_F() {
        let word1 = Word32(value: 0xFF000F)
        let word2 = Word32(value: 0x0F00F0)
        
        let rule = Rule<Word32>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_F, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF0FFF00 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testEqual_F, expected value = 0xFF0FFF00. got 0x\(hex)")
            return
        }
    }
    
    func testEqual_G() {
        let word1 = Word32(value: 0xF0F0F0)
        let word2 = Word32(value: 0x00F00F)
        
        let rule = Rule<Word32>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_G, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF0FFF00 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testEqual_G, expected value = 0xFF0FFF00. got 0x\(hex)")
            return
        }
    }
    
    func testEqual_H() {
        let word1 = Word32(value: 0x0FF0F0)
        let word2 = Word32(value: 0xF0F0FF)
        
        let rule = Rule<Word32>.equal
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testEqual_H, expected count = 1")
            return
        }
        if result[0].getValue() != 0xFF00FFF0 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testEqual_H, expected value = 0xFF0FFF00. got 0x\(hex)")
            return
        }
    }
    
    func testAnd_A() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_A, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testAnd_A, expected value = 1")
            return
        }
    }
    
    func testAnd_B() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_B, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testAnd_B, expected value = 0")
            return
        }
    }
    
    func testAnd_C() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_C, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testAnd_C, expected value = 0")
            return
        }
    }
    
    func testAnd_D() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_D, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testAnd_D, expected value = 0")
            return
        }
    }
    
    func testAnd_E() {
        let word1 = Word32(value: 0xFF0000)
        let word2 = Word32(value: 0x0000FF)
        
        let rule = Rule<Word32>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_E, expected count = 1")
            return
        }
        if result[0].getValue() != 0x00000000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testAnd_E, expected value = 0x00000000. got 0x\(hex)")
            return
        }
    }
    
    func testAnd_F() {
        let word1 = Word32(value: 0xFF000F)
        let word2 = Word32(value: 0x0F00F0)
        
        let rule = Rule<Word32>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_F, expected count = 1")
            return
        }
        if result[0].getValue() != 0x000F0000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testAnd_F, expected value = 0xF0000. got 0x\(hex)")
            return
        }
    }
    
    func testAnd_G() {
        let word1 = Word32(value: 0xF0F0F0)
        let word2 = Word32(value: 0x00F00F)
        
        let rule = Rule<Word32>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_G, expected count = 1")
            return
        }
        if result[0].getValue() != 0x000F000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testAnd_G, expected value = 0x000F000. got 0x\(hex)")
            return
        }
    }
    
    func testAnd_H() {
        let word1 = Word32(value: 0x0FF0F0)
        let word2 = Word32(value: 0xF0F0FF)
        
        let rule = Rule<Word32>.and
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testAnd_H, expected count = 1")
            return
        }
        if result[0].getValue() != 0x0000F0F0 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testAnd_H, expected value = 0x0000F0F0. got 0x\(hex)")
            return
        }
    }
    
    
    func testOr_A() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_A, expected count = 1")
            return
        }
        if result[0].getValue() != 1 {
            XCTFail("testOr_A, expected value = 1")
            return
        }
    }
    
    func testOr_B() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 1)
        
        let rule = Rule<Word1>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_B, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testOr_B, expected value = 0")
            return
        }
    }
    
    func testOr_C() {
        let word1 = Word1(value: 1)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_C, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testOr_C, expected value = 0")
            return
        }
    }
    
    func testOr_D() {
        let word1 = Word1(value: 0)
        let word2 = Word1(value: 0)
        
        let rule = Rule<Word1>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_D, expected count = 1")
            return
        }
        if result[0].getValue() != 0 {
            XCTFail("testOr_D, expected value = 0")
            return
        }
    }
    
    func testOr_E() {
        let word1 = Word32(value: 0xFF0000)
        let word2 = Word32(value: 0x0000FF)
        
        let rule = Rule<Word32>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_E, expected count = 1")
            return
        }
        if result[0].getValue() != 0x00000000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testOr_E, expected value = 0x00000000. got 0x\(hex)")
            return
        }
    }
    
    func testOr_F() {
        let word1 = Word32(value: 0xFF000F)
        let word2 = Word32(value: 0x0F00F0)
        
        let rule = Rule<Word32>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_F, expected count = 1")
            return
        }
        if result[0].getValue() != 0x000F0000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testOr_F, expected value = 0x000F0000. got 0x\(hex)")
            return
        }
    }
    
    func testOr_G() {
        let word1 = Word32(value: 0xF0F0F0)
        let word2 = Word32(value: 0x00F00F)
        
        let rule = Rule<Word32>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_G, expected count = 1")
            return
        }
        if result[0].getValue() != 0x0000F000 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testOr_G, expected value = 0x0000F000. got 0x\(hex)")
            return
        }
    }
    
    func testOr_H() {
        let word1 = Word32(value: 0x0FF0F0)
        let word2 = Word32(value: 0xF0F0FF)
        
        let rule = Rule<Word32>.or
        let result = rule.process(words: [word1, word2])
        if result.count != 1 {
            XCTFail("testOr_H, expected count = 1")
            return
        }
        if result[0].getValue() != 0x0000F0F0 {
            let hex = String(result[0].getValue(), radix: 16, uppercase: true)
            XCTFail("testOr_H, expected value = 0x0000F0F0. got 0x\(hex)")
            return
        }
    }
    
}
