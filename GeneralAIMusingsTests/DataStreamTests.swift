//
//  DataStreamTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class DataStreamTests: XCTestCase {
    
    func testOneCharacterString() {
        let inputString = "a"
        let dataStream = DataStream<Word16>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
    func testOneCharacterStringInverse() {
        let inputString = "a"
        let dataStream = DataStream<Word8>(string: "b")
        let outputString = dataStream.string
        if outputString == inputString {
            XCTFail("Expected input string (\(inputString)) to not be (\(outputString))...")
        }
    }
    
    func testRussianString() {
        let inputString = "Этот человек очень болен, действительно очень болен."
        let dataStream = DataStream<Word16>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
    func testIcelandicString() {
        let inputString = "Maðurinn er mjög veikur, mjög veikur."
        let dataStream = DataStream<Word16>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
    func testHindiString() {
        let inputString = "वह आदमी बहुत बीमार है, सचमुच बहुत बीमार है।"
        let dataStream = DataStream<Word16>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
    func testChineseString() {
        let inputString = "這個人病得很重，確實病得很重"
        let dataStream = DataStream<Word16>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
    func testMongolianString() {
        let inputString = "Тэр хүн маш их өвчтэй, үнэхээр өвчтэй байна."
        let dataStream = DataStream<Word32>(string: inputString)
        let outputString = dataStream.string
        if outputString != inputString {
            XCTFail("Expected input string (\(inputString)) to be (\(outputString))...")
        }
    }
    
}
