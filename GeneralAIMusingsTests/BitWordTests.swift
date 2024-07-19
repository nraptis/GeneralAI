//
//  BitWord16Tests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class BitWord16Tests: XCTestCase {
    
    func testWord16_0() {
        let word = Word16(value: 0)
        if word.bits[0] != false { XCTFail("Expected [false] @ 0") }
        if word.bits[1] != false { XCTFail("Expected [false] @ 1") }
        if word.bits[2] != false { XCTFail("Expected [false] @ 2") }
        if word.bits[3] != false { XCTFail("Expected [false] @ 3") }
        if word.bits[04] != false { XCTFail("Expected [false] @ 4") }
        if word.bits[05] != false { XCTFail("Expected [false] @ 5") }
        if word.bits[06] != false { XCTFail("Expected [false] @ 6") }
        if word.bits[07] != false { XCTFail("Expected [false] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_1() {
        let word = Word16(value: 1)
        if word.bits[0] != true { XCTFail("Expected [true] @ 0") }
        if word.bits[1] != false { XCTFail("Expected [false] @ 1") }
        if word.bits[2] != false { XCTFail("Expected [false] @ 2") }
        if word.bits[3] != false { XCTFail("Expected [false] @ 3") }
        if word.bits[04] != false { XCTFail("Expected [false] @ 4") }
        if word.bits[05] != false { XCTFail("Expected [false] @ 5") }
        if word.bits[06] != false { XCTFail("Expected [false] @ 6") }
        if word.bits[07] != false { XCTFail("Expected [false] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_2() {
        let word = Word16(value: 2)
        if word.bits[0] != false { XCTFail("Expected [false] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != false { XCTFail("Expected [false] @ 2") }
        if word.bits[3] != false { XCTFail("Expected [false] @ 3") }
        if word.bits[04] != false { XCTFail("Expected [false] @ 4") }
        if word.bits[05] != false { XCTFail("Expected [false] @ 5") }
        if word.bits[06] != false { XCTFail("Expected [false] @ 6") }
        if word.bits[07] != false { XCTFail("Expected [false] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_3() {
        let word = Word16(value: 3)
        if word.bits[0] != true { XCTFail("Expected [true] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != false { XCTFail("Expected [false] @ 2") }
        if word.bits[3] != false { XCTFail("Expected [false] @ 3") }
        if word.bits[04] != false { XCTFail("Expected [false] @ 4") }
        if word.bits[05] != false { XCTFail("Expected [false] @ 5") }
        if word.bits[06] != false { XCTFail("Expected [false] @ 6") }
        if word.bits[07] != false { XCTFail("Expected [false] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_254() {
        let word = Word16(value: 254)
        if word.bits[0] != false { XCTFail("Expected [false] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != true { XCTFail("Expected [true] @ 2") }
        if word.bits[3] != true { XCTFail("Expected [true] @ 3") }
        if word.bits[04] != true { XCTFail("Expected [true] @ 4") }
        if word.bits[05] != true { XCTFail("Expected [true] @ 5") }
        if word.bits[06] != true { XCTFail("Expected [true] @ 6") }
        if word.bits[07] != true { XCTFail("Expected [true] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_255() {
        let word = Word16(value: 255)
        if word.bits[0] != true { XCTFail("Expected [true] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != true { XCTFail("Expected [true] @ 2") }
        if word.bits[3] != true { XCTFail("Expected [true] @ 3") }
        if word.bits[04] != true { XCTFail("Expected [true] @ 4") }
        if word.bits[05] != true { XCTFail("Expected [true] @ 5") }
        if word.bits[06] != true { XCTFail("Expected [true] @ 6") }
        if word.bits[07] != true { XCTFail("Expected [true] @ 7") }
        if word.bits[08] != false { XCTFail("Expected [false] @ 8") }
        if word.bits[09] != false { XCTFail("Expected [false] @ 9") }
        if word.bits[10] != false { XCTFail("Expected [false] @ 10") }
        if word.bits[11] != false { XCTFail("Expected [false] @ 11") }
        if word.bits[12] != false { XCTFail("Expected [false] @ 12") }
        if word.bits[13] != false { XCTFail("Expected [false] @ 13") }
        if word.bits[14] != false { XCTFail("Expected [false] @ 14") }
        if word.bits[15] != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord16_65534() {
        let word = Word16(value: 65534)
        if word.bits[0] != false { XCTFail("Expected [false] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != true { XCTFail("Expected [true] @ 2") }
        if word.bits[3] != true { XCTFail("Expected [true] @ 3") }
        if word.bits[04] != true { XCTFail("Expected [true] @ 4") }
        if word.bits[05] != true { XCTFail("Expected [true] @ 5") }
        if word.bits[06] != true { XCTFail("Expected [true] @ 6") }
        if word.bits[07] != true { XCTFail("Expected [true] @ 7") }
        if word.bits[08] != true { XCTFail("Expected [true] @ 8") }
        if word.bits[09] != true { XCTFail("Expected [true] @ 9") }
        if word.bits[10] != true { XCTFail("Expected [true] @ 10") }
        if word.bits[11] != true { XCTFail("Expected [true] @ 11") }
        if word.bits[12] != true { XCTFail("Expected [true] @ 12") }
        if word.bits[13] != true { XCTFail("Expected [true] @ 13") }
        if word.bits[14] != true { XCTFail("Expected [true] @ 14") }
        if word.bits[15] != true { XCTFail("Expected [true] @ 15") }
    }
    
    func testWord16_65535() {
        let word = Word16(value: 65535)
        if word.bits[0] != true { XCTFail("Expected [true] @ 0") }
        if word.bits[1] != true { XCTFail("Expected [true] @ 1") }
        if word.bits[2] != true { XCTFail("Expected [true] @ 2") }
        if word.bits[3] != true { XCTFail("Expected [true] @ 3") }
        if word.bits[04] != true { XCTFail("Expected [true] @ 4") }
        if word.bits[05] != true { XCTFail("Expected [true] @ 5") }
        if word.bits[06] != true { XCTFail("Expected [true] @ 6") }
        if word.bits[07] != true { XCTFail("Expected [true] @ 7") }
        if word.bits[08] != true { XCTFail("Expected [true] @ 8") }
        if word.bits[09] != true { XCTFail("Expected [true] @ 9") }
        if word.bits[10] != true { XCTFail("Expected [true] @ 10") }
        if word.bits[11] != true { XCTFail("Expected [true] @ 11") }
        if word.bits[12] != true { XCTFail("Expected [true] @ 12") }
        if word.bits[13] != true { XCTFail("Expected [true] @ 13") }
        if word.bits[14] != true { XCTFail("Expected [true] @ 14") }
        if word.bits[15] != true { XCTFail("Expected [true] @ 15") }
    }
    
    func testEqualsPositiveCaseZero_uint16() {
        let word = Word16(value: 0)
        if word.equals(value: 0) != true { XCTFail("Expected 0.equals(0) == true") }
    }
    
    func testEqualsPositiveCaseOne_uint16() {
        let word = Word16(value: 1)
        if word.equals(value: 1) != true { XCTFail("Expected 1.equals(1) == true") }
    }
    
    func testEqualsPositiveCaseTwo() {
        let word = Word16(value: 2)
        if word.equals(value: 2) != true { XCTFail("Expected 2.equals(2) == true") }
    }
    
    func testEqualsPositiveCaseThree() {
        let word = Word16(value: 3)
        if word.equals(value: 3) != true { XCTFail("Expected 3.equals(3) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFour() {
        let word = Word16(value: 254)
        if word.equals(value: 254) != true { XCTFail("Expected 254.equals(254) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFive() {
        let word = Word16(value: 255)
        if word.equals(value: 255) != true { XCTFail("Expected 255.equals(255) == true") }
    }
    
    func testEqualsCornerCases() {
        for outerIndex in 0...255 {
            let value0 = UInt32(outerIndex)
            let word0 = Word16(value: value0)
            for innerIndex in 0...255 {
                let value1 = UInt32(innerIndex)
                
                if value0 == value1 {
                    if word0.equals(value: value1) != true {
                        XCTFail("Expected \(value0).equals(\(value1)) == true")
                        return
                    }
                } else {
                    if word0.equals(value: value1) != false {
                        XCTFail("Expected \(value0).equals(\(value1)) == false")
                        return
                    }
                }
            }
        }
        
        for outerIndex in 65280...65535 {
            let value0 = UInt32(outerIndex)
            let word0 = Word16(value: value0)
            for innerIndex in 65280...65535 {
                let value1 = UInt32(innerIndex)
                
                if value0 == value1 {
                    if word0.equals(value: value1) != true {
                        XCTFail("Expected \(value0).equals(\(value1)) == true")
                        return
                    }
                } else {
                    if word0.equals(value: value1) != false {
                        XCTFail("Expected \(value0).equals(\(value1)) == false")
                        return
                    }
                }
            }
        }
    }
    
    func testEqualsAllNumbersAndOneLessAndGreater() {
        for index in 1...65534 {
            let value = UInt32(index)
            let word = Word16(value: value)
            
            let checkValue1 = UInt32(index - 1)
            let checkValue2 = UInt32(index)
            let checkValue3 = UInt32(index + 1)
            
            if word.equals(value: checkValue1) != false {
                XCTFail("Expected \(value).equals(\(checkValue1)) == false")
                return
            }
            
            if word.equals(value: checkValue2) != true {
                XCTFail("Expected \(value).equals(\(checkValue1)) == true")
                return
            }
            
            if word.equals(value: checkValue3) != false {
                XCTFail("Expected \(value).equals(\(checkValue3)) == false")
                return
            }
        }
    }
}
