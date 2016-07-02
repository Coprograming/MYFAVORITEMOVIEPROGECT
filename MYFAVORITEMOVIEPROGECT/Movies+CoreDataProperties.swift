//
//  Movies+CoreDataProperties.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var movieImg: NSData?
    @NSManaged var movieName: String?
    @NSManaged var movieAddress: String?
    @NSManaged var movieDesc: String?

}
