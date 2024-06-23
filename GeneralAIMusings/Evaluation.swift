//
//  Evaluation.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

enum EvaluationRank {
    case low
    case medium
    case high
}

enum Evaluation {
    case useless(EvaluationRank)
    case feasible(EvaluationRank)
    case correct(EvaluationRank)
}

extension Evaluation: Comparable {
    static func < (lhs: Evaluation, rhs: Evaluation) -> Bool {
        switch lhs {
        case .useless(let evaluationRankLHS):
            switch rhs {
            case .useless(let evaluationRankRHS):
                return evaluationRankLHS < evaluationRankRHS
            case .feasible:
                return false
            case .correct:
                return false
            }
        case .feasible(let evaluationRankLHS):
            switch rhs {
            case .useless:
                return false
            case .feasible(let evaluationRankRHS):
                return evaluationRankLHS < evaluationRankRHS
            case .correct:
                return true
            }
        case .correct(let evaluationRankLHS):
            switch rhs {
            case .useless:
                return false
            case .feasible:
                return false
            case .correct(let evaluationRankRHS):
                return evaluationRankLHS < evaluationRankRHS
            }
        }
    }
}

extension EvaluationRank: Comparable {
    static func < (lhs: EvaluationRank, rhs: EvaluationRank) -> Bool {
        switch lhs {
        case .low:
            switch rhs {
            case .low:
                return false
            case .medium:
                return true
            case .high:
                return true
            }
        case .medium:
            switch rhs {
            case .low:
                return false
            case .medium:
                return false
            case .high:
                return true
            }
        case .high:
            switch rhs {
            case .low:
                return false
            case .medium:
                return false
            case .high:
                return false
            }
        }
    }
}
