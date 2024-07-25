//
//  DinkyBoyTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/23/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class DinkyBoyTests: XCTestCase {
    
    func getQueryBus() -> Bus<Word1> {
        let queryBus = Bus<Word1>()
        queryBus.write(Word1(value: 1))
        queryBus.write(Word1(value: 1))
        queryBus.write(Word1(value: 0))
        queryBus.write(Word1(value: 1))
        queryBus.write(Word1(value: 0))
        queryBus.write(Word1(value: 1))
        queryBus.write(Word1(value: 0))
    }
    
    struct TestPieces {
        let brain: Brain<Word1>
        //let inputNeuron: 
    }
    
    func getBrain() -> Brain<Word1> {
        
        let result = Brain<Word1>()
        
        
    }
    
    func testQueryBus() {
        
        
        guard let read1 = queryBus.read() else {
            XCTFail("Expected read1 to not be nil")
            return
        }
        guard read1.getValue() == 1 else {
            XCTFail("Expected read1 to be 1")
            return
        }
        
        let read2 = queryBus.read(2)
        guard read2.count == 2 else {
            XCTFail("Expected read1 to not be nil")
            return
        }
        
        let read2Values = read2.map { $0.getValue() }
        guard read2Values == [UInt32(1), UInt32(0)] else {
            XCTFail("Expected read1 to be [1, 0]")
            return
        }
    }
    
    func testPulse_0() {
        
    }
    
    func testPulse_1() {
        
    }
    
    
}
