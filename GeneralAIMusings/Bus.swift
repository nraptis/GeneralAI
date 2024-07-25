//
//  Bus.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/22/24.
//

import Foundation

class Bus<WordType: Wordable> {
    
    private var buffer = [WordType]()
    private var capacity = 0
    private(set) var length = 0
    private(set) var readCursor = 0
    private(set) var writeCursor = 0
    
    func clear() {
        buffer.removeAll()
        length = 0
        readCursor = 0
        writeCursor = 0
        capacity = 0
    }
    
    var contents: [WordType] {
        var result = [WordType]()
        var loopIndex = 0
        while loopIndex < length {
            result.append(buffer[loopIndex])
            loopIndex += 1
        }
        return result
    }
    
    func write(_ words: [WordType]) {
        for word in words {
            write(word)
        }
    }
    
    func write(_ word: WordType) {
        if writeCursor >= capacity {
            let newCapacity = (writeCursor + (writeCursor >> 1) + 1)
            reserveCapacity(minimumCapacity: newCapacity)
        }
        buffer[writeCursor] = word
        writeCursor += 1
        
        if writeCursor > length {
            length = writeCursor
        }
    }
    
    func write(_ bus: Bus<WordType>) {
        write(bus.contents)
    }
    
    func canRead() -> Bool {
        if readCursor < length {
            return true
        }
        return false
    }
    
    func canRead(_ count: Int) -> Bool {
        if count > 0 {
            let remainingWordCount = (length - readCursor)
            if remainingWordCount >= 0 && remainingWordCount >= count {
                return true
            }
        }
        return false
    }
    
    func read(_ count: Int) -> [WordType] {
        var result = [WordType]()
        if canRead(count) {
            var loopIndex = 0
            while loopIndex < count {
                result.append(buffer[readCursor])
                readCursor += 1
                loopIndex += 1
            }
        }
        return result
    }
    
    func read() -> WordType? {
        var result: WordType?
        if canRead() {
            result = buffer[readCursor]
            readCursor += 1
        }
        return result
    }
    
    func reserveCapacity(minimumCapacity: Int) {
        if minimumCapacity > capacity {
            buffer.reserveCapacity(minimumCapacity)
            while buffer.count < minimumCapacity {
                buffer.append(WordType(value: 0))
            }
            capacity = minimumCapacity
        }
    }
    
    func removeAll(keepingCapacity: Bool) {
        if keepingCapacity == false {
            buffer.removeAll(keepingCapacity: false)
            capacity = 0
        }
        length = 0
        readCursor = 0
        writeCursor = 0
    }
}
