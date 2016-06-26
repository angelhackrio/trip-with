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
    @IBOutlet weak var tableView: UITableView!
    var signupFieldsArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "SignupTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let path = Bundle.main().pathForResource("SignupFields", ofType: "plist")
        self.signupFieldsArray = NSArray(contentsOfFile: path!) as! [String]
        self.tableView.tableFooterView = UIView()
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



extension SignupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.signupFieldsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SignupTableViewCell
        let field = signupFieldsArray[indexPath.row]
        let typeImage: UIImage? = UIImage(named: field)
        if typeImage == nil {
            let typeLabel = UILabel(frame: CGRect(x: 5, y: 6, width: 100, height: 30))
            typeLabel.text = field
            cell.addSubview(typeLabel)
        }
        else {
            cell.typeImageView.image = typeImage
        }
        let value = User.sharedInstance.value(forKey: field.lowercased())
        switch value {
        case is Int:
            let textField = UITextField(frame: CGRect(x: 50, y: 6, width: 175, height: 30))
            textField.text = "\(value as! Int) years old"
            cell.addSubview(textField)
        case is String:
            let textField = UITextField(frame: CGRect(x: 50, y: 6, width: 175, height: 30))
            textField.text = (value as! String)
            cell.addSubview(textField)
        case is [String]:
            let textField = UITextField(frame: CGRect(x: 50, y: 6, width: 260, height: 30))
            var valueText = ""
            for element in value as! [String] {
                valueText = valueText + "\(element),"
            }
            textField.text = valueText
            cell.addSubview(textField)
        default:
            break
        }
        return cell
    }
}



extension SignupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 85
        }
        else {
            return 44
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//        
//    }
}
