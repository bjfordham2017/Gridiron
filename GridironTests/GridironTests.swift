//
//  GridironTests.swift
//  GridironTests
//
//  Created by Brent Fordham on 4/10/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import XCTest
@testable import Gridiron

class GridironTests: XCTestCase {
   
    func testNewGameInit() {
        let result = Game(newTeamOne: "A Football Team", newTeamTwo: "Another Football Team")
        let expected = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [], teamTwoScores: [])
        XCTAssertEqual(result, expected)
    }
    
    func testRecord() {
        let currentGame = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [], teamTwoScores: [])
        let result = record(event: .touchdown, for: "A Football Team", in: currentGame)
        let expected = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [.touchdown], teamTwoScores: [])
        XCTAssertEqual(result, expected)
    }
    
    func testRecord1() {
        let currentGame = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [], teamTwoScores: [])
        let result = record(event: .fieldGoal, for: "Another Football Team", in: currentGame)
        let expected = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [], teamTwoScores: [.fieldGoal])
        XCTAssertEqual(result, expected)

    }
    
    func testRecord2() {
        let currentGame = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [], teamTwoScores: [])
        let result = record(event: .touchdown, for: "A Third Football Team?", in: currentGame)
        let expected: Game? = nil
        XCTAssertEqual(result, expected)
    }
    
    func testRequestScore() {
        let currentGame = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [.touchdown, .fieldGoal, .touchdown, .extraPoint, .fieldGoal], teamTwoScores: [.fieldGoal, .fieldGoal, .fieldGoal, .touchdown, .safety])
        let result = requestScore(of: "A Football Team", in: currentGame)
        let expected = 19
        XCTAssertEqual(result, expected)
    }
    
    func testRequestScoreMethod() {
        let currentGame = Game(teamOne: "A Football Team", teamTwo: "Another Football Team", teamOneScores: [.touchdown, .fieldGoal, .touchdown, .extraPoint, .fieldGoal], teamTwoScores: [.fieldGoal, .fieldGoal, .fieldGoal, .touchdown, .safety])
        let result = currentGame.requestScore(team: "A Football Team")
        let expected = 19
        XCTAssertEqual(result, expected)

    }
    
}
