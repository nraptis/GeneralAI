//
//  SmallTestsOneNeuron.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/17/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class SmallTestsOneNeuron: XCTestCase {
    
    func testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy() {
        
        let brain = Brain()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .body(0), direction: .a_to_b))
        brain.axons.append(.init(neuronIndexA: .body(0), neuronIndexB: .output, direction: .a_to_b))
        
        let neuron = Neuron()
        brain.neurons.append(neuron)
        
        neuron.rules.append(.copy)
        
        brain.inputNeuron.rules.append(.copy)
        
        
        brain.process_step_0()
        
        brain.inputNeuron.inputBits.append(.one)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.inputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 0 for inputNeuron")
            return
        }
        
        if neuron.inputBits.count != 1 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 1 for neuron")
            return
        }
        
        if neuron.inputBits[0].value != true {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits[0] = true for middle neuron")
            return
        }
        
        if brain.outputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for outputNeuron")
            return
        }
        
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.inputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for inputNeuron")
            return
        }
        
        if neuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for neuron")
            return
        }
        
        if brain.outputNeuron.inputBits.count != 1 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits 1 inputBits for outputNeuron")
            return
        }
        
        if brain.outputNeuron.inputBits[0].value != true {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, inputBits[0] = true for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.bytes.count != 1 {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, expected 1 byte in the result... Got \(result.bytes.count) bytes instead")
            return
        }
        
        if result.bytes[0].equals(uint8: 1) == false {
            XCTFail("testTwoPulse_OneBit_OneRuleOnEach_Copy_Copy, bytes[0] to equal 1, it didn't")
            return
        }
        
    }
    
    func testTwoPulse_TwoBits_OneRuleOnEach_Copy_Copy() {
        
        let brain = Brain()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .body(0), direction: .a_to_b))
        brain.axons.append(.init(neuronIndexA: .body(0), neuronIndexB: .output, direction: .a_to_b))
        
        let neuron = Neuron()
        brain.neurons.append(neuron)
        
        neuron.rules.append(.copy)
        
        brain.inputNeuron.rules.append(.copy)
        
        
        brain.process_step_0()
        
        brain.inputNeuron.inputBits.append(.one)
        brain.inputNeuron.inputBits.append(.one)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.inputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 0 for inputNeuron")
            return
        }
        
        if neuron.inputBits.count != 2 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 2 for neuron")
            return
        }
        
        if neuron.inputBits[0].value != true {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits[0] = true for middle neuron")
            return
        }
        
        if neuron.inputBits[1].value != true {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits[1] = true for middle neuron")
            return
        }
        
        if brain.outputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for outputNeuron")
            return
        }
        
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.inputNeuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for inputNeuron")
            return
        }
        
        if neuron.inputBits.count != 0 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 0 inputBits for neuron")
            return
        }
        
        if brain.outputNeuron.inputBits.count != 2 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits 2 inputBits for outputNeuron")
            return
        }
        
        if brain.outputNeuron.inputBits[0].value != true {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits[0] = true for outputNeuron")
            return
        }
        
        if brain.outputNeuron.inputBits[1].value != true {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, inputBits[1] = true for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.bytes.count != 1 {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, expected 1 byte in the result... Got \(result.bytes.count) bytes instead")
            return
        }
        
        if result.bytes[0].equals(uint8: 3) == false {
            XCTFail("testTwoPulse_OneRuleOnEach_Copy_Copy, bytes[0] to equal 3, it didn't")
            return
        }
        
    }
}
