//
//  serviceList.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit
import FirebaseDatabase
class serviceList: UIViewController {
 
    
    @IBOutlet weak var snameTF: UITextField!
    @IBOutlet weak var defaultTipTF: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed()
    {
        let newService = Services(sname: snameTF.text!, defaultTip: defaultTipTF.text!)
        self.saveServiceToFirebase(p: newService)
    }
    func saveServiceToFirebase(p: Services)
    {
        let ref = FIRDatabase.database().reference().child("businesses").child(Core.selectedBusiness).child("payees").childByAutoId()
        //ref.setValue(p.getDictionary())
        //self.dismiss(animated: true, completion: nil)
        ref.setValue(p.getDictionary(), withCompletionBlock: { (error: Error?, ref: FIRDatabaseReference) in
            if(error == nil)
            {
                Core.servicesTableView.reloadData()
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Core.services.count
    
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let service = Core.services[indexPath.row]
        cell.textLabel?.text = "\(service.sname) \(service.defaultTip)"
        return cell
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
