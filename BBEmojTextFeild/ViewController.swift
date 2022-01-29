//
//  ViewController.swift
//  BBEmojTextFeild
//
//  Created by AidyBao on 2022/1/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange, with: string)
            if updatedText.containsEmoji {
                return false
            }
        }
        return true
    }
}

