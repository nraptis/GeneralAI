//
//  GeneralAIMusingsTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/15/24.
//

import XCTest
@testable import GeneralAIMusings

final class GeneralAIMusingsTests: XCTestCase {

    func testStepZero_A() {
        
        let brain = Brain()
        brain.axons.append(Axon(neuronIndexA: .input,
                                neuronIndexB: .output,
                                direction: .a_to_b))
        brain.process_step_0()
        if brain.inputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected inputNeuron to have 1 connection")
        }
        if brain.outputNeuron.connections.count != 0 {
            XCTFail("testStepZero:: expected outputNeuron to have 0 connections")
        }
    }
    
    func testStepZero_B() {
        
        let brain = Brain()
        brain.axons.append(Axon(neuronIndexA: .input,
                                neuronIndexB: .output,
                                direction: .b_to_a))
        brain.process_step_0()
        if brain.inputNeuron.connections.count != 0 {
            XCTFail("testStepZero:: expected inputNeuron to have 0 connections")
            return
        }
        if brain.outputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected outputNeuron to have 1 connection")
            return
        }
    }
    
    func testStepZero_C() {
        
        let brain = Brain()
        brain.axons.append(Axon(neuronIndexA: .input,
                                neuronIndexB: .output,
                                direction: .both))
        brain.process_step_0()
        if brain.inputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected inputNeuron to have 1 connections")
            return
        }
        if brain.outputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected outputNeuron to have 1 connection")
            return
        }
    }
    
    func testStepOne_A() {
        
        let brain = Brain()
        
        let dataStream = DataStream()
        dataStream.bytes.append(Byte(uint8: 3))
        
        brain.process_step_1(dataStream: dataStream)
        
        if brain.inputNeuron.inputBits.count != 8 {
            XCTFail("Expected 8 bits on neuron")
            return
        }
        
        if brain.inputNeuron.inputBits[0].value != true {
            XCTFail("testStepOne:: expected neuron input bit 0 to have true")
            return
        }
        
        if brain.inputNeuron.inputBits[1].value != true {
            XCTFail("testStepOne:: expected neuron input bit 1 to have true")
            return
        }
        
        for i in 2...7 {
            if brain.inputNeuron.inputBits[i].value != false {
                XCTFail("testStepOne:: expected neuron input bit \(i) to have false")
                return
            }
        }
    }
}
