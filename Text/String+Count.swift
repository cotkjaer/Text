//
//  String+Count.swift
//  Text
//
//  Created by Christian Otkjær on 24/11/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

// MARK: - Count

extension String
{
    /// Counts the occurences of a given substring
    /// - Parameter substring : The string to search for
    /// - Parameter allowOverlap : Bool flag indicating if a found substring may contain the start of the next match. E.g. if *false* count of "🐼🐼" in "🐼🐼🐼🐼" is 2, if *true* it is 3. Default is *false*
    /// - Parameter options : String compare-options to use while searching
    /// - Parameter locale : Locale to use while searching
    public func count(occurencesOf substring: String, allowOverlap: Bool = false, options: String.CompareOptions = [], locale: Locale? = nil) -> Int
    {
        guard !substring.isEmpty else { return 0 }

        var count = 0
        var rangeToSearch = startIndex..<endIndex
        
        while let foundRange = range(of: substring, options: options, range: rangeToSearch, locale: locale)
        {
            count += 1
            
            if allowOverlap
            {
                rangeToSearch = index(foundRange.lowerBound, offsetBy: 1)..<endIndex
            }
            else
            {
                rangeToSearch = foundRange.upperBound..<endIndex
            }
        }
    
        return count
    }
}
