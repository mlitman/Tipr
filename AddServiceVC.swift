//
//  AddServiceVC.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddServiceVC: UIViewController
{
    @IBOutlet weak var snameTF: UITextField!
    @IBOutlet weak var defaultTip: UITextField!
      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed()
    {
        let newService = Services(sname: snameTF.text!, defaultTip: defaultTip.text!)
        self.saveServiceToFirebase(p: newService)
    }
    
    func saveServiceToFirebase(p: Services)
    {
        let ref = FIRDatabase.database().reference().child("businesses").child(Core.selectedBusiness).child("services").childByAutoId()
        
        ref.setValue(p.getDictionary(), withCompletionBlock: { (error: Error?, ref: FIRDatabaseReference) in
            if(error == nil)
            {
                Core.servicesTableView.reloadData()
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: "There was a problem saving the Service", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        })
        
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
