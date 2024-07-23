//
//  NeuronQueueTests.swift
//  GeneralAIMusingsTests
//
//  Created by Nicky Taylor on 7/23/24.
//

import Foundation
import XCTest
@testable import GeneralAIMusings

final class NeuronQueueTests: XCTestCase {
    
    func testNeuronQueueOneWord_Cap0() {
        let queue = NeuronQueue<Word1>(capacity: 0)
        queue.write(Word1(value: 1))
        if queue.read() != nil {
            XCTFail("testNeuronQueueOneWord_Cap0 Should be Empty")
            return
        }
    }
    
    func testNeuronQueueOneWord_Cap1() {
        let queue = NeuronQueue<Word1>(capacity: 1)
        queue.write(Word1(value: 1))
        guard let read = queue.read() else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected Word")
            return
        }
        guard read.getValue() == 1 else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected 1")
            return
        }
    }
    
    func testNeuronQueueOneWord_Cap2() {
        let queue = NeuronQueue<Word1>(capacity: 2)
        queue.write(Word1(value: 1))
        guard let read = queue.read() else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected Word")
            return
        }
        guard read.getValue() == 1 else {
            XCTFail("testNeuronQueueOneWord_Cap1 Expected 1")
            return
        }
    }
    
    func testNeuronQueueSomeReadsAndWrites_A() {
        let queue = NeuronQueue<Word8>(capacity: 2)
        queue.write(Word8(value: 32))
        queue.write(Word8(value: 64))
        
        let reads1 = queue.read(2)
        let _reads1 = reads1.map { $0.getValue() }
        if _reads1 != [UInt32(32), UInt32(64)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_A Expected [32, 64]")
            return
        }
        
        queue.write(Word8(value: 1))
        queue.write(Word8(value: 2))
        
        let reads2 = queue.read(1)
        let _reads2 = reads2.map { $0.getValue() }
        if _reads2 != [UInt32(1)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_A Expected [1]")
            return
        }
        
        queue.write(Word8(value: 3))
        
        let reads3 = queue.read(2)
        let _reads3 = reads3.map { $0.getValue() }
        if _reads3 != [UInt32(2), UInt32(3)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_A Expected [2, 3], got \(_reads3)")
            return
        }
        
        let reads4 = queue.read(0)
        let _reads4 = reads4.map { $0.getValue() }
        if _reads4.count > 0 {
            XCTFail("testNeuronQueueSomeReadsAndWrites_A Expected Empty")
            return
        }
    }
    
    func testNeuronQueueSomeReadsAndWrites_B() {
        let queue = NeuronQueue<Word16>(capacity: 64)
        queue.write(Word16(value: 16))
        queue.write(Word16(value: 32))
        queue.write(Word16(value: 64))
        queue.write(Word16(value: 128))
        
        let reads1 = queue.read(3)
        let _reads1 = reads1.map { $0.getValue() }
        if _reads1 != [UInt32(16), UInt32(32), UInt32(64)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected [16, 32, 64]")
            return
        }
        
        let reads2 = queue.read(1)
        let _reads2 = reads2.map { $0.getValue() }
        if _reads2 != [UInt32(128)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected [128]")
            return
        }
        
        queue.write(Word16(value: 140))
        queue.write(Word16(value: 150))
        queue.write(Word16(value: 160))
        queue.write(Word16(value: 170))
        queue.write(Word16(value: 180))
        queue.write(Word16(value: 190))
        queue.write(Word16(value: 200))
        
        let reads3 = queue.read(2)
        let _reads3 = reads3.map { $0.getValue() }
        if _reads3 != [UInt32(140), UInt32(150)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected [140, 150]")
            return
        }
        
        let reads4 = queue.read(4)
        let _reads4 = reads4.map { $0.getValue() }
        if _reads4 != [UInt32(160), UInt32(170), UInt32(180), UInt32(190)] {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected [160, 170, 180, 190]")
            return
        }
        
        guard let read5 = queue.read() else {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected read5 not nil")
            return
        }
        
        if read5.getValue() != 200 {
            XCTFail("testNeuronQueueSomeReadsAndWrites_B Expected 200")
            return
        }
    }
    
    func testNeuronQueueCanWrite() {
        for capacity in 0..<32 {
            for numberToWriteA in 0..<32 {
                let queue = NeuronQueue<Word4>(capacity: capacity)
                for _ in 0..<numberToWriteA { queue.write(Word4(value: 0)) }
                for checkWrite in 1..<32 {
                    if (capacity - numberToWriteA) < checkWrite {
                        if queue.canWrite(checkWrite) {
                            XCTFail("testNeuronQueueCanWrite Expected can write \(checkWrite), when we wrote \(numberToWriteA) on capacity \(capacity)")
                            return
                        }
                    } else {
                        if !queue.canWrite(checkWrite) {
                            XCTFail("testNeuronQueueCanWrite Expected cannot write \(checkWrite), when we wrote \(numberToWriteA) on capacity \(capacity)")
                            return
                        }
                    }
                }
            }
        }
    }
    
    func testNeuronQueueCanRead() {
        for loopIndex in 0..<32 {
            let queue = NeuronQueue<Word8>(capacity: 128)
            let numberToWrite = loopIndex
            for writeIndex in 0..<numberToWrite {
                queue.write(Word8(value: UInt32(writeIndex)))
            }
            for numberToRead in 1..<32 {
                let canRead = queue.canRead(numberToRead)
                if numberToRead > loopIndex {
                    if canRead {
                        XCTFail("testNeuronQueueCanRead Expected cannot read \(numberToRead) from \(numberToWrite) written...")
                        return
                    }
                } else {
                    if !canRead {
                        XCTFail("testNeuronQueueCanRead Expected can read \(numberToRead) from \(numberToWrite) written...")
                        return
                    }
                }
            }
        }
    }
    
    func testNeuronQueue_100000_WriteOnly() {
        for OUTER_LOOP in 0..<100_000 {
            
            let capacity = Int.random(in: 0...64)
            
            let queue = NeuronQueue<Word32>(capacity: capacity)
            var testArray = [UInt32]()
            let numberOfWrites = Int.random(in: 1...8)
            for _ in 0..<numberOfWrites {
                let numberToWrite = Int.random(in: 1...8)
                var chunkArray = [UInt32]()
                for _ in 0..<numberToWrite {
                    chunkArray.append(UInt32.random(in: 0...255_555_555))
                }
                
                if testArray.count + chunkArray.count <= capacity {
                    testArray.append(contentsOf: chunkArray)
                }
                queue.write(chunkArray.map { Word32(value: $0) } )
            }
            
            let contents = queue.contents.map { $0.getValue() }
            if contents != testArray {
                XCTFail("testNeuronQueue_100000_WriteOnly @ \(OUTER_LOOP) Expected \(testArray) got \(contents)")
                return
            }
        }
    }
    
    func testNeuronQueue_500000_ReadWrite() {
        for OUTER_LOOP in 0..<50_000 {
            
            let capacity = Int.random(in: 0...64)
            
            let queue = NeuronQueue<Word32>(capacity: capacity)
            
            var arrayControl = [UInt32]()
            var readArrayControl = [UInt32]()
            var readArrayObserved = [UInt32]()
            
            let numberOfTrials = Int.random(in: 1...12)
            
            for _ in 0..<numberOfTrials {
                
                let numberOfWrites = Int.random(in: 1...6)
                let numberOfReads = Int.random(in: 1...4)
                
                var writeData = [UInt32]()
                for _ in 0..<numberOfWrites {
                    writeData.append(UInt32.random(in: 0...255_000_000))
                }
                queue.write(writeData.map { Word32(value: $0) } )
                if (arrayControl.count + numberOfWrites) <= capacity {
                    arrayControl.append(contentsOf: writeData)
                }
                
                let contents = queue.contents.map { $0.getValue() }
                if contents != arrayControl {
                    XCTFail("testNeuronQueue_500000_ReadWrite A @ \(OUTER_LOOP) Expected \(arrayControl) got \(contents)")
                    return
                }
                
                var readObserved = queue.read(numberOfReads).map { $0.getValue() }
                
                var readExpected = [UInt32]()
                if arrayControl.count >= numberOfReads {
                    for index in 0..<numberOfReads {
                        readExpected.append(arrayControl[index])
                    }
                    arrayControl = Array(arrayControl.dropFirst(numberOfReads))
                }
                
                if readObserved != readExpected {
                    XCTFail("testNeuronQueue_500000_ReadWrite B @ \(OUTER_LOOP) Expected \(readExpected) got \(readObserved)")
                    return
                }
                
                readArrayControl.append(contentsOf: readExpected)
                readArrayObserved.append(contentsOf: readObserved)
            }
            
            if readArrayControl != readArrayObserved {
                XCTFail("testNeuronQueue_500000_ReadWrite C @ \(OUTER_LOOP) Expected \(readArrayControl) got \(readArrayObserved)")
                return
            }
        }
    }
}
