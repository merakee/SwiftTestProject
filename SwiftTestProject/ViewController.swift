//
//  ViewController.swift
//  SwiftTestProject
//
//  Created by Bijit Halder on 2/24/15.
//  Copyright (c) 2015 Bijit Halder. All rights reserved.
//  For Git fork and Pull Request

import UIKit

class ViewController: UIViewController {
    
    // MARK: - All properties
    let textLabel = UILabel()
    let textButton = UIButton()
    
    // MARK: - Init methods
    //    required init(coder aDecoder: NSCoder) {
    //        // disable storyboard
    //        fatalError("NSCoding not supported")
    //    }
    //
    //    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    convenience override init() {
    //        self.init(nibName: nil, bundle: nil)
    //    }
    
    
    // MARK: - Core UIViewController Methods
    override func loadView() {
        super.loadView()
        
        self.setView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setView(){
        view.backgroundColor = UIColor(white: 0.99, alpha: 1.0)
        setTextButton()
        setTextLabel()
        layoutView()
    }
    
    func setTextLabel(){
        textLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        //textLabel.frame =  CGRectMake(0, 0, 200, 21)
        //textLabel.center = CGPointMake(160, 284)
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = "Swift test"
        textLabel.textColor=UIColor(white: 0.75, alpha: 1.0)
        self.view.addSubview(textLabel)
    }
    
    func setTextButton(){
        textButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        //textButton.frame =  CGRectMake(0, 0, 200, 21)
        //textButton.center = CGPointMake(160, 314)
        textButton.backgroundColor = UIColor.redColor()
        textButton.setTitle("Press Me", forState: .Normal)
        textButton.addTarget(self, action: "textButtonPressed", forControlEvents: .TouchUpInside)
        self.view.addSubview(textButton)
        
    }
    
    func layoutView() {
        
        let viewsDictionary = ["textButton":textButton, "textLabel":textLabel]
        
        // Horizontal
        AppUIManager.horizontallyCenterElement(textLabel, inView: self.view)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[textLabel(200)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[textButton(200)]", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: viewsDictionary))
        // Vertical 
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[textLabel(50)]-20-[textButton(50)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: viewsDictionary))

        
    }
    
    // MARK: - Button Actions
    func textButtonPressed(){
        textLabel.text = PlaceHolderFactory.word() 
//        if(textLabel.text=="Button Pressed"){
//            textLabel.text = "Swift test"
//        }
//        else{
//            textLabel.text = "Button Pressed"
//        }
    }
}