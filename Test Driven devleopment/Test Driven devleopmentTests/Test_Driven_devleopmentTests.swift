//
//  Test_Driven_devleopmentTests.swift
//  Test Driven devleopmentTests
//
//  Created by David Santiago Jamaica Galvis on 6/11/25.
//

import XCTest
@testable import Test_Driven_devleopment


class TestPerson: XCTestCase {
    func testFullName() {
        let person = Person(firstName: "John", lastName: "Doe", birthYear: 2000)
        XCTAssertEqual(person.fullName, "John Doe")
    }
    func testAgeCalculation() {
        let person = Person(firstName: "Jane", lastName: "Smith", birthYear: 2000)
        let currentYear = Calendar.current.component(.year, from: Date())
        let expectedAge = currentYear - 2000
        XCTAssertEqual(person.age, expectedAge)
    }
    func testAdult() {
        let person = Person(firstName: "Tom", lastName: "Jones", birthYear: 1990)
        XCTAssertTrue(person.isAdult)
    }
    
    func testMinor() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let minorYear = currentYear - 10
        let person = Person(firstName: "Kid", lastName: "Young", birthYear: minorYear)
        XCTAssertFalse(person.isAdult)
    }
    
    class Person {
        let firstName: String
        let lastName: String
        let birthYear: Int
        
        init(firstName: String, lastName: String, birthYear: Int) {
            self.firstName = firstName
            self.lastName = lastName
            self.birthYear = birthYear
        }
        
        var fullName: String {
            return firstName + " " + lastName
        }
        
        var age: Int {
            let currentYear = Calendar.current.component(.year, from: Date())
            return currentYear - birthYear
        }
        var isAdult: Bool {
            return age >= 18
        }
    }
}
