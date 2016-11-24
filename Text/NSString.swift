//
//  NSString.swift
//  Silverback
//
//  Created by Christian Otkjær on 14/12/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

extension NSString
{
    public convenience init?(optionalString : String?)
    {
        guard let string = optionalString else { self.init(); return nil }
        
        self.init(string: string)
    }
}
