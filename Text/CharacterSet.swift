//
//  NSCharacterSet.swift
//  Silverback
//
//  Created by Christian Otkjær on 01/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

private var charactersBySet = Dictionary<CharacterSet, [Character]>()

extension CharacterSet
{
    public func containsCharacter(_ character: Character?) -> Bool
    {
        if let unichar = character?.utf16
        {
            return contains(UnicodeScalar(unichar)!)
        }
        
        return false
    }
    
    public func isLongMember(c : UTF32Char) -> Bool
    {
        return CFCharacterSetIsLongCharacterMember(self as CFCharacterSet!, c)
    }
    
    public func sample(length: Int) -> [Character]
    {
        return characters.sample(size: length) ?? []
    }
    
    public var characters : [Character]
    {
        if let characters = charactersBySet[self]
        {
            return characters
        }
        
        var array = [Character]()
        
        for plane: UInt8 in 0...16
        {
            if hasMember(inPlane: plane)
            {
                for c in UTF32Char(plane) << 16 ..< UTF32Char(plane+1) << 16
                {
                    if isLongMember(c: c)
                    {
                        //                        var c1 = c.littleEndian
                        
                        let x = Character(UnicodeScalar(c.littleEndian)!)
                        
                        array.append(x)
                        
                        //                        if let s = String(bytesNoCopy: &c1, length: 4, encoding: String.Encoding.utf32LittleEndian, freeWhenDone: true)
                        //                        {
                        //                            if let c = s.characters.first
                        //                            {
                        //                                array.append(c)
                        //                            }
                        //                        }
                    }
                }
                
            }
        }
        
        charactersBySet[self] = array
        
        return array
    }
}
