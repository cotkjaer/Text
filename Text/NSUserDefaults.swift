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

extension NSUserDefaults
{
    public func setText(optionalText: String?, forKey key: String)
    {
        if let text = optionalText
        {
            setObject(text, forKey: key)
        }
        else
        {
            removeObjectForKey(key)
        }
    }
    
    public func textForKey(key: String, defaultString: String = "") -> String
    {
        return (objectForKey(key) as? String) ?? defaultString
    }
}
