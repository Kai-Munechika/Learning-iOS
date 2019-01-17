//
//  ViewController.swift
//  VisualFormatLanguage
//
//  Created by Kai Munechika on 1/17/19.
//  Copyright © 2019 Kai Munechika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We also set the property translatesAutoresizingMaskIntoConstraints to be false on each label, because by default iOS generates Auto Layout constraints for you based on a view's size and position. We'll be doing it by hand, so we need to disable this feature.
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()        
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]

        for label in viewsDictionary.keys {
            // NSLayoutConstraint.constraints(withVisualFormat:) is the Auto Layout method that converts VFL into an array of constraints. It accepts lots of parameters, but the important ones are the first and last.
            // "H:|[label1]|" means "horizontally, I want my label1 to go edge to edge in my view.
            
            // view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
        }
        
        let metrics = ["labelHeight": 88]

         /* The - symbol means "space". It's 10 points by default, but you can customize it.
         Note that our vertical VFL doesn't have a pipe at the end, so we're not forcing the last label to stretch all the way to the edge of our view. This will leave whitespace after the last label, which is what we want right now.
         each label will have a height of 88 and our last label must be at least 10 points away from the bottom of the view controller's view
         Note that when specifying the size of a space, you need to use the - before and after the size: a simple space, -, becomes -(>=10)-
         So, we're going to make the label height have priority 999 (i.e., very important, but not required). But we're also going to make one other change, which is to tell Auto Layout that we want all the labels to have the same height.
         */

        //        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))

        // It's the @999 that assigns priority to a given constraint, and using (label1) for the sizes of the other labels is what tells Auto Layout to make them the same height.

        //: VFL commented out to use anchors equivalently
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            
            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                label.heightAnchor.constraint(equalTo: previous.heightAnchor).isActive = true
            } else {
                let heightConstraint = label.heightAnchor.constraint(equalToConstant: 88) 
                heightConstraint.priority = UILayoutPriority.init(999)
                heightConstraint.isActive = true
            }
            
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
        
        label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        label5.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -10).isActive = true

    }


}

