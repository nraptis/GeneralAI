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
        
        let brain = Brain<Word16>()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.process_step_0()
        
        //Instead of step 1, we do a single bit and rule...
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.inputBits.append(false)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 2 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, inputBits 2 outputBits for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.words.count != 1 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, expected 1 word in the result... Got \(result.words.count) words instead")
            return
        }
        
        if result.words[0].equals(value: 0) == false {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, words[0] to equal 0, it didn't")
            return
        }
        
    }
    
    func testSinglePulseInputToOutput_Dupe_One() {
        
        let brain = Brain<Word16>()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.inputNeuron.rules.append(.dupe)
        
        brain.process_step_0()
        
        brain.inputNeuron.inputBits.append(true)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 2 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, inputBits 2 outputBits for outputNeuron")
            return
        }
        
        let result = brain.process_step_3()
        
        if result.words.count != 1 {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, expected 1 word in the result... Got \(result.words.count) words instead")
            return
        }
        
        if result.words[0].equals(value: 3) == false {
            XCTFail("testSinglePulseInputToOutput_Dupe_Zero, words[0] to equal 0, it didn't")
            return
        }
    }
    
    func testSinglePulseInputToOutput_CopyWholeString() {
     
        let inputString = "這個人病得很重，確實病得很重"
        let inputDataStream = DataStream<Word16>(string: inputString)
        
        let brain = Brain<Word16>()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.inputNeuron.rules.append(.copy)
        
        brain.process_step_0()
        
        brain.inputNeuron.appendDataStreamToInput(dataStream: inputDataStream)
        
        brain.process_step_2()
        
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        let result = brain.process_step_3()
        
        let outputString = result.string
        
        if outputString != inputString {
            XCTFail("testSinglePulseInputToOutput_CopyWholeString, in(\(inputString)) out(\(outputString))")
            return
        }
    }
}
