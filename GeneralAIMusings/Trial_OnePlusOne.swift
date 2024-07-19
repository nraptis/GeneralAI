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
        let inputWord1 = Word()
        inputWord1.bit_00.value = true
        inputWord1.bit_01.value = false
        inputWord1.bit_02.value = false
        inputWord1.bit_03.value = false
        inputWord1.bit_04.value = true
        inputWord1.bit_05.value = true
        inputWord1.bit_06.value = false
        inputWord1.bit_07.value = false
        
        //+
        let inputWord2 = Word()
        inputWord2.bit_00.value = true
        inputWord2.bit_01.value = true
        inputWord2.bit_02.value = false
        inputWord2.bit_03.value = true
        inputWord2.bit_04.value = false
        inputWord2.bit_05.value = true
        inputWord2.bit_06.value = false
        inputWord2.bit_07.value = false
        
        //1
        let inputWord3 = Word()
        inputWord3.bit_00.value = true
        inputWord3.bit_01.value = false
        inputWord3.bit_02.value = false
        inputWord3.bit_03.value = false
        inputWord3.bit_04.value = true
        inputWord3.bit_05.value = true
        inputWord3.bit_06.value = false
        inputWord3.bit_07.value = false
        
        input.words.append(inputWord1)
        input.words.append(inputWord2)
        input.words.append(inputWord3)
        
        //2
        let outputWord1 = Word()
        outputWord1.bit_00.value = false
        outputWord1.bit_01.value = true
        outputWord1.bit_02.value = false
        outputWord1.bit_03.value = false
        outputWord1.bit_04.value = true
        outputWord1.bit_05.value = true
        outputWord1.bit_06.value = false
        outputWord1.bit_07.value = false
        
        expectedOutput.words.append(outputWord1)
        
    }
    
    
}
