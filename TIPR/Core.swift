//
//  Core.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit

class Core: NSObject
{
    static var selectedBusiness = "River Club"
    static var selectedPayee: Payee!
    static var selectedService: Services!
    static var payees = [Payee]()
    static var services = [Services]()
    static var payeeTableView: UITableView!
    static var servicesTableView: UITableView!
}
