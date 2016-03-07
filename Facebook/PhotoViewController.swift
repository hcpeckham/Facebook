//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Hannah Peckham on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate  {

    var image: UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionButtonView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        scrollView.delegate = self
        
        scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Scroll View Events
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.doneButton.alpha = 0
            self.actionButtonView.alpha = 0
            self.imageView.alpha = 0
        }
    }

  
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
         if scrollView.contentOffset.y < -80 {
            dismissViewControllerAnimated(true, completion: nil)
            
        } else if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 80 {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.doneButton.alpha = 1
                self.actionButtonView.alpha = 1
                self.imageView.alpha = 1
          })
            
        }
    }
    

    @IBAction func didPressDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
