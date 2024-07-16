//
//  BitByteTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/16/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class BitByteTests: XCTestCase {
    
    func testByteZero_uint8() {
        let byte = Byte(uint8: UInt8(0))
        if byte.bit0.value != false { XCTFail("Expected [false] @ 0") }
        if byte.bit1.value != false { XCTFail("Expected [false] @ 1") }
        if byte.bit2.value != false { XCTFail("Expected [false] @ 2") }
        if byte.bit3.value != false { XCTFail("Expected [false] @ 3") }
        if byte.bit4.value != false { XCTFail("Expected [false] @ 4") }
        if byte.bit5.value != false { XCTFail("Expected [false] @ 5") }
        if byte.bit6.value != false { XCTFail("Expected [false] @ 6") }
        if byte.bit7.value != false { XCTFail("Expected [false] @ 7") }
    }
    
    func testByteOne_uint8() {
        let byte = Byte(uint8: UInt8(1))
        if byte.bit0.value != true { XCTFail("Expected [true] @ 0") }
        if byte.bit1.value != false { XCTFail("Expected [false] @ 1") }
        if byte.bit2.value != false { XCTFail("Expected [false] @ 2") }
        if byte.bit3.value != false { XCTFail("Expected [false] @ 3") }
        if byte.bit4.value != false { XCTFail("Expected [false] @ 4") }
        if byte.bit5.value != false { XCTFail("Expected [false] @ 5") }
        if byte.bit6.value != false { XCTFail("Expected [false] @ 6") }
        if byte.bit7.value != false { XCTFail("Expected [false] @ 7") }
    }
    
    func testByteTwo() {
        let byte = Byte(uint8: UInt8(2))
        if byte.bit0.value != false { XCTFail("Expected [false] @ 0") }
        if byte.bit1.value != true { XCTFail("Expected [true] @ 1") }
        if byte.bit2.value != false { XCTFail("Expected [false] @ 2") }
        if byte.bit3.value != false { XCTFail("Expected [false] @ 3") }
        if byte.bit4.value != false { XCTFail("Expected [false] @ 4") }
        if byte.bit5.value != false { XCTFail("Expected [false] @ 5") }
        if byte.bit6.value != false { XCTFail("Expected [false] @ 6") }
        if byte.bit7.value != false { XCTFail("Expected [false] @ 7") }
    }
    
    func testByteThree() {
        let byte = Byte(uint8: UInt8(3))
        if byte.bit0.value != true { XCTFail("Expected [true] @ 0") }
        if byte.bit1.value != true { XCTFail("Expected [true] @ 1") }
        if byte.bit2.value != false { XCTFail("Expected [false] @ 2") }
        if byte.bit3.value != false { XCTFail("Expected [false] @ 3") }
        if byte.bit4.value != false { XCTFail("Expected [false] @ 4") }
        if byte.bit5.value != false { XCTFail("Expected [false] @ 5") }
        if byte.bit6.value != false { XCTFail("Expected [false] @ 6") }
        if byte.bit7.value != false { XCTFail("Expected [false] @ 7") }
    }
    
    func testByteTwoHundredFiftyFour() {
        let byte = Byte(uint8: UInt8(254))
        if byte.bit0.value != false { XCTFail("Expected [false] @ 0") }
        if byte.bit1.value != true { XCTFail("Expected [true] @ 1") }
        if byte.bit2.value != true { XCTFail("Expected [true] @ 2") }
        if byte.bit3.value != true { XCTFail("Expected [true] @ 3") }
        if byte.bit4.value != true { XCTFail("Expected [true] @ 4") }
        if byte.bit5.value != true { XCTFail("Expected [true] @ 5") }
        if byte.bit6.value != true { XCTFail("Expected [true] @ 6") }
        if byte.bit7.value != true { XCTFail("Expected [true] @ 7") }
    }
    
    func testByteTwoHundredFiftyFive() {
        let byte = Byte(uint8: UInt8(255))
        if byte.bit0.value != true { XCTFail("Expected [true] @ 0") }
        if byte.bit1.value != true { XCTFail("Expected [true] @ 1") }
        if byte.bit2.value != true { XCTFail("Expected [true] @ 2") }
        if byte.bit3.value != true { XCTFail("Expected [true] @ 3") }
        if byte.bit4.value != true { XCTFail("Expected [true] @ 4") }
        if byte.bit5.value != true { XCTFail("Expected [true] @ 5") }
        if byte.bit6.value != true { XCTFail("Expected [true] @ 6") }
        if byte.bit7.value != true { XCTFail("Expected [true] @ 7") }
    }
    
    
    func testEqualsPositiveCaseZero_uint8() {
        let byte = Byte(uint8: UInt8(0))
        if byte.equals(uint8: 0) != true { XCTFail("Expected 0.equals(0) == true") }
    }
    
    func testEqualsPositiveCaseOne_uint8() {
        let byte = Byte(uint8: UInt8(1))
        if byte.equals(uint8: 1) != true { XCTFail("Expected 1.equals(1) == true") }
    }
    
    func testEqualsPositiveCaseTwo() {
        let byte = Byte(uint8: UInt8(2))
        if byte.equals(uint8: 2) != true { XCTFail("Expected 2.equals(2) == true") }
    }
    
    func testEqualsPositiveCaseThree() {
        let byte = Byte(uint8: UInt8(3))
        if byte.equals(uint8: 3) != true { XCTFail("Expected 3.equals(3) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFour() {
        let byte = Byte(uint8: UInt8(254))
        if byte.equals(uint8: 254) != true { XCTFail("Expected 254.equals(254) == true") }
    }
    
    func testEqualsPositiveCaseTwoHundredFiftyFive() {
        let byte = Byte(uint8: UInt8(255))
        if byte.equals(uint8: 255) != true { XCTFail("Expected 255.equals(255) == true") }
    }
    
    func testEqualsAllCases() {
        for outerIndex in 0...255 {
            let value0 = UInt8(outerIndex)
            let byte0 = Byte(uint8: value0)
            for innerIndex in 0...255 {
                let value1 = UInt8(innerIndex)
                
                if value0 == value1 {
                    if byte0.equals(uint8: value1) != true {
                        XCTFail("Expected \(value0).equals(\(value1)) == true")
                    }
                } else {
                    if byte0.equals(uint8: value1) != false {
                        XCTFail("Expected \(value0).equals(\(value1)) == false")
                    }
                }
            }
        }
    }
    
}
