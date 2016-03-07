//
//  LoginViewController.swift
//  Facebook
//
//  Created by Hannah Peckham on 2/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var initalYlogo: CGFloat!
    var initalYlogoOffset: CGFloat!
    var initalYfield: CGFloat!
    var initalYfieldOffset: CGFloat!
    var initalYlabel: CGFloat!
    var initalYlabelOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initalYlogoOffset = -30
        initalYlogo = logoImageView.frame.origin.y
        initalYfieldOffset = -50
        initalYfield = fieldParentView.frame.origin.y
        initalYlabelOffset = -190
        initalYlabel = labelParentView.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        logoImageView.frame.origin.y = initalYlogo + initalYlogoOffset
        fieldParentView.frame.origin.y = initalYfield + initalYfieldOffset
        labelParentView.frame.origin.y = initalYlabel + initalYlabelOffset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        logoImageView.frame.origin.y = initalYlogo - initalYlogoOffset
        fieldParentView.frame.origin.y = initalYfield - initalYfieldOffset
        labelParentView.frame.origin.y = initalYlabel - initalYlabelOffset
        
    }

    @IBAction func didTapLoginButton(sender: AnyObject) {
        self.loginActivityIndicator.startAnimating()
        loginButton.selected = true
        delay(2) { () -> () in
            self.loginActivityIndicator.stopAnimating()
            self.loginButton.selected = false

            if self.emailTextField.text == "asdf" && self.passwordTextField.text == "asdf" {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                })
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: { (action) -> Void in
                })
            }
        }
        
    }

    @IBAction func editingChanged(sender: AnyObject) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled = false
        
        } else {
            loginButton.enabled = true
        }
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
