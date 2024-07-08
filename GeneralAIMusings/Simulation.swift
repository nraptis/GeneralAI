//
//  Simulation.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/8/24.
//

import Foundation

class Simulation {
    
    
    func generateSuperHumanIntelligence() {
        
        // The evaluator computes the fitness level of a "Brain..."
        let evaluator = Evaluator()
        
        // The population of AI brains...
        var population = Population()
        
        // Try to load the results from previous executions... [A1]
        population.load()
        
        // On the first trial, we start with
        // one brain, which contains no wiring.
        if population.brains.count <= 0 {
            population.brains.append(Brain())
        }
        
        // Continuously run...
        while true {
            
            // 1.) Mutate the population members until we reach [count].
            // 2.) Once we reach [count], interbreed the population members.
            // 3.) Generate [count] * 2 offspring, keep the best [count].
            population = growAndEvolve(population: population,
                                       evaluator: evaluator,
                                       count: 10_000)
            
            // Every time, save the result. [A1]
            population.save()
        }
    }
    
    func growAndEvolve(population: Population, evaluator: Evaluator, count: Int) -> Population {
        
        return Population()
    }
    
}
