//
//  Trial_OnePlusOne.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/15/24.
//

import Foundation

class Trial_OnePlusOne: Trial {
    
    override init() {
        
        super.init()
        
        //1
        let inputByte1 = Byte()
        inputByte1.bit0.value = true
        inputByte1.bit1.value = false
        inputByte1.bit2.value = false
        inputByte1.bit3.value = false
        inputByte1.bit4.value = true
        inputByte1.bit5.value = true
        inputByte1.bit6.value = false
        inputByte1.bit7.value = false
        
        //+
        let inputByte2 = Byte()
        inputByte2.bit0.value = true
        inputByte2.bit1.value = true
        inputByte2.bit2.value = false
        inputByte2.bit3.value = true
        inputByte2.bit4.value = false
        inputByte2.bit5.value = true
        inputByte2.bit6.value = false
        inputByte2.bit7.value = false
        
        //1
        let inputByte3 = Byte()
        inputByte3.bit0.value = true
        inputByte3.bit1.value = false
        inputByte3.bit2.value = false
        inputByte3.bit3.value = false
        inputByte3.bit4.value = true
        inputByte3.bit5.value = true
        inputByte3.bit6.value = false
        inputByte3.bit7.value = false
        
        input.bytes.append(inputByte1)
        input.bytes.append(inputByte2)
        input.bytes.append(inputByte3)
        
        //2
        let outputByte1 = Byte()
        outputByte1.bit0.value = false
        outputByte1.bit1.value = true
        outputByte1.bit2.value = false
        outputByte1.bit3.value = false
        outputByte1.bit4.value = true
        outputByte1.bit5.value = true
        outputByte1.bit6.value = false
        outputByte1.bit7.value = false
        
        expectedOutput.bytes.append(outputByte1)
        
    }
    
    
}
