//
//  NeuronQueue.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/23/24.
//

import Foundation

class NeuronQueue<WordType: Wordable> {
    
    let capacity: Int
    private(set) var buffer: [WordType]
    private(set) var count = 0
    init(capacity: Int) {
        self.capacity = capacity
        self.buffer = [WordType](repeating: WordType(value: 0), count: capacity)
    }
    
    var contents: [WordType] {
        var result = [WordType]()
        var loopIndex = 0
        while loopIndex < count {
            result.append(buffer[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
    func canWrite() -> Bool {
        if count < capacity {
            return true
        }
        return false
    }
    
    func canWrite(_ count: Int) -> Bool {
        let remainingCapacity = (capacity - self.count)
        if count < remainingCapacity {
            return true
        }
        return false
    }
    
    func write(_ word: WordType) {
        if canWrite() {
            buffer[count] = word
            count += 1
        }
    }
    
    func write(_ words: [WordType]) {
        if canWrite(words.count) {
            for word in words {
                buffer[count] = word
                count += 1
            }
        }
    }
    
    func canRead() -> Bool {
        if count > 0 {
            return true
        }
        return false
    }
    
    func canRead(_ count: Int) -> Bool {
        if count > 0 {
            if count <= self.count {
                return true
            }
        }
        return false
    }
    
    func read() -> WordType? {
        var result: WordType?
        if canRead() {
            result = buffer[0]
            var loopIndex = 1
            while loopIndex < count {
                buffer[loopIndex - 1] = buffer[loopIndex]
                loopIndex += 1
            }
            count -= 1
        }
        return result
    }
    
    func read(_ count: Int) -> [WordType] {
        var result = [WordType]()
        if canRead(count) {
            for resultIndex in 0..<count {
                result.append(buffer[resultIndex])
            }
            var loopIndex = count
            while loopIndex < count {
                buffer[loopIndex - count] = buffer[loopIndex]
                loopIndex += 1
            }
            self.count -= count
        }
        return result
    }
    
    func removeAll() {
        count = 0
    }
}
