//
//  Services.swift
//  
//
//  Created by Michael Litman on 4/8/17.
//
//

import UIKit

class Services: NSObject
{
    var sname: String
    var defaultTip: String
    
    public init(sname: String, defaultTip: String)
    {
        self.sname = sname
        self.defaultTip = defaultTip
    }
    
    func getDictionary() -> [NSString: NSString]
    {
        return ["sname":self.sname as NSString,"defaultTip":self.defaultTip as NSString]
    }}
