//
//  NSUserDefaults.swift
//  Silverback
//
//  Created by Christian Otkjær on 05/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Text

extension UserDefaults
{
    public func hasText(forKey key: String) -> Bool
    {
        return (object(forKey: key) as? String) != nil
    }
    
    public func setText(_ optionalText: String?, forKey key: String)
    {
        if let text = optionalText
        {
            set(text, forKey: key)
        }
        else
        {
            removeObject(forKey: key)
        }
    }
    
    public func textForKey(_ key: String, defaultString: String = "") -> String
    {
        return (object(forKey: key) as? String) ?? defaultString
    }
}
