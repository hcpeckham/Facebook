//
//  ImageTransition.swift
//  Facebook
//
//  Created by Hannah Peckham on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = newsFeedViewController.photoImageView.frame
        movingImageView.image = newsFeedViewController.photoImageView.image
        movingImageView.clipsToBounds = newsFeedViewController.photoImageView.clipsToBounds
        movingImageView.contentMode = newsFeedViewController.photoImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        newsFeedViewController.photoImageView.alpha = 0
        
        photoViewController.imageView.alpha = 0
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            
            movingImageView.frame = photoViewController.imageView.frame
            
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                
                //movingImageView.removeFromSuperview()
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        let newsFeedViewController = toViewController as! NewsFeedViewController
        
        let movingImageView = UIImageView()
        movingImageView.frame = photoViewController.imageView.frame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        photoViewController.imageView.alpha = 1
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            
            movingImageView.frame = newsFeedViewController.photoImageView.frame
            
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 0
                newsFeedViewController.photoImageView.alpha = 1
                movingImageView.removeFromSuperview()
                
                self.finish()
        }
    }

    
}
