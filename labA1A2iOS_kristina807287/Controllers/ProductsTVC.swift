//
//  ProductTableViewController.swift
//  labA1A2iOS_kristina807287
//
//  Created by user203929 on 9/20/21.
//

import UIKit
import CoreData

class ProductsTVC: UITableViewController {
    
    var products = [Products]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displayProducts()
    }
    
    func displayProducts () {

        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
         
        do {
            let fetchData = try context.fetch(fetch) as? [Products]
            if let p = fetchData, p.count > 0 {
                for data in p {
                    if products.contains(data) == false {
                        products.append(data)
                    }
                }
                self.tableView.reloadData()
            } else {
                print("No products")
            }
            
        } catch {
            fatalError("Failed to fetch products: \(error)")
        }
        
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.products.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = products[indexPath.row].productName
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        vc.product = products[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
   //}
    


