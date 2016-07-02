//
//  ViewController.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, TableViewCellDisplayDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var movies = [Movies]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableview.reloadData()
        
    }
    
    
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movies]
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MoviesCell") as? MoviesCell {
            
            let movie = movies[indexPath.row]
            
            cell.configureCell(movie)
            [self ]
            return cell
        }else {
            
            return MoviesCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "DetailViewSegue") {
            let destination = segue.destinationViewController as! TableViewCellDisplayVC
            
        }
    }
    
}











