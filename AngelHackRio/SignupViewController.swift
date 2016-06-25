//
//  SignupViewController.swift
//  AngelHackRio
//
//  Created by Jean Paul Marinho on 25/06/16.
//  Copyright © 2016 Jean Paul Marinho. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.size.height/2.0
        self.photoImageView.clipsToBounds = true
        self.photoImageView.layer.borderWidth = 3.0;
        self.photoImageView.layer.borderColor = UIColor.white().cgColor
        self.photoImageView.setNeedsDisplay()
        let filterView = UIView(frame: self.topImageView.frame)
        filterView.backgroundColor = UIColor(colorLiteralRed: 132/255.0, green: 220/255.0, blue: 244/255.0, alpha: 0.3)
        self.topImageView.addSubview(filterView)
        self.topImageView.setNeedsDisplay()
    }
}
