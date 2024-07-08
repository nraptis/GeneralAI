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
    
    // Continuously run...
    while true {
        
        // 1.) Mutate the population members until we reach [count].
        
        population = growAndEvolve_Step1(population: population,
                                         count: 10_000)
        
        // 2.) Interbreed the population members until we reach [count] * 2.
        population = growAndEvolve_Step2(population: population,
                                         count: 10_000)
        
        // 3.) Evaluate the fitness of the breeding population and keep best [count].
        population = growAndEvolve_Step3(population: population,
                                         evaluator: evaluator,
                                         count: 10_000)
        
        // Every time, save the result. [A1]
        population.save()
    }
}
    
func growAndEvolve_Step1(population: Population, count: Int) -> Population {
    
    // Create the growing population.
    var growingPopulation = Population()
    
    // Add all of the original brains to the test population.
    population.brains.forEach { brain in
        growingPopulation.brains.append(brain.clone())
    }
    
    // 1.) Mutate the population members until we reach [count].
    while growingPopulation.brains.count < count {
        let anyBrain: Brain
        if let randomBrain = population.brains.randomElement() {
            // Choose a random brain from the seed population.
            anyBrain = randomBrain.clone()
        } else {
            // We have no brains, start with a fresh one...
            anyBrain = Brain()
        }
        
        // Mutate the internal wiring of the brain...
        let mutatedBrain = anyBrain.mutate()
        growingPopulation.brains.append(mutatedBrain)
    }
    
    return growingPopulation
}
    
func growAndEvolve_Step2(population: Population, count: Int) -> Population {
    
    // Create the breeding population. This can grow beyond [count]...
    var breedingPopulation = Population()
    
    // Add all of the original brains to the breeding population.
    population.brains.forEach { brain in
        breedingPopulation.brains.append(brain.clone())
    }
    
    // 2.) Interbreed the population members until we reach [count] * 2.
    while breedingPopulation.brains.count < (count * 2) {
        
        let brain1 = population.brains.randomElement()!
        let brain2 = population.brains.randomElement()!
        
        let combinedBrain = brain1.breed(mate: brain2)
        breedingPopulation.brains.append(combinedBrain)
    }
    
    return breedingPopulation
}
    
func growAndEvolve_Step3(population: Population, evaluator: Evaluator, count: Int) -> Population {
    
    // Create the prime population. We will keep the best [count]...
    var primePopulation = Population()
    
    // Evaluate each brain using the fitness function...
    var brainAndEvaluations = [(Brain, Evaluation)]()
    population.brains.forEach { brain in
        let evaluation = evaluator.evaluate(brain: brain)
        brainAndEvaluations.append((brain, evaluation))
    }
    
    // Sort by evaluation...
    brainAndEvaluations.sort {
        $0.1 < $1.1
    }
    
    // Add the first [count] to the prime population...
    
    var loopIndex = 0
    while loopIndex < count && loopIndex < brainAndEvaluations.count {
        let brainAndEvaluation = brainAndEvaluations[loopIndex]
        let brain = brainAndEvaluation.0.clone()
        
        primePopulation.brains.append(brain)
        
        loopIndex += 1
    }
    
    return primePopulation
}
    
}
