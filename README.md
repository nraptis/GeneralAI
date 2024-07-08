# Generalized AI

![alt text](https://raw.githubusercontent.com/nraptis/GeneralAI/main/research.png)</br></br>
</br>
Anyone is allowed to contribute to this. I will review any pull request until April 17, 2028, at which time I will re-evaluate this policy.</br></br>

The idea is this:</br></br>
1.) A generalized AI is created through a Darwinian algorithm.</br>
2.) A generalized AI constantly improves itself.</br>
3.) A generalized AI is initially seeded by a human-directed fitness function.</br>
4.) A generalized AI will eventually be evolved from a "population" of AI's (we call them "Brain").</br>
5.) A generalized AI can be built from simple constituent parts.</br></br></br>
The shell of the program is remarkably simple. This is the exact shell, it doesn't need to change.</br>
```
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
```
</br></br>
