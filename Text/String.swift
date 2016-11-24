//
//  String.swift
//  Silverback
//
//  Created by Christian Otkjær on 20/04/15.
//  Copyright (c) 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Lorem Ipsum

public extension String
{
    init(withLoremIpsumLengthOfLength length: Int)
    {
        var lorem = "Lorem ipsum dolor sit amet donec ut eros sapien. Tortor risus mauris. Viverra donec augue. Tortor rutrum vestibulum donec in dui. Ac consectetuer aliquet est rhoncus rutrum tellus risus curae consequat ut vestibulum sapien risus elit. Tortor eu donec. Morbi urna non ac imperdiet quisque. Etiam viverra lacinia. Faucibus in placerat. Mauris integer at a erat tempor. Aliquet sed id blandit cursus at vero sit amet venenatis mauris elit in interdum id. Auctor ullamcorper enim nulla curabitur quisque nunc quisque ac. Elit justo auctor. Vulputate scelerisque erat quis elit accumsan. Ac ipsum id. Lorem dolor tristique. Porttitor accumsan velit dui justo enim. Sapien maecenas sed. Proin ac nulla sem nisl nec sit fermentum justo at neque volutpat. Pulvinar tincidunt turpis. Ac nam venenatis. Tristique nulla sollicitudin adipiscing neque posuere vestibulum vitae purus. Mi viverra urna arcu purus metus. Ut neque praesent. Lectus morbi integer eros dignissim nec pharetra pulvinar quis."
        
        while lorem.characters.count < length
        {
            lorem += lorem
        }
        
        self = lorem[0..<length]
    }
}

//MARK: - replace

public extension String
{
    mutating func replace(_ target: String, with optionalReplacement: String?)
    {
        self = self.with(target, replacedBy: optionalReplacement)
    }
    
    
    func with(_ target: String, replacedBy optionalReplacement: String?) -> String
    {
        if let replacement = optionalReplacement
        {
            return self.replacingOccurrences(of: target, with: replacement)
        }
        
        return self
    }
}

public extension String
{
    init<T : UnsignedInteger>(_ v: T, radix: Int, uppercase: Bool = false, paddedToSize: Int)
    {
        self.init(v, radix: radix, uppercase: uppercase)
        
        let padSize = paddedToSize - self.characters.count
        
        if padSize > 0
        {
            self = String(Array<Character>(repeating: "0", count: padSize)) + self
        }
    }
}

public extension String
{
    mutating func trim(forCharactersInSet characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines)
    {
        self = trimmed(forCharactersInSet: characterSet)
    }
    
    func trimmed(forCharactersInSet characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String
    {
        return trimmingCharacters(in: characterSet)
    }
    
    func trimmedAtEnd(forCharactersInSet characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String
    {
        var characters = self.characters
        
        while characterSet.containsCharacter(characters.last)
        {
            characters.removeLast()
        }
        
        return String(characters)
    }
    
    func trimmedAtBegining(forCharactersInSet characterSet: CharacterSet = CharacterSet.whitespacesAndNewlines) -> String
    {
        var characters = self.characters
        
        while characterSet.containsCharacter(characters.first)
        {
            characters.removeFirst()
        }
        
        return String(characters)
    }
    
}

public extension String
{
    var uppercaseFirstLetter: String?
        {
        get
        { if !isEmpty
        { return self[0].uppercased() }; return nil }
    }
}

/// Subscript
public extension String
{
    subscript (i: Int) -> Character
        {
            return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String
        {
            return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String
        {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            
            return self[(startIndex ..< endIndex)]
    }
}

public extension String
{
    func reversed() -> String { return String(Array(characters.reversed())) }
}

public extension String
{
    func sizeWithFont(_ font: UIFont) -> CGSize
    {
        return self.size(attributes: [NSFontAttributeName: font])
    }
}

public extension String
{
    func beginsWith(_ str: String) -> Bool
    {
        if str.isEmpty
        {
            return true
        }
        
        if let range = range(of: str)
        {
            return range.lowerBound == self.startIndex
        }
        
        return false
    }
    
    func endsWith(_ str: String) -> Bool
    {
        return reversed().beginsWith(str.reversed())
    }
}

private let optionsForCaseAndDiacriticInsensitiveCompare : NSString.CompareOptions = [ NSString.CompareOptions.diacriticInsensitive, NSString.CompareOptions.caseInsensitive ]

public extension String
{
    func before(_ rhs: String, options: NSString.CompareOptions = optionsForCaseAndDiacriticInsensitiveCompare) -> Bool
    {
        return compare(rhs, options: optionsForCaseAndDiacriticInsensitiveCompare) == ComparisonResult.orderedAscending
    }
}
