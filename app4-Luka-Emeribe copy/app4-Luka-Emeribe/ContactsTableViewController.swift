//
//  ContactsTableViewController.swift
//  Luka-Emeribe
//

import Foundation
import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsArr.append(Contact(firstName: "Example", lastName: "Code1", company: "Company1", email: "code1@gmail.com", phoneNumber: "000-000-0000", image: nil))
        
        contactsArr.append(Contact(firstName: "Example", lastName: "Code2", company: "Company2", email: "code2@yahoo.com", phoneNumber: "111-111-1111", image: nil))
    }
    
    var nameCTVC = ""
    var emailCTVC = ""
    var phoneNumberCTVC = ""
    var companyCTVC = ""
    var contactsArr = [Contact]()
    
    func didCreate(_ contact: Contact) {
          let vc = AddContactViewController()
            vc.dismiss(animated: true, completion: nil)
            navigationController?.dismiss(animated: true, completion: nil)
            contactsArr.append(contact)
            contactsArr = contactsArr.sorted(by: { $0.lastName < $1.lastName })
            self.tableView.reloadData()
        }

    
    // Basic table view methods
        override func numberOfSections(in tableView: UITableView) -> Int {
            // TODO: How many sections? (Hint: we have 1 section and x rows)
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // TODO: How many rows in our section?
            
            return contactsArr.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
           
            if let label = cell.viewWithTag(3) as?  UILabel { label.text = "\(contactsArr[indexPath.row].firstName), \(contactsArr[indexPath.row].lastName)"}
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50.0
        }
        
        
        // Handle user interaction
     

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            _ = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            
            nameCTVC = "\(contactsArr[indexPath.row].firstName), \(contactsArr[indexPath.row].lastName)"
            
            emailCTVC =  contactsArr[indexPath.row].email
            
            companyCTVC = contactsArr[indexPath.row].company
            
            phoneNumberCTVC = contactsArr[indexPath.row].phoneNumber
            
            self.performSegue(withIdentifier: "CTVCtoDVC", sender: self)
            
            self.tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
            
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController2 = segue.destination as? DetailViewController {
                
                viewController2.nameDVC = nameCTVC
                viewController2.emailDVC = emailCTVC
                viewController2.companyDVC = companyCTVC
                viewController2.phoneNumberDVC = phoneNumberCTVC
            }
            
         if let viewController3 = segue.destination as? AddContactViewController {
            
            viewController3.delegate = self
             
         }
            
        }
      
        
        // Swipe to delete functionality
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
            if editingStyle == .delete {
                contactsArr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                }
            
        }
}
