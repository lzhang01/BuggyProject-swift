//
//  ViewController.swift
//  BuggyProject
//
//  Created by Benjamin Wu on 1/6/16.
//  Copyright © 2016 IntrepidPursuits. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var validImageView: UIView?
    var searches: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        validImageView?.backgroundColor = UIColor.red
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.textFieldDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange , object: self.textField);
    }

    // MARK: Actions
    @IBAction func bTap() {
    }

    @IBAction func searchesTapped() {
    }

    // MARK: Helpers

    func imgurURLRequest() -> URLRequest? {
        // sample: WPOBwNC, u3qrQrH
        let urlBaseString = "http://i.imgur.com/"
        let fileExtension = ".png"

        if let id = textField?.text {
            let urlString = urlBaseString + id + fileExtension
            if let url = URL(string: urlString) {
                return URLRequest(url: url)
            }
        }
        return nil
    }

    func isValidString(_ stringToCheck: String?) -> Bool {
        guard let realString = stringToCheck else { return false }
        let stringLength = realString.count
        return stringLength > 4 && stringLength < 7
    }

    func textFieldDidChange(_ notification: Notification) {
        if isValidString(self.textField?.text) {
            validImageView?.backgroundColor = UIColor.green
        } else {
            validImageView?.backgroundColor = UIColor.red
        }
    }
}

