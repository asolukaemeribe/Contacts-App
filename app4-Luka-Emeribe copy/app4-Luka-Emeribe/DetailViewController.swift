//
//  DetailViewController.swift
//  Luka-Emeribe
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var nameDVC = ""
    var companyDVC = ""
    var emailDVC = ""
    var phoneNumberDVC = ""
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var company: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        company.text = companyDVC
        phoneNumber.text = phoneNumberDVC
        name.text = nameDVC
        email.text = emailDVC
    }
}
