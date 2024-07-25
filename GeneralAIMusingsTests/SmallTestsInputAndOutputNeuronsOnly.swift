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
    
    /*
    func testSinglePulseInputToOutput_Dupe_Zero() {
        
        let brain = Brain<Word16>()
        
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.process_step_0()
        
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
    
    func testSinglePulseInputToOutput_CopyAndInvertRoundRobbin() {
        
        let brain = Brain<Word16>()
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        brain.inputNeuron.rules.append(.copy)
        brain.inputNeuron.rules.append(.invert)
        
        brain.process_step_0()
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        
        brain.process_step_2()
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 4 {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected 4 output neuron input bits")
            return
        }
        if brain.outputNeuron.inputBits[0] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 0 to be true")
            return
        }
        if brain.outputNeuron.inputBits[1] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 1 to be false")
            return
        }
        if brain.outputNeuron.inputBits[2] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 2 to be true")
            return
        }
        if brain.outputNeuron.inputBits[3] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 3 to be false")
            return
        }
    }
    
    func testSinglePulseInputToOutput_InvertAndCopyRoundRobbin() {
        
        let brain = Brain<Word16>()
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        
        brain.inputNeuron.rules.append(.invert)
        brain.inputNeuron.rules.append(.copy)
        
        brain.process_step_0()
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        
        brain.process_step_2()
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 4 {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected 4 output neuron input bits")
            return
        }
        if brain.outputNeuron.inputBits[0] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 0 to be false")
            return
        }
        if brain.outputNeuron.inputBits[1] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 1 to be true")
            return
        }
        if brain.outputNeuron.inputBits[2] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 2 to be false")
            return
        }
        if brain.outputNeuron.inputBits[3] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 3 to be true")
            return
        }
    }
    
    func testSinglePulseInputToOutput_CopyTooManyTimes_A() {
        
        let brain = Brain<Word16>()
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        for _ in 0...100 {
            brain.inputNeuron.rules.append(.copy)
        }
        brain.process_step_0()
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        
        brain.process_step_2()
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 4 {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected 4 output neuron input bits")
            return
        }
        if brain.outputNeuron.inputBits[0] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 0 to be true")
            return
        }
        if brain.outputNeuron.inputBits[1] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 1 to be true")
            return
        }
        if brain.outputNeuron.inputBits[2] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 2 to be true")
            return
        }
        if brain.outputNeuron.inputBits[3] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 3 to be true")
            return
        }
    }
    
    func testSinglePulseInputToOutput_CopyTooManyTimes_B() {
        
        let brain = Brain<Word16>()
        brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
        for _ in 0...100 {
            brain.inputNeuron.rules.append(.copy)
        }
        brain.process_step_0()
        brain.inputNeuron.appendBitToInput(bit: false)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: true)
        brain.inputNeuron.appendBitToInput(bit: false)
        
        brain.process_step_2()
        brain.pulse_step_0()
        brain.pulse_step_1()
        
        if brain.outputNeuron.inputBits.count != 4 {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected 4 output neuron input bits")
            return
        }
        if brain.outputNeuron.inputBits[0] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 0 to be false")
            return
        }
        if brain.outputNeuron.inputBits[1] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 1 to be true")
            return
        }
        if brain.outputNeuron.inputBits[2] != true {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 2 to be true")
            return
        }
        if brain.outputNeuron.inputBits[3] != false {
            XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, expected outputNeuron input bit 3 to be false")
            return
        }
    }
    
    func testManySmallCombinationsOfCopyAndInputBits() {
        
        for numberOfInputBits in 0...24 {
            for numberOfRules in 1...28 {
                
                let brain = Brain<Word16>()
                brain.axons.append(.init(neuronIndexA: .input, neuronIndexB: .output, direction: .a_to_b))
                
                for _ in 0..<numberOfRules {
                    brain.inputNeuron.rules.append(.copy)
                }
                
                brain.process_step_0()
                
                var bitz = [Bool]()
                for _ in 0..<numberOfInputBits {
                    bitz.append(Bool.random())
                }
                
                for bit in bitz {
                    brain.inputNeuron.appendBitToInput(bit: bit)
                }
                
                brain.process_step_2()
                brain.pulse_step_0()
                brain.pulse_step_1()
                
                if brain.outputNeuron.inputBits.count != bitz.count {
                    XCTFail("testManySmallCombinationsOfCopyAndInputBits, expected \(bitz.count) output neuron input bits")
                    return
                }
                
                for index in bitz.indices {
                    let bitA = bitz[index]
                    let bitB = brain.outputNeuron.inputBits[index]
                    if bitA != bitB {
                        XCTFail("testSinglePulseInputToOutput_CopyAndInvertRoundRobbin, @ \(index) bitz = \(bitz) output  neuron input bits = \(brain.outputNeuron.inputBits)")
                        return
                    }
                }
            }
        }
    }
    */
    
}
