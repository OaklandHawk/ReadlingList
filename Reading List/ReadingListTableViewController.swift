//
//  ReadingListTableViewController.swift
//  Reading List
//
//  Created by Taylor Lyles on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    let bookController = BookController()

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if readBooks in bookController {
            
        }
        return 0
    }

   
}

