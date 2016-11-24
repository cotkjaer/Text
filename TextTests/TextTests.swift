//
//  TextTests.swift
//  TextTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Text

class TextTests: XCTestCase
{
    func test_substring()
    {
        //          012345678901
        let text = "Hello Tests!"
        
        XCTAssertEqual(text.substring(from: 3, to: 7), "lo T")
        XCTAssertEqual(text.substring(from: 1, to: nil), "ello Tests!")
        XCTAssertEqual(text.substring(from: nil, to: 2), "He")
        XCTAssertEqual(text.substring(from: 6), "Tests!")
        XCTAssertEqual(text.substring(to: 4), "Hell")
        
        
        XCTAssertEqual(text.substring(from: 6, length: 5), "Tests")
        XCTAssertEqual(text.substring(from: 6, length: 10), "Tests!")
        XCTAssertEqual(text.substring(length: 5, to: 1), "H")
        XCTAssertEqual(text.substring(length: 3, to: 12), "ts!")
    }
    
    let lowercaseCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
    let uppercaseCharacterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let digitCharacterSet = CharacterSet(charactersIn: "0123456789")
    let punctuationCharacterSet = CharacterSet(charactersIn: ".,;:-_!?")
    let symbolCharacterSet = CharacterSet(charactersIn: "$§€%&/()[]{}=+*@")
    
    func test_CharacterSet()
    {
        let characters = lowercaseCharacterSet.characters
        
        print(characters)
        
        XCTAssertEqual(characters.count, 26)
    }
    
    func test_character_set_characters()
    {
        let cs = CharacterSet.whitespacesAndNewlines
        
        self.measure
            {
                let characters = cs.characters
                
                XCTAssertTrue(characters.count > 0)
        }
    }
    
    func test_random_string()
    {
        
        XCTAssertEqual(10, String(randomOfLength: 10, withCharactersIn: punctuationCharacterSet).characters.count)
        XCTAssertEqual(1, String(randomOfLength: 1, withCharactersIn: uppercaseCharacterSet).characters.count)

        let xyzs = String(randomOfLength: 3000, allowedCharacters: ["x", "y", "z"])
        XCTAssertEqual(3000, xyzs.characters.count)
        XCTAssert(xyzs.contains("x"))
        XCTAssert(xyzs.contains("y"))
        XCTAssert(xyzs.contains("z"))
        
        let abcs = String(randomOfLength: 3000, withCharactersIn: "aaabc", weighted: true)
        XCTAssertEqual(3000, abcs.characters.count)
        XCTAssert(abcs.contains("a"))
        XCTAssert(abcs.contains("b"))
        XCTAssert(abcs.contains("c"))
        
        XCTAssertGreaterThan(abcs.count(occurencesOf: "a"), abcs.count(occurencesOf: "b"))
        XCTAssertGreaterThan(abcs.count(occurencesOf: "a"), abcs.count(occurencesOf: "c"))
    }
    
    func test_count()
    {
        let es = " eeee  "
        
        XCTAssertEqual(es.count(occurencesOf: "e"), 4)
        XCTAssertEqual(es.count(occurencesOf: "ee"), 2)
        XCTAssertEqual(es.count(occurencesOf: "eee"), 1)
        XCTAssertEqual(es.count(occurencesOf: "ee", allowOverlap: true), 3)
        XCTAssertEqual(es.count(occurencesOf: "eee", allowOverlap: true), 2)

        
        
        let swiftPraise = "Swift is a swift way to write the swiftiest code"
        
        XCTAssertEqual(swiftPraise.count(occurencesOf: "Swift"), 1)
        XCTAssertEqual(swiftPraise.count(occurencesOf: "swift"), 2)
        XCTAssertEqual(swiftPraise.count(occurencesOf: "swift", options: .caseInsensitive), 3)
        
        XCTAssertEqual(swiftPraise.count(occurencesOf: "🐼"), 0)
        XCTAssertEqual(swiftPraise.count(occurencesOf: ""), 0)
        XCTAssertEqual(swiftPraise.count(occurencesOf: "  "), 0)
        
        let animals = "🐼🐭🐱🐼🐼🐼🐶🐰🐼🐼🐨🐼🐼"
        XCTAssertEqual(animals.count(occurencesOf: "🐰"), 1)
        XCTAssertEqual(animals.count(occurencesOf: "🐼"), 8)
        XCTAssertEqual(animals.count(occurencesOf: "🐼🐼"), 3)
        XCTAssertEqual(animals.count(occurencesOf: "🐼🐼", allowOverlap: true), 4)
        
        let accents = "eéèÈÉE"
        XCTAssertEqual(accents.count(occurencesOf: "e"), 1)
        XCTAssertEqual(accents.count(occurencesOf: "E", options: .diacriticInsensitive), 3)
        XCTAssertEqual(accents.count(occurencesOf: "eE", options: .diacriticInsensitive), 1)
        XCTAssertEqual(accents.count(occurencesOf: "È", options: [.caseInsensitive,.diacriticInsensitive]), 6)
        XCTAssertEqual(accents.count(occurencesOf: "Èe", options: [.caseInsensitive,.diacriticInsensitive]), 3)
    }
}
