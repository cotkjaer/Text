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
    /**
     Counts the occurrences of a given substring by calling Strings `range(of:options:range:locale:)` method multiple times.
     
     - Parameter substring : The string to search for, optional for convenience
     
     - Parameter allowOverlap : Bool flag indicating whether the matched substrings may overlap. Count of "🐼🐼" in "🐼🐼🐼🐼" is 2 if allowOverlap is **false**, and 3 if it is **true**

     - Parameter options : String compare-options to use while counting
     
     - Parameter range : An optional range to limit the search, default is **nil**, meaning search whole string
     
     - Parameter locale : Locale to use while counting
     
     - Returns : The number of occurrences of the substring in this String
     */
    public func count(
        occurrencesOf substring: String?,
        allowOverlap: Bool = false,
        options: String.CompareOptions = [],
        range searchRange: Range<String.Index>? = nil,
        locale: Locale? = nil) -> Int
    {
        guard let substring = substring, !substring.isEmpty else { return 0 }
        
        var count = 0
        
        let searchRange = searchRange ?? startIndex..<endIndex
        
        var searchStartIndex = searchRange.lowerBound
        let searchEndIndex = searchRange.upperBound
        
        while let rangeFound = range(of: substring, options: options, range: searchStartIndex..<searchEndIndex, locale: locale)
        {
            count += 1
            
            if allowOverlap
            {
                searchStartIndex = index(rangeFound.lowerBound, offsetBy: 1)
            }
            else
            {
                searchStartIndex = rangeFound.upperBound
            }
        }
        
        return count
    }
}
