//
//  MoviesCell.swift
//  MYFAVORITEMOVIEPROGECT
//
//  Created by Kasey Schlaudt on 6/29/16.
//  Copyright © 2016 coprograming.com. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell{

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieAddress: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(movie: Movies) {
        movieName.text = movie.movieName
        movieDesc.text = movie.movieDesc
        movieAddress.text = movie.movieAddress
        movieImg.image = movie.getMovieImage()
        
    }
}
