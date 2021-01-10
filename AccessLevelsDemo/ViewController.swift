//
//  ViewController.swift
//  AccessLevelsDemo
//
//  Created by Nazar Dranhovskyi on 04.01.2021.
//

import UIKit

class ViewController : UIViewController {
    
    var item: Item?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as AnyObject? === saveButton)
        {
            let name = nameTextField.text ?? ""
            item = Item(name: name)
        }
    }
}



