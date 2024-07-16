//
//  SmallTestsInputAndOutputNeuronsOnly.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/16/24.
//

import Foundation
import Foundation
import XCTest
@testable import GeneralAIMusings

final class SmallTestsInputAndOutputNeuronsOnly: XCTestCase {
    
    func testSinglePulseInputToOutput_Dupe_Zero() {
        
        let brain = Brain()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.process_step_0()
        
        //Instead of step 1, we do a single bit and rule...
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.inputBits.append(.zero)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 2 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, inputBits 2 outputBits for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.bytes.count != 1 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, expected 1 byte in the result... Got \(result.bytes.count) bytes instead")
            return
        }
        
        if result.bytes[0].equals(uint8: 0) == false {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, bytes[0] to equal 0, it didn't")
            return
        }
        
    }
    
    func testSinglePulseInputToOutput_Dupe_One() {
        
        let brain = Brain()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.process_step_0()
        
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.inputBits.append(.one)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 2 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, inputBits 2 outputBits for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.bytes.count != 1 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, expected 1 byte in the result... Got \(result.bytes.count) bytes instead")
            return
        }
        
        if result.bytes[0].equals(uint8: 0) == false {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, bytes[0] to equal 0, it didn't")
            return
        }
        
    }
    
    
    
}
