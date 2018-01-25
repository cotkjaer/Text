//
//  String+Random.swift
//  Text
//
//  Created by Christian Otkjær on 16/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension String
{
    /// The type of allowed characters.
    ///
    /// - Numeric:          Allow all numbers from 0 to 9.
    /// - Alphabetic:       Allow all alphabetic characters ignoring case.
    /// - AlphaNumeric:     Allow both numbers and alphabetic characters ignoring case.
    /// - AllCharactersIn:  Allow all characters appearing within the specified String.
    public enum AllowedCharacters {
        case numeric
        case alphabetic
        case alphaNumeric
        case allCharactersIn(String)
    }
    
    /// Create a random String of a given length, containing only characters from a given `Array` of `Characters`.
    ///
    /// - Parameters:
    ///   - length:  The length of the random String to create.
    ///   - allowedCharacters:  The allowed characters in the string
    public init(randomOfLength length: Int, allowedCharacters: [Character])
    {
        //        guard length > 0 else { self.init(); return nil }
        //
        //        guard allowedCharacters.count > 0 else { self.init(); return nil }
        
        let samples = allowedCharacters.sample(size: length) ?? []
        
        self.init(samples)
    }
    
    /// Create a random String of a given length, containing only characters from a given `CharacterSet`.
    ///
    /// - Parameters:
    ///   - length:        The length of the random String to create
    ///   - characterSet:  The character set to pick characters from
    public init(randomOfLength length: Int, withCharactersIn characterSet: CharacterSet)
    {
        self.init(randomOfLength: length, allowedCharacters: characterSet.characters)
    }
    
    /// Create a random String of a given length, containing only characters from a given `CharacterSet`.
    ///
    /// - Parameters:
    ///   - length:     The length of the random String to create
    ///   - string:     The string to pick characters from
    ///   - weighted:   If *true* (default) the characters in `string` are weighted by the number of appearances. If *false* they are equally likely to be picked
    public init(randomOfLength length: Int, withCharactersIn string: String, weighted: Bool = true)
    {
        var characters = string.map({$0})
        
        if !weighted
        {
            characters = Array(Set(characters))
        }
        
        self.init(randomOfLength: length, allowedCharacters: characters)
    }
}
