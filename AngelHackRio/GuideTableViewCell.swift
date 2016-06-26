//
//  GuideTableViewCell.swift
//  AngelHackRio
//
//  Created by Jean Paul Marinho on 25/06/16.
//  Copyright © 2016 Jean Paul Marinho. All rights reserved.
//

import UIKit

class GuideTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var graphicView: GraphicView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.size.height/2.0
        self.photoImageView.clipsToBounds = true
        self.photoImageView.setNeedsDisplay()
    }
}
