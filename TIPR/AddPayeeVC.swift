//
//  AddPayeeVC.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddPayeeVC: UIViewController
{
    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var paypalTF: UITextField!
    @IBOutlet weak var lnameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed()
    {
        let newPayee = Payee(fname: fnameTF.text!, lname: lnameTF.text!, paypal: paypalTF.text!)
        self.savePayeeToFirebase(p: newPayee)
    }
    
    func savePayeeToFirebase(p: Payee)
    {
        let ref = FIRDatabase.database().reference().child("businesses").child(Core.selectedBusiness).child("payees").childByAutoId()
        //ref.setValue(p.getDictionary())
        //self.dismiss(animated: true, completion: nil)
        ref.setValue(p.getDictionary(), withCompletionBlock: { (error: Error?, ref: FIRDatabaseReference) in
            if(error == nil)
            {
                Core.payees.append(p)
                Core.payeeTableView.reloadData()
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "There was a problem saving the Payee", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        })
        
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
