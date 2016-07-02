//
//  TableViewCellDisplayVC.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import UIKit
import CoreData

protocol TableViewCellDisplayDelegate {
    
}
class TableViewCellDisplayVC: UIViewController {
    

    var movies = Movies()
    var movie = [Movies]()
    var delegate : TableViewCellDisplayVC! = nil
    
    
    @IBOutlet weak var movieName:UILabel!
    @IBOutlet weak var movieDesc:UITextField!
    @IBOutlet weak var movieImg:UIImageView!
    @IBOutlet weak var movieAddress:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchsAndSetsResultsFromTable()
    
        MoviesCell.self
        
        
    }
    
    func fetchsAndSetsResultsFromTable() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movie = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }

    }
}