//
//  challengeDetailViewController.swift
//  challange
//
//  Created by Onur on 6.07.2022.
//

import UIKit
import Kingfisher

class challengeDetailViewController: UIViewController {

    @IBOutlet weak var firstAirDate: UILabel!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var originalLanguage: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var overView: UILabel!
    var viewModel = challengeViewController()
    var programVar : [FilmDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    
        filmName.text = "Film Adı: " + programVar[0].filmName
        originalLanguage.text = "Film Dili: " + programVar[0].originalLanguage
        voteAverage.text = "Rating: " + programVar[0].voteAverage
        overView.text = "Özet: " + programVar[0].overView
        firstAirDate.text = "Çıkış Tarihi: " + programVar[0].firstAirDate
        let img = "https://image.tmdb.org/t/p/w220_and_h330_face/" + programVar[0].image
        
        let resource = URL(string: (img))
        filmImage?.kf.setImage(with: resource)
        filmImage.contentMode = .scaleAspectFit
        filmImage.layer.cornerRadius = 10
        filmImage.clipsToBounds = true

    }

    @IBAction func back(_ sender: Any) {
        programVar.removeAll()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "challengeViewController") as! challengeViewController
        nextViewController.modalTransitionStyle = .crossDissolve
        self.present(nextViewController, animated:true, completion:nil)
    }
    
}
