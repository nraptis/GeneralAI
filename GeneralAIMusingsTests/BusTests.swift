//
//  BusTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/22/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class BusTests: XCTestCase {
    
    func testBusOneWord() {
        let bus = Bus<Word1>()
        bus.write(Word1(value: 1))
        guard let read = bus.read() else {
            XCTFail("testBusOneWord Empty Bus")
            return
        }
        guard read.bits[0] == true else {
            XCTFail("testBusOneWord Empty Bus")
            return
        }
        let contents = bus.contents
        guard contents.count == 1 else {
            XCTFail("testBusOneWord Empty Contents")
            return
        }
        guard contents[0].bits[0] == true else {
            XCTFail("testBusOneWord Wrong Contents")
            return
        }
    }
    
    func testBusSomeReadsAndWrites_A() {
        let bus = Bus<Word16>()
        bus.write(Word16(value: 127))
        guard let read = bus.read() else {
            XCTFail("testBusSomeReadsAndWrites_A Empty Bus")
            return
        }
        guard read.getValue() == 127 else {
            XCTFail("testBusSomeReadsAndWrites_A Expected 127")
            return
        }
        
        bus.write(Word16(value: 1280))
        guard let read = bus.read() else {
            XCTFail("testBusSomeReadsAndWrites_A Empty Bus")
            return
        }
        guard read.getValue() == 1280 else {
            XCTFail("testBusSomeReadsAndWrites_A Expected 1280")
            return
        }
        
        bus.write(Word16(value: 2048))
        bus.write(Word16(value: 1024))
        guard let read = bus.read() else {
            XCTFail("testBusSomeReadsAndWrites_A Empty Bus")
            return
        }
        guard read.getValue() == 2048 else {
            XCTFail("testBusSomeReadsAndWrites_A Expected 2048")
            return
        }
        guard let read = bus.read() else {
            XCTFail("testBusSomeReadsAndWrites_A Empty Bus")
            return
        }
        guard read.getValue() == 1024 else {
            XCTFail("testBusSomeReadsAndWrites_A Expected 1024")
            return
        }
    }
    
    func testBusSomeReadsAndWrites_B() {
        let bus = Bus<Word8>()
        
        let chunk1: [UInt32] = [10, 11, 12, 13, 14, 15]
        let words1 = chunk1.map { Word8(value: $0) }
        
        bus.write(words1)
        
        let read3A = bus.read(3)
        guard read3A.count == 3 else {
            XCTFail("testBusSomeReadsAndWrites_B Expected to read 3...")
            return
        }
        guard read3A[0].getValue() == 10, read3A[1].getValue() == 11, read3A[2].getValue() == 12 else {
            XCTFail("testBusSomeReadsAndWrites_B Expected to read 10, 11, 12...")
            return
        }
        
        let readOverflow = bus.read(4)
        guard readOverflow.count == 0 else {
            XCTFail("testBusSomeReadsAndWrites_B Expected 0 from overflow...")
            return
        }
        
        let read3B = bus.read(3)
        guard read3B.count == 3 else {
            XCTFail("testBusSomeReadsAndWrites_B Expected to read 3...")
            return
        }
        guard read3B[0].getValue() == 13, read3B[1].getValue() == 14, read3B[2].getValue() == 15 else {
            XCTFail("testBusSomeReadsAndWrites_B Expected to read 13, 14, 15...")
            return
        }
    }
}
