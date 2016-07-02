//
//  CreateMovieVC.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import UIKit
import CoreData

class CreateMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieAddress: UITextField!
    @IBOutlet weak var addMovieBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        movieImg.layer.cornerRadius = 20.0
        movieImg.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
        
    }
    
    @IBAction func addImg(sender: AnyObject){
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func creatFavoriteMovie(sender: AnyObject) {
        if let movieName = movieName.text, let movieDesc = movieDesc.text, let movieAddress = movieAddress.text {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
            movie.movieName = movieName
            print(movie.movieName)
            movie.movieDesc = movieDesc
            print(movie.movieDesc)
            movie.movieAddress = movieAddress
            print(movie.movieAddress)
            movie.setMovieImage(movieImg.image!)
            
            
            context.insertObject(movie)
            print(movie)
            
            do {
                try context.save()
                
            } catch {
                print("Did not save Doug")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
