//
//  Array+Sample.swift
//  Text
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

public extension Array
{
    /// Returns a random element from this `Array`.
    ///
    /// - Returns: A random element from the array or `nil` if empty.
    public func sample() -> Element?
    {
        guard !isEmpty else { return nil }

        let index = startIndex.advanced(by: Int(arc4random_uniform(UInt32(count))))
        
        return self[index]
    }
    
    /// Returns a given number of random elements from the `Array`.
    ///
    /// - Parameters:
    ///   - size: The number of random elements wanted.
    /// - Returns: An array with the given number of random elements or `nil` if empty.
    public func sample(size: Int) -> [Element]?
    {
        guard !isEmpty else { return nil }
        
        return (0..<size).flatMap { _ in sample() }
    }
    
}
