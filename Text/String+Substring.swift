//
//  String+Substring.swift
//  Text
//
//  Created by Christian Otkjær on 24/11/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

public extension String
{
    func substring(from: Int, to: Int) -> String
    {
        let fromIndex = index(startIndex, offsetBy: from)
        let toIndex = index(startIndex, offsetBy: to)
        
        guard fromIndex >= startIndex, fromIndex < toIndex, toIndex <= endIndex else { return "" }
        
        return String(self[fromIndex ..< toIndex])
    }

    public func substring(from: Int?, to: Int?) -> String
    {
        return substring(from: from ?? 0, to: to ?? count)
    }
    
    func substring(from: Int) -> String
    {
        return substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String
    {
        return substring(from: nil, to: to)
    }
    
    func substring(from: Int?, length: Int) -> String
    {
        guard length > 0 else { return "" }

        let start = from ?? 0
        
        let end = min(count, max(0, start) + length)
        
        return substring(from: start, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String
    {
        guard let end = to, end > 0, length > 0 else { return "" }
        
        let start = max(0, end - length)
        
        return substring(from: start, to: to)
    }
}
