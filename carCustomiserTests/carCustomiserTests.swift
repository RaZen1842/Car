//
//  carCustomiserTests.swift
//  carCustomiserTests
//
//  Created by Veturi, Shreyas (HJRM) on 23/01/2024.
//

import XCTest

final class carCustomiserTests: XCTestCase {

    func testNewCarGivesMeCarWithAllAttributes() {
        
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testCarGetStatsAsPerPropertyValues() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
Make: Mazda
Model: MX-5
Top Speed: 125mph
Acceleration (0-60): 7.7s
Handling: 5
            
"""
        
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }

}
