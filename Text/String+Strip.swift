//
//  String+Strip.swift
//  Text
//
//  Created by Christian Otkjær on 16/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension String
{
    /// This string stripped by all leading and trailing whitespace characters.
    public func stripped() -> String
    {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Strips this string from both ends, removing all characters contained in the parameter (default is whitespace and newline characters).
    public mutating func strip(charactersIn characters: CharacterSet = CharacterSet.whitespacesAndNewlines)
    {
        self = trimmingCharacters(in: characters)
    }
 }
