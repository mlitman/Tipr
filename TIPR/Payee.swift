//
//  Payee.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit

class Payee: NSObject
{
    var fname: String
    var lname: String
    var paypal: String
    
    public init(fname: String, lname: String, paypal: String)
    {
        self.fname = fname
        self.lname = lname
        self.paypal = paypal
    }
    
    func getDictionary() -> [NSString: NSString]
    {
        return ["fname":self.fname as NSString,"lname":self.lname as NSString,"paypal":self.paypal as NSString]
    }
}
