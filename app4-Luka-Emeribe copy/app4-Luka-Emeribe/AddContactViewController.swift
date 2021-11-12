//
//  AddContactViewController.swift
//  Luka-Emeribe
//

import Foundation
import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var Company: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var PhoneNumber: UITextField!

    weak var delegate: AddContactDelegate?
    
    override func viewDidLoad() {
         super.viewDidLoad()
     }
    
    func createNewContact() -> Contact?{
        if(FirstName.text == nil || LastName.text == nil || Company.text == nil ||  Email.text == nil || PhoneNumber.text == nil) {
                  return  nil
                }
                
                else {
                    return Contact(firstName: FirstName.text! ,lastName: LastName.text!,company:Company.text! , email: Email.text!, phoneNumber: PhoneNumber.text!, image: nil)
                }
    }
    
    @IBAction func didTapCancelButton(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveButton(sender: UIBarButtonItem) {
        if createNewContact() != nil {
                    self.delegate?.didCreate(createNewContact()!)
        }
        dump(createNewContact())
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}
