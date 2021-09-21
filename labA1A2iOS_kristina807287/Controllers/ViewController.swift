//
//  ViewController.swift
//  labA1A2iOS_kristina807287
//
//  Created by user203929 on 9/19/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var textField: [UITextField]!
    
    var product: Products?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if product != nil {
            (stackView.viewWithTag(100) as? UITextField)?.text = product?.productName
            (stackView.viewWithTag(101) as? UITextField)?.text = "\(product!.productID!)"
            (stackView.viewWithTag(102) as? UITextField)?.text = "\(product!.productPrice)"
            (stackView.viewWithTag(103) as? UITextField)?.text = product?.productProvider
            (stackView.viewWithTag(104) as? UITextField)?.text = product?.productDesc
        }
        
       
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
      
    
    @IBAction func saveProduct(_ sender: UIButton) {
                
        let name = (stackView.viewWithTag(100) as? UITextField)?.text ?? ""
        let id = Int16((stackView.viewWithTag(101) as? UITextField)?.text ?? "") ?? 0
        let price = Double((stackView.viewWithTag(102) as? UITextField)?.text ?? "") ?? 0.0
        let provider = (stackView.viewWithTag(103) as? UITextField)?.text ?? ""
        let desc = (stackView.viewWithTag(104) as? UITextField)?.text ?? ""
      
        
        let product = Products(context: context)
        product.productName = name
        product.productDesc = desc
        product.productID = NSNumber(value: id)
        product.productPrice = price
        product.productProvider = provider
        
        
        // Save the managed object context
        do {
            try context.save()
            // add a delay of 0.7 secs and pop
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.navigationController?.popViewController(animated: true)
            }
        } catch let error as NSError {
            print("Save error: \(error), description: \(error.userInfo)")
        }
        
        
    }
    
    }






