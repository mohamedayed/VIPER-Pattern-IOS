//
//  TeamCell.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit
import Kingfisher

class TeamCell:UITableViewCell,teamsCellProtocol{
    
    
    
    @IBOutlet weak var teamImageView: UIImageView!
    
    
    @IBOutlet weak var teamName: UILabel!
    
    
    @IBOutlet weak var founded:UILabel!
    
    
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        setUpTeamCell()
    }
    
    
     func setUpTeamCell(){
        
        self.selectionStyle = .none
        teamImageView.layer.cornerRadius = teamImageView.frame.height / 2
        
        
    }
    
    
    func configureCell(viewModel: TeamsViewModel) {
        teamName.text = viewModel.teamName
        teamImageView.kf.setImage(with: viewModel.teamImage)
        founded.text = "\(viewModel.founded)"
        
    }
    
   
}
