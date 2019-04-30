//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Taylor Lyles on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var delegate: BookTableViewCellDelegate?
    var book: Book?

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateViews() {
        guard let bookLabel = book?.title else { return }
        label.text = bookLabel
        
        guard let checked = book?.hasBeenRead else { return }
        if checked {
            button.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            button.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonAction(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
}
