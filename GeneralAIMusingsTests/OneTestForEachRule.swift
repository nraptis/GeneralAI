//
//  OneTestForEachRule.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/16/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class OneTestForEachRule: XCTestCase {
    
    
    func testRuleDupe_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 2 {
            XCTFail("testRuleDupe, expected 2 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != false {
            XCTFail("testRuleDupe, expected outputBits[0] as false")
        }
        if brain.inputNeuron.outputBits[1].value != false {
            XCTFail("testRuleDupe, expected outputBits[1] as false")
        }
    }
    
    func testRuleDupe_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.dupe)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 2 {
            XCTFail("testRuleDupe, expected 2 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != true {
            XCTFail("testRuleDupe, expected outputBits[0] as true")
        }
        if brain.inputNeuron.outputBits[1].value != true {
            XCTFail("testRuleDupe, expected outputBits[1] as true")
        }
    }
    
    func testRuleRemove_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.remove)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 0 {
            XCTFail("testRuleRemove, expected 0 outputBits for inputNeuron")
        }
    }
    
    func testRuleRemove_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.remove)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 0 {
            XCTFail("testRuleRemove, expected 0 outputBits for inputNeuron")
        }
    }
    
    func testRuleCopy_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.copy)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleCopy, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != false {
            XCTFail("testRuleCopy, expected outputBits[0] as false")
        }
    }
    
    func testRuleCopy_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.copy)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleCopy, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != true {
            XCTFail("testRuleCopy, expected outputBits[0] as true")
        }
    }
    
    func testRuleInvert_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.invert)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleInvert, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != true {
            XCTFail("testRuleInvert, expected outputBits[0] as true")
        }
    }
    
    func testRuleInvert_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.invert)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleInvert, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != false {
            XCTFail("testRuleInvert, expected outputBits[0] as false")
        }
    }
    
    func testRuleOne_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.one)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleOne, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != true {
            XCTFail("testRuleOne, expected outputBits[0] as true")
        }
    }
    
    func testRuleOne_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.one)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleOne, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != true {
            XCTFail("testRuleOne, expected outputBits[0] as true")
        }
    }
    
    func testRuleZero_Zero() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.zero)
        brain.inputNeuron.inputBits.append(.zero)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleZero, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != false {
            XCTFail("testRuleZero, expected outputBits[0] as false")
        }
    }
    
    func testRuleZero_One() {
        let brain = Brain()
        brain.process_step_2()
        brain.inputNeuron.rules.append(.zero)
        brain.inputNeuron.inputBits.append(.one)
        brain.pulse_step_0()
        
        if brain.inputNeuron.outputBits.count != 1 {
            XCTFail("testRuleZero, expected 1 outputBits for inputNeuron")
        }
        if brain.inputNeuron.outputBits[0].value != false {
            XCTFail("testRuleZero, expected outputBits[0] as false")
        }
    }
}
