//
//  Screen3VCEdit.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit
import FirebaseDatabase
class SendTipVC: UIViewController {

    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var lnameTF: UITextField!
    @IBOutlet weak var defaultTipTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.fnameTF.text = Core.selectedPayee.fname
        self.lnameTF.text = Core.selectedPayee.lname
        
        NotificationCenter.default.addObserver(self, selector: #selector(serviceSelectedHandler), name:  NSNotification.Name(rawValue: "Service Selected"), object: nil)
        //self.defaultTipTF.text = Core.selectedService.defaultTip
    }

    func serviceSelectedHandler()
    {
        self.defaultTipTF.text = Core.selectedService.defaultTip
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
