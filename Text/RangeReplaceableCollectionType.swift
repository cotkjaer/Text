//
//  RangeReplaceableCollectionType.swift
//  Silverback
//
//  Created by Christian Otkjær on 15/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

public extension RangeReplaceableCollection
{
    /**
     Prepends an element to the front of `self` i.e. inserts it at `startIndex`.
     
     - parameter element: Element to prepend
     
     - returns: element iff it was prepended, nil otherwise
     */
    mutating func prepend(_ element: Iterator.Element?) -> Iterator.Element?
    {
        return insert(element, atIndex: startIndex)
    }

    /**
     Appends a new element to the end of `self` i.e. inserts it at `endIndex`.
     
     - parameter element: Element to append
     
     - returns: element iff it was appended, nil otherwise
     */
    mutating func append(_ element: Iterator.Element?) -> Iterator.Element?
    {
        return insert(element, atIndex: endIndex)
    }
    
    /**
     Insert an optional element at `index`
     - Note: Invalidates all indices with respect to self.
     - parameter element: Element to insert
     - parameter index: index at which to insert element, must be <= `self.count`
     - Complexity: O(`self.count`)
     - Returns: the inserted element iff it was inserted
     */
    mutating func insert(_ element: Iterator.Element?, atIndex index: Self.Index) -> Iterator.Element?
    {
        if let element = element
        {
            insert(element, at: index)
        }
    
        return element
    }
    
    /**
     The collection's last valid index, or nil if the collection is empty.
     a non-nil lastIndex is a valid argument to subscript, and is always reachable from startIndex by zero or more applications of successor()
     
     - Complexity: O(1)
     */
    public var lastIndex : Index? { return isEmpty ?  nil : self.index(endIndex, offsetBy: -1) }
}
