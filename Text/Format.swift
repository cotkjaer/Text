//
//  Format.swift
//  Math
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public extension Int
{
    public func format(format: String = "") -> String
    {
        return String(format: "%\(format)d", self)
    }
}

// MARK: - Default

public extension FloatingPointType where Self : CVarArgType
{
    func format(format: String = "") -> String
    {
        return String(format: "%\(format)f", self)
    }
}
