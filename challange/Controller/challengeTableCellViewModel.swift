//
//  challengeTableViewCell.swift
//  challange
//
//  Created by Onur on 6.07.2022.
//

import UIKit

class challengeTableCellViewModel {
    
    var departure: ChallengeModel?

    init(departure: ChallengeModel) {
        self.departure = departure
    }
}

class challengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewShadow: UIView!
    @IBOutlet weak var filmName: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    
    
    var viewModel: challengeTableCellViewModel? {
        didSet{
            bindViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        viewShadow.addShadow(cornerRadius: 10)
        layer.cornerRadius = 10.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 8
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func bindViewModel() {
        guard let viewModel = viewModel, let departure = viewModel.departure else {
            return
        }
        
        filmName.text = departure.name ?? ""
        filmRating.text =  "Rating: " + String(departure.vote_average ?? 0.00)
    }

}
