//
//  Gridiron.swift
//  Gridiron
//
//  Created by Brent Fordham on 4/10/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation

enum ScoringEvent {
    case touchdown
    case fieldGoal
    case extraPoint
    case twoPointConversion
    case safety
    
    var pointValue: Int {
    
        switch self {
        case .touchdown:
            return 6
        case .fieldGoal:
            return  3
        case .extraPoint:
            return 1
        case .twoPointConversion:
            return 2
        case .safety:
            return 2
        }
    }

}

typealias Team = String

struct Game : Equatable {
    var teamOne = Team()
    var teamTwo = Team()
    var teamOneScores = [ScoringEvent]()
    var teamTwoScores = [ScoringEvent]()
    
    init(newTeamOne: Team, newTeamTwo: Team) {
        self.teamOne = newTeamOne
        self.teamTwo = newTeamTwo
        self.teamOneScores = []
        self.teamTwoScores = []
    }
    
    init(teamOne: Team, teamTwo: Team, teamOneScores: [ScoringEvent], teamTwoScores: [ScoringEvent]) {
        self.teamOne = teamOne
        self.teamTwo = teamTwo
        self.teamOneScores = teamOneScores
        self.teamTwoScores = teamTwoScores
    }
    
    public static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.teamOne == rhs.teamOne && lhs.teamTwo == rhs.teamTwo && lhs.teamOneScores == rhs.teamOneScores && lhs.teamTwoScores == rhs.teamTwoScores
    }
    
    func requestScore(team: Team) -> Int? {
        var teamScore = 0
        switch team {
        case self.teamOne:
            for i in self.teamOneScores {
                teamScore += i.pointValue
            }
            return teamScore
        case self.teamTwo:
            for i in self.teamTwoScores {
                teamScore += i.pointValue
            }
            return teamScore
        default:
            return nil
        }
    }
}

func record(event: ScoringEvent, for team: Team, in game: Game) -> Game? {
    var newGame = game
    switch team {
    case game.teamOne:
        newGame.teamOneScores.append(event)
        return newGame
    case game.teamTwo:
        newGame.teamTwoScores.append(event)
        return newGame
    default:
        return nil
    }
}

var thisGame = Game(newTeamOne: "TeamOne", newTeamTwo: "TeamTwo")

func requestScore(of team: Team, in game: Game) -> Int? {
    var teamScore = 0
    switch team {
    case game.teamOne:
        for i in game.teamOneScores {
            teamScore += i.pointValue
        }
        return teamScore
    case game.teamTwo:
        for i in game.teamTwoScores {
            teamScore += i.pointValue
        }
        return teamScore
    default:
        return nil
    }
}
