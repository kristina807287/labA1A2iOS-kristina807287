//
//  Products+CoreDataProperties.swift
//  labA1A2iOS_kristina807287
//
//  Created by user203929 on 9/20/21.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var productID: NSNumber?
    @NSManaged public var productName: String?
    @NSManaged public var productPrice: Double
    @NSManaged public var productDesc: String?
    @NSManaged public var productProvider: String?

}

extension Products : Identifiable {

}
