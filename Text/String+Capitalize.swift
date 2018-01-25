//
//  String+Capitalize.swift
//  Text
//
//  Created by Christian Otkjær on 12/12/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension String
{
    /// Produce a string with the first character in the first word changed to the corresponding uppercase value.
    public var capitalizedFirstWord: String
    {
        guard let range = rangeOfCharacter(from: CharacterSet.alphanumerics) else { return self }
        
        let capitalizedFirstCharacter = self[range].capitalized// substring(with: range).capitalized
        
        return replacingCharacters(in: range, with: capitalizedFirstCharacter)
    }
    
    
    public mutating func capitalizeFirstWord()
    {
        self = self.capitalizedFirstWord
    }
}
