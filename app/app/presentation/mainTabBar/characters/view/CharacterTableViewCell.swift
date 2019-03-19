//
//  CharacterTableViewCell.swift
//  app
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit
import Kingfisher

protocol CharacterTableViewCellProtocol {
    
    var name: String { get }
    var imageURL: URL? { get }
}

struct CharacterTableViewCellModel: CharacterTableViewCellProtocol {
    
    let name: String
    let imageURL: URL?
}

final class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var viewModel: CharacterTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(viewModel: CharacterTableViewCellProtocol) {
        characterImageView.kf.setImage(with: viewModel.imageURL)
        nameLabel.text = viewModel.name
        
        self.viewModel = viewModel
    }
}
