//
//  BitWordTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class BitWordTests: XCTestCase {
    
    func testWord_0() {
        let word = Word(uint16: UInt16(0))
        if word.bit_00.value != false { XCTFail("Expected [false] @ 0") }
        if word.bit_01.value != false { XCTFail("Expected [false] @ 1") }
        if word.bit_02.value != false { XCTFail("Expected [false] @ 2") }
        if word.bit_03.value != false { XCTFail("Expected [false] @ 3") }
        if word.bit_04.value != false { XCTFail("Expected [false] @ 4") }
        if word.bit_05.value != false { XCTFail("Expected [false] @ 5") }
        if word.bit_06.value != false { XCTFail("Expected [false] @ 6") }
        if word.bit_07.value != false { XCTFail("Expected [false] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_1() {
        let word = Word(uint16: UInt16(1))
        if word.bit_00.value != true { XCTFail("Expected [true] @ 0") }
        if word.bit_01.value != false { XCTFail("Expected [false] @ 1") }
        if word.bit_02.value != false { XCTFail("Expected [false] @ 2") }
        if word.bit_03.value != false { XCTFail("Expected [false] @ 3") }
        if word.bit_04.value != false { XCTFail("Expected [false] @ 4") }
        if word.bit_05.value != false { XCTFail("Expected [false] @ 5") }
        if word.bit_06.value != false { XCTFail("Expected [false] @ 6") }
        if word.bit_07.value != false { XCTFail("Expected [false] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_2() {
        let word = Word(uint16: UInt16(2))
        if word.bit_00.value != false { XCTFail("Expected [false] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != false { XCTFail("Expected [false] @ 2") }
        if word.bit_03.value != false { XCTFail("Expected [false] @ 3") }
        if word.bit_04.value != false { XCTFail("Expected [false] @ 4") }
        if word.bit_05.value != false { XCTFail("Expected [false] @ 5") }
        if word.bit_06.value != false { XCTFail("Expected [false] @ 6") }
        if word.bit_07.value != false { XCTFail("Expected [false] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_3() {
        let word = Word(uint16: UInt16(3))
        if word.bit_00.value != true { XCTFail("Expected [true] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != false { XCTFail("Expected [false] @ 2") }
        if word.bit_03.value != false { XCTFail("Expected [false] @ 3") }
        if word.bit_04.value != false { XCTFail("Expected [false] @ 4") }
        if word.bit_05.value != false { XCTFail("Expected [false] @ 5") }
        if word.bit_06.value != false { XCTFail("Expected [false] @ 6") }
        if word.bit_07.value != false { XCTFail("Expected [false] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_254() {
        let word = Word(uint16: UInt16(254))
        if word.bit_00.value != false { XCTFail("Expected [false] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != true { XCTFail("Expected [true] @ 2") }
        if word.bit_03.value != true { XCTFail("Expected [true] @ 3") }
        if word.bit_04.value != true { XCTFail("Expected [true] @ 4") }
        if word.bit_05.value != true { XCTFail("Expected [true] @ 5") }
        if word.bit_06.value != true { XCTFail("Expected [true] @ 6") }
        if word.bit_07.value != true { XCTFail("Expected [true] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_255() {
        let word = Word(uint16: UInt16(255))
        if word.bit_00.value != true { XCTFail("Expected [true] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != true { XCTFail("Expected [true] @ 2") }
        if word.bit_03.value != true { XCTFail("Expected [true] @ 3") }
        if word.bit_04.value != true { XCTFail("Expected [true] @ 4") }
        if word.bit_05.value != true { XCTFail("Expected [true] @ 5") }
        if word.bit_06.value != true { XCTFail("Expected [true] @ 6") }
        if word.bit_07.value != true { XCTFail("Expected [true] @ 7") }
        
        if word.bit_08.value != false { XCTFail("Expected [false] @ 8") }
        if word.bit_09.value != false { XCTFail("Expected [false] @ 9") }
        if word.bit_10.value != false { XCTFail("Expected [false] @ 10") }
        if word.bit_11.value != false { XCTFail("Expected [false] @ 11") }
        if word.bit_12.value != false { XCTFail("Expected [false] @ 12") }
        if word.bit_13.value != false { XCTFail("Expected [false] @ 13") }
        if word.bit_14.value != false { XCTFail("Expected [false] @ 14") }
        if word.bit_15.value != false { XCTFail("Expected [false] @ 15") }
    }
    
    func testWord_65534() {
        let word = Word(uint16: UInt16(65534))
        if word.bit_00.value != false { XCTFail("Expected [false] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != true { XCTFail("Expected [true] @ 2") }
        if word.bit_03.value != true { XCTFail("Expected [true] @ 3") }
        if word.bit_04.value != true { XCTFail("Expected [true] @ 4") }
        if word.bit_05.value != true { XCTFail("Expected [true] @ 5") }
        if word.bit_06.value != true { XCTFail("Expected [true] @ 6") }
        if word.bit_07.value != true { XCTFail("Expected [true] @ 7") }
        
        if word.bit_08.value != true { XCTFail("Expected [true] @ 8") }
        if word.bit_09.value != true { XCTFail("Expected [true] @ 9") }
        if word.bit_10.value != true { XCTFail("Expected [true] @ 10") }
        if word.bit_11.value != true { XCTFail("Expected [true] @ 11") }
        if word.bit_12.value != true { XCTFail("Expected [true] @ 12") }
        if word.bit_13.value != true { XCTFail("Expected [true] @ 13") }
        if word.bit_14.value != true { XCTFail("Expected [true] @ 14") }
        if word.bit_15.value != true { XCTFail("Expected [true] @ 15") }
    }
    
    func testWord_65535() {
        let word = Word(uint16: UInt16(65535))
        if word.bit_00.value != true { XCTFail("Expected [true] @ 0") }
        if word.bit_01.value != true { XCTFail("Expected [true] @ 1") }
        if word.bit_02.value != true { XCTFail("Expected [true] @ 2") }
        if word.bit_03.value != true { XCTFail("Expected [true] @ 3") }
        if word.bit_04.value != true { XCTFail("Expected [true] @ 4") }
        if word.bit_05.value != true { XCTFail("Expected [true] @ 5") }
        if word.bit_06.value != true { XCTFail("Expected [true] @ 6") }
        if word.bit_07.value != true { XCTFail("Expected [true] @ 7") }
        
        if word.bit_08.value != true { XCTFail("Expected [true] @ 8") }
        if word.bit_09.value != true { XCTFail("Expected [true] @ 9") }
        if word.bit_10.value != true { XCTFail("Expected [true] @ 10") }
        if word.bit_11.value != true { XCTFail("Expected [true] @ 11") }
        if word.bit_12.value != true { XCTFail("Expected [true] @ 12") }
        if word.bit_13.value != true { XCTFail("Expected [true] @ 13") }
        if word.bit_14.value != true { XCTFail("Expected [true] @ 14") }
        if word.bit_15.value != true { XCTFail("Expected [true] @ 15") }
    }
    
    func testEqualsPositiveCaseZero_uint16() {
        let word = Word(uint16: UInt16(0))
        if word.equals(uint16: 0) != true { XCTFail("Expected 0.equals(0) == true") }
    }
    
    func testEqualsPositiveCaseOne_uint16() {
        let word = Word(uint16: UInt16(1))
        if word.equals(uint16: 1) != true { XCTFail("Expected 1.equals(1) == true") }
    }
    
    func testEqualsPositiveCaseTwo() {
        let word = Word(uint16: UInt16(2))
        if word.equals(uint16: 2) != true { XCTFail("Expected 2.equals(2) == true") }
    }
    
    func testEqualsPositiveCaseThree() {
        let word = Word(uint16: UInt16(3))
        if word.equals(uint16: 3) != true { XCTFail("Expected 3.equals(3) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFour() {
        let word = Word(uint16: UInt16(254))
        if word.equals(uint16: 254) != true { XCTFail("Expected 254.equals(254) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFive() {
        let word = Word(uint16: UInt16(255))
        if word.equals(uint16: 255) != true { XCTFail("Expected 255.equals(255) == true") }
    }
    
    func testEqualsCornerCases() {
        for outerIndex in 0...255 {
            let value0 = UInt16(outerIndex)
            let word0 = Word(uint16: value0)
            for innerIndex in 0...255 {
                let value1 = UInt16(innerIndex)
                
                if value0 == value1 {
                    if word0.equals(uint16: value1) != true {
                        XCTFail("Expected \(value0).equals(\(value1)) == true")
                        return
                    }
                } else {
                    if word0.equals(uint16: value1) != false {
                        XCTFail("Expected \(value0).equals(\(value1)) == false")
                        return
                    }
                }
            }
        }
        
        for outerIndex in 65280...65535 {
            let value0 = UInt16(outerIndex)
            let word0 = Word(uint16: value0)
            for innerIndex in 65280...65535 {
                let value1 = UInt16(innerIndex)
                
                if value0 == value1 {
                    if word0.equals(uint16: value1) != true {
                        XCTFail("Expected \(value0).equals(\(value1)) == true")
                        return
                    }
                } else {
                    if word0.equals(uint16: value1) != false {
                        XCTFail("Expected \(value0).equals(\(value1)) == false")
                        return
                    }
                }
            }
        }
    }
    
    func testEqualsAllNumbersAndOneLessAndGreater() {
        for index in 1...65534 {
            let value = UInt16(index)
            let word = Word(uint16: value)
            
            let checkValue1 = UInt16(index - 1)
            let checkValue2 = UInt16(index)
            let checkValue3 = UInt16(index + 1)
            
            if word.equals(uint16: checkValue1) != false {
                XCTFail("Expected \(value).equals(\(checkValue1)) == false")
                return
            }
            
            if word.equals(uint16: checkValue2) != true {
                XCTFail("Expected \(value).equals(\(checkValue1)) == true")
                return
            }
            
            if word.equals(uint16: checkValue3) != false {
                XCTFail("Expected \(value).equals(\(checkValue3)) == false")
                return
            }
        }
    }
    
    func testClones() {
        
        for index in 0...65535 {
            let value = UInt16(index)
            let word = Word(uint16: value)
            let clone = word.clone()
            let converted = clone.uint16
            if word.equals(uint16: converted) != true {
                XCTFail("Expected \(value).equals(\(converted)) == true")
                return
            }
            
            
        }
        
    }
    
}
