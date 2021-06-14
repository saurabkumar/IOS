//
//  ViewController.swift
//  Sample
//
//  Created by Saurab Kumar on 14/06/21.
//

import UIKit
import Razorpay

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        print("Failed", code,str)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("Success", payment_id)
    }
  
    var razorpay: RazorpayCheckout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = RazorpayCheckout.initWithKey("rzp_test_siY3oWUoOfReQu", andDelegate: self)
    }



    @IBAction func Pay(_ sender: Any) {
        let options: [String:Any] = [
                          "amount": "100", //This is in currency subunits. 100 = 100 paise= INR 1.
                          "currency": "INR",//We support more that 92 international currencies.
                          "description": "purchase description",
                          "order_id": "order_HMv9VaIWywoa1m",
                          "image": "https://url-to-image.png",
                          "name": "business or product name",
                          "prefill": [
                              "contact": "9797979797",
                              "email": "foo@bar.com"
                          ],
                          "theme": [
                              "color": "#F37254"
                            ]
                      ]
              razorpay.open(options)
          }
    }
    
