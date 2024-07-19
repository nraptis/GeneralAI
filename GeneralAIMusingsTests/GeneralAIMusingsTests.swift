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
        
        let brain = Brain<Word4>()
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
        
        let brain = Brain<Word4>()
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
        
        let brain = Brain<Word4>()
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
    
    func testStepOne_OneWord16() {
        
        let brain = Brain<Word16>()
        
        let dataStream = DataStream<Word16>()
        dataStream.words.append(Word16(value: 3))
        
        brain.process_step_1(dataStream: dataStream)
        
        if brain.inputNeuron.inputBits.count != 16 {
            XCTFail("Expected 16 bits on neuron")
            return
        }
        
        if brain.inputNeuron.inputBits[0] != true {
            XCTFail("testStepOne:: expected neuron input bit 0 to have true")
            return
        }
        
        if brain.inputNeuron.inputBits[1] != true {
            XCTFail("testStepOne:: expected neuron input bit 1 to have true")
            return
        }
        
        for i in 2...15 {
            if brain.inputNeuron.inputBits[i] != false {
                XCTFail("testStepOne:: expected neuron input bit \(i) to have false")
                return
            }
        }
    }
    
    func testStepTwo_NoNeurons() {
        let brain = Brain<Word16>()
        brain.process_step_2()
        
        if brain.processNeuronList.count != 2 {
            XCTFail("testStepTwo:: expected processNeuronList count to be 2")
            return
        }
        
        if brain.inputNeuron.index != 0 {
            XCTFail("testStepTwo:: expected inputNeuron index to be 0")
            return
        }
        
        if brain.inputNeuron !== brain.processNeuronList[0] {
            XCTFail("testStepTwo:: expected inputNeuron to be processNeuronList[0]")
            return
        }
        
        if brain.outputNeuron.index != 1 {
            XCTFail("testStepTwo:: expected outputNeuron index to be 1")
            return
        }
        
        if brain.outputNeuron !== brain.processNeuronList[1] {
            XCTFail("testStepTwo:: expected outputNeuron to be processNeuronList[1]")
            return
        }
    }
    
    func testStepTwo_OneNeurons() {
        let brain = Brain<Word16>()
        let neuron = Neuron<Word16>()
        
        brain.neurons.append(neuron)
        
        brain.process_step_2()
        
        if brain.processNeuronList.count != 3 {
            XCTFail("testStepTwo:: expected processNeuronList count to be 3")
            return
        }
        
        if brain.inputNeuron.index != 0 {
            XCTFail("testStepTwo:: expected inputNeuron index to be 0")
            return
        }
        
        if brain.inputNeuron !== brain.processNeuronList[0] {
            XCTFail("testStepTwo:: expected inputNeuron to be processNeuronList[0]")
            return
        }
        
        if neuron.index != 1 {
            XCTFail("testStepTwo:: expected neuron index to be 1")
            return
        }
        
        if neuron !== brain.processNeuronList[1] {
            XCTFail("testStepTwo:: expected neuron to be processNeuronList[21]")
            return
        }
        
        if brain.outputNeuron.index != 2 {
            XCTFail("testStepTwo:: expected outputNeuron index to be 2")
            return
        }
        
        if brain.outputNeuron !== brain.processNeuronList[2] {
            XCTFail("testStepTwo:: expected outputNeuron to be processNeuronList[2]")
            return
        }
    }
    
}
