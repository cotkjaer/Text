//
//  NSRange.swift
//  Silverback
//
//  Created by Christian Otkjær on 02/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

// MARK: - String

extension NSRange
{
    public func rangeIn(string: String) -> Range<String.Index>
    {
        let startIndex = string.characters.index(string.startIndex, offsetBy: location)
        let endIndex = string.index(startIndex, offsetBy: length)
        return startIndex..<endIndex
    }
}
