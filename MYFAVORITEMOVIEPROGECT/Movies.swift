//
//  Movies.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movies: NSManagedObject {

    func setMovieImage(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.movieImg = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.movieImg!)!
        return img
    }
}