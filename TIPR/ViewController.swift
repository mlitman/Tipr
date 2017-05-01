//
//  ViewController.swift
//  TIPR
//
//  Created by Michael Litman on 4/8/17.
//  Copyright © 2017 thinkful. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    
    //let ref = FirebaseDatabase(url: "https://tipr-9e7b9.firebaseio.com/")
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func action(_ sender: UIButton)
    {
        if username.text != "" && password.text != ""
        {
            if segmentControl.selectedSegmentIndex == 0 //Login User
            {
                FIRAuth.auth()?.signIn(withEmail: username.text!, password: password.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //Sign in successful
                        print("SUCCESS")
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                        }
                    }
                })
            }
            else // Sign up user
            {
                FIRAuth.auth()?.createUser(withEmail: username.text!, password: password.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //Sign up successful
                        print("SUCCESS")
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("ERROR")
                    }
                }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

