//
//  ViewController.swift
//  labA1A2iOS_kristina807287
//
//  Created by user203929 on 9/19/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var textField: [UITextField]!
    
    var products: [Products]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func addProducts(_ sender: UIBarButtonItem) {
//        let title = textField[0].text ?? "no title"
//        let author = textField[1].text ?? "no author"
//        let pages = Int(textField[2].text ?? "0") ?? 0
//        let year = Int(textField[3].text ?? "1900") ?? 1900
//
//        let book = BookModel(title: title, author: author, pages: pages, year: year)
//
//        books?.append(book)
//    }
//
//     func loadData() {
//        books = [BookModel]()
//    }
    
    
    
    }






