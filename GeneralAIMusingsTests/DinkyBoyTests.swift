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
    
    func validate(neuron: Neuron<Word1>, name: String, expectedValues: [UInt32]) -> Bool {
        if neuron.queue.count != expectedValues.count {
            XCTFail("[Neuron] Expected \(expectedValues.count) words on \(name), got \(neuron.queue.count)")
            return false
        }
        
        for index in expectedValues.indices {
            if expectedValues[index] != neuron.queue.buffer[index].getValue() {
                XCTFail("[Neuron] Expected \(expectedValues[index]) on \(name), index \(index) got \(neuron.queue.buffer[index].getValue())")
                return false
            }
        }
        
        return true
    }
    
    func validate(bus: Bus<Word1>, name: String, expectedValues: [UInt32]) -> Bool {
        
        let contents = bus.contents.map { $0.getValue() }
        if contents.count != expectedValues.count {
            XCTFail("[Bus] Expected \(expectedValues.count) words on \(name), got \(contents.count)")
            return false
        }
        
        for index in expectedValues.indices {
            if expectedValues[index] != contents[index] {
                XCTFail("[Bus] Expected \(expectedValues[index]) on \(name), index \(index) got \(contents[index])")
                return false
            }
        }
        
        return true
        
    }
    
    func testValidate_A() {
        let neuron = Neuron<Word1>(queueSize: 4)
        if !validate(neuron: neuron, name: "test neuron a", expectedValues: []) {
            return
        }
    }
    
    func testValidate_B() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 1))
        if !validate(neuron: neuron, name: "test neuron b", expectedValues: [1]) {
            return
        }
    }
    
    func testValidate_C_1() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 1))
        neuron.queue.write(Word1(value: 0))
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: [1, 0]) {
            return
        }
        _ = neuron.queue.read()
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: [0]) {
            return
        }
        _ = neuron.queue.read()
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: []) {
            return
        }
    }
    
    func testValidate_C_2() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 1))
        neuron.queue.write(Word1(value: 0))
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: [1, 0]) {
            return
        }
        _ = neuron.queue.read(1)
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: [0]) {
            return
        }
        _ = neuron.queue.read(1)
        if !validate(neuron: neuron, name: "test neuron c", expectedValues: []) {
            return
        }
    }
    
    func testValidate_D_1() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 0))
        neuron.queue.write(Word1(value: 1))
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: [0, 1]) {
            return
        }
        _ = neuron.queue.read()
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: [1]) {
            return
        }
        _ = neuron.queue.read()
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: []) {
            return
        }
    }
    
    func testValidate_D_2() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 0))
        neuron.queue.write(Word1(value: 1))
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: [0, 1]) {
            return
        }
        _ = neuron.queue.read(1)
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: [1]) {
            return
        }
        _ = neuron.queue.read(1)
        if !validate(neuron: neuron, name: "test neuron d", expectedValues: []) {
            return
        }
    }
    
    func testValidate_E() {
        let neuron = Neuron<Word1>(queueSize: 4)
        neuron.queue.write(Word1(value: 0))
        neuron.queue.write(Word1(value: 1))
        neuron.queue.write(Word1(value: 1))
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [0, 1, 1]) {
            return
        }
        
        _ = neuron.queue.read()
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [1, 1]) {
            return
        }
        
        neuron.queue.write(Word1(value: 0))
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [1, 1, 0]) {
            return
        }
        
        _ = neuron.queue.read(2)
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [0]) {
            return
        }
        neuron.queue.write(Word1(value: 1))
        neuron.queue.write(Word1(value: 0))
        neuron.queue.write(Word1(value: 0))
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [0, 1, 0, 0]) {
            return
        }
        _ = neuron.queue.read(5)
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: [0, 1, 0, 0]) {
            return
        }
        _ = neuron.queue.read(4)
        if !validate(neuron: neuron, name: "test neuron 1", expectedValues: []) {
            return
        }
    }
    
    func executePulses(testPieces: TestPieces, pulseCount: Int) {
        let brain = testPieces.brain
        
        brain.process_step_0()
        brain.process_step_1()
        
        var loopIndex = 0
        while loopIndex < pulseCount {
            
            brain.pulse_step_0()
            brain.pulse_step_1()
            
            loopIndex += 1
        }
    }
    
    func testPulse_0() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 0)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: []) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: [1, 1, 0, 1, 0, 1, 0]) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: []) { return }
        
        if inputNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on input neuron, got \(inputNeuron.ruleIndex)")
            return
        }
        if inputNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on input neuron, got \(inputNeuron.connectionIndex)")
            return
        }
        if topNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on top neuron, got \(topNeuron.ruleIndex)")
            return
        }
        if topNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on top neuron, got \(topNeuron.connectionIndex)")
            return
        }
        if bottomNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on bottom neuron, got \(bottomNeuron.ruleIndex)")
            return
        }
        if bottomNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on bottom neuron, got \(bottomNeuron.connectionIndex)")
            return
        }
    }
    
    func testPulse_1() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 1)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: []) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: [1, 0, 1, 0, 1, 0]) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1]) { return }
        
        if inputNeuron.ruleIndex != 1 {
            XCTFail("expected ruleIndex == 1 on input neuron, got \(inputNeuron.ruleIndex)")
            return
        }
        if inputNeuron.connectionIndex != 1 {
            XCTFail("expected connectionIndex == 1 on input neuron, got \(inputNeuron.connectionIndex)")
            return
        }
        if topNeuron.ruleIndex != 1 {
            XCTFail("expected ruleIndex == 1 on top neuron, got \(topNeuron.ruleIndex)")
            return
        }
        if topNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on top neuron, got \(topNeuron.connectionIndex)")
            return
        }
        if bottomNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on bottom neuron, got \(bottomNeuron.ruleIndex)")
            return
        }
        if bottomNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on bottom neuron, got \(bottomNeuron.connectionIndex)")
            return
        }
    }
    
    func testPulse_2() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 2)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: []) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: [1, 0, 1, 0]) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1]) { return }
        
        if inputNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on input neuron, got \(inputNeuron.ruleIndex)")
            return
        }
        if inputNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on input neuron, got \(inputNeuron.connectionIndex)")
            return
        }
        if topNeuron.ruleIndex != 2 {
            XCTFail("expected ruleIndex == 2 on top neuron, got \(topNeuron.ruleIndex)")
            return
        }
        if topNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on top neuron, got \(topNeuron.connectionIndex)")
            return
        }
        if bottomNeuron.ruleIndex != 1 {
            XCTFail("expected ruleIndex == 1 on bottom neuron, got \(bottomNeuron.ruleIndex)")
            return
        }
        if bottomNeuron.connectionIndex != 1 {
            XCTFail("expected connectionIndex == 1 on bottom neuron, got \(bottomNeuron.connectionIndex)")
            return
        }
    }
    
    func testPulse_3() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 3)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: [1]) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: [0, 1, 0]) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1]) { return }
        
        if inputNeuron.ruleIndex != 1 {
            XCTFail("expected ruleIndex == 1 on input neuron, got \(inputNeuron.ruleIndex)")
            return
        }
        if inputNeuron.connectionIndex != 1 {
            XCTFail("expected connectionIndex == 1 on input neuron, got \(inputNeuron.connectionIndex)")
            return
        }
        if topNeuron.ruleIndex != 0 {
            XCTFail("expected ruleIndex == 0 on top neuron, got \(topNeuron.ruleIndex)")
            return
        }
        if topNeuron.connectionIndex != 0 {
            XCTFail("expected connectionIndex == 0 on top neuron, got \(topNeuron.connectionIndex)")
            return
        }
        if bottomNeuron.ruleIndex != 1 {
            XCTFail("expected ruleIndex == 1 on bottom neuron, got \(bottomNeuron.ruleIndex)")
            return
        }
        if bottomNeuron.connectionIndex != 1 {
            XCTFail("expected connectionIndex == 1 on bottom neuron, got \(bottomNeuron.connectionIndex)")
            return
        }
    }
    
    func testPulse_4() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 4)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: [1, 1]) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: [0]) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1, 1]) { return }
    }
    
    func testPulse_5() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 5)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: [0, 0]) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: []) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1, 1, 1]) { return }
    }
    
    func testPulse_6() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 6)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: [0]) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: []) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1, 1, 1, 0, 0]) { return }
    }
    
    func testPulse_7() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 7)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: []) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: []) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1, 1, 1, 0, 0, 0]) { return }
    }
    
    func testPulse_8() {
        let testPieces = getTestPieces()
        let brain = testPieces.brain
        let inputNeuron = testPieces.inputNeuron
        let topNeuron = testPieces.topNeuron
        let bottomNeuron = testPieces.bottomNeuron
        let outputNeuron = testPieces.outputNeuron
        executePulses(testPieces: testPieces, pulseCount: 8)
        if !validate(neuron: inputNeuron, name: "input neuron", expectedValues: []) { return }
        if !validate(neuron: topNeuron, name: "top neuron", expectedValues: []) { return }
        if !validate(neuron: bottomNeuron, name: "bottom neuron", expectedValues: []) { return }
        if !validate(neuron: outputNeuron, name: "output neuron", expectedValues: []) { return }
        if !validate(bus: brain.queryBus, name: "query bus", expectedValues: []) { return }
        if !validate(bus: brain.responseBus, name: "response bus", expectedValues: [1, 1, 1, 1, 1, 1, 0, 0, 0]) { return }
    }
    
}
