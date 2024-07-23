//
//  NeuronQueueTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/23/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class NeuronQueueTests: XCTestCase {
    
    func testNeuronQueueOneWord_Cap0() {
        let queue = NeuronQueue<Word1>(capacity: 0)
        queue.write(Word1(value: 1))
        if queue.read() != nil {
            XCTFail("testNeuronQueueOneWord_Cap0 Should be Empty")
            return
        }
    }
    
    func testNeuronQueueOneWord_Cap1() {
        let queue = NeuronQueue<Word1>(capacity: 1)
        queue.write(Word1(value: 1))
        guard let read = queue.read() else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected Word")
            return
        }
        guard read.getValue() == 1 else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected 1")
            return
        }
    }
    
    func testNeuronQueueSomeReadsAndWrites_A() {
        
        
    }
    
    func testNeuronQueueSomeReadsAndWrites_B() {
        
        
    }
    
    func testNeuronQueueCanRead() {
        
    }
    
    func testNeuronQueue_100000_WriteOnly() {
        
    }
    
    func testNeuronQueue_100000_ReadChunks() {
        
    }
}
