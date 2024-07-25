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
        return queryBus
    }
    
    struct TestPieces {
        let brain: Brain<Word1>
        let inputNeuron: Neuron<Word1>
        let outputNeuron: Neuron<Word1>
        let topNeuron: Neuron<Word1>
        let bottomNeuron: Neuron<Word1>
    }
    
    func getTestPieces() -> TestPieces {
        
        let brain = Brain<Word1>(queueSize: 4)
        
        let queryBus = getQueryBus()
        brain.writeQuery(queryBus: queryBus)
        
        let topNeuron = Neuron<Word1>(queueSize: 4)
        let bottomNeuron = Neuron<Word1>(queueSize: 4)
        
        brain.neurons.append(topNeuron)
        brain.neurons.append(bottomNeuron)
        
        brain.axons.append(.init(neuronIndexA: .input,
                                 neuronIndexB: .body(1),
                                 direction: .a_to_b))
        brain.axons.append(.init(neuronIndexA: .input,
                                 neuronIndexB: .body(2),
                                 direction: .a_to_b))
        brain.axons.append(.init(neuronIndexA: .body(1),
                                 neuronIndexB: .output,
                                 direction: .a_to_b))
        brain.axons.append(.init(neuronIndexA: .body(2),
                                 neuronIndexB: .body(1),
                                 direction: .a_to_b))
        
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.rules.append(.xor)
        
        topNeuron.rules.append(.equal)
        topNeuron.rules.append(.dupe)
        topNeuron.rules.append(.copy)
        
        bottomNeuron.rules.append(.copy)
        bottomNeuron.rules.append(.dupe)
        
        return TestPieces(brain: brain,
                          inputNeuron: brain.inputNeuron,
                          outputNeuron: brain.outputNeuron,
                          topNeuron: topNeuron,
                          bottomNeuron: bottomNeuron)
        
    }
    
    func testQueryBus() {
        
        let queryBus = getQueryBus()
        
        // Pulse 1
        guard let read1 = queryBus.read() else {
            XCTFail("Expected read1 to not be nil")
            return
        }
        guard read1.getValue() == 1 else {
            XCTFail("Expected read1 to be 1")
            return
        }
        
        // Pulse 2
        let read2 = queryBus.read(2)
        guard read2.count == 2 else {
            XCTFail("Expected read2 to not be empty")
            return
        }
        
        let read2Values = read2.map { $0.getValue() }
        guard read2Values == [UInt32(1), UInt32(0)] else {
            XCTFail("Expected read2 to be [1, 0]")
            return
        }
        
        // Pulse 3
        guard let read3 = queryBus.read() else {
            XCTFail("Expected read3 to not be nil")
            return
        }
        guard read3.getValue() == 1 else {
            XCTFail("Expected read1 to be 1")
            return
        }
        
        // Pulse 4
        let read4 = queryBus.read(2)
        guard read4.count == 2 else {
            XCTFail("Expected read4 to not be empty")
            return
        }
        
        let read4Values = read4.map { $0.getValue() }
        guard read4Values == [UInt32(0), UInt32(1)] else {
            XCTFail("Expected read4 to be [0, 1]")
            return
        }
        
        // Pulse 5
        guard let read5 = queryBus.read() else {
            XCTFail("Expected read5 to not be nil")
            return
        }
        guard read5.getValue() == 0 else {
            XCTFail("Expected read1 to be 0")
            return
        }
        
        guard queryBus.canRead() == false else {
            XCTFail("Expected query bus to be empty")
            return
        }
    }
    
    func testPulse_0() {
        
    }
    
    func testPulse_1() {
        
    }
    
    
}
