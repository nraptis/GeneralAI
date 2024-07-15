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
        }
        if brain.outputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected outputNeuron to have 1 connection")
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
        }
        if brain.outputNeuron.connections.count != 1 {
            XCTFail("testStepZero:: expected outputNeuron to have 1 connection")
        }
    }
    

}
