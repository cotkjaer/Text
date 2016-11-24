//
//  NSTextAlignment.swift
//  Silverback
//
//  Created by Christian Otkjær on 27/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CustomDebugStringConvertible

extension NSTextAlignment : CustomDebugStringConvertible, CustomStringConvertible
{
    public var debugDescription : String {
    
        switch self
        {
        case .right: return "RightTextAlignment"
        case .left: return "LeftTextAlignment"
        case .center: return "CenterTextAlignment"
        case .natural: return "NaturalTextAlignment"
        case .justified: return "JustifiedTextAlignment"
        }
    }

    public var description : String {
        
        switch self
        {
        case .right: return "Right"
        case .left: return "Left"
        case .center: return "Center"
        case .natural: return "Natural"
        case .justified: return "Justified"
        }
    }
}
