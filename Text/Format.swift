//
//  Format.swift
//  Math
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public extension Int
{
    public func format(_ format: String = "") -> String
    {
        return String(format: "%\(format)d", self)
    }
}

// MARK: - Default

public extension FloatingPoint where Self : CVarArg
{
    func format(_ format: String = "") -> String
    {
        return String(format: "%\(format)f", self)
    }
}
