//
//  ViewController.swift
//  MyTVOSApp
//
//  Created by Apeksha Sahu on 11/10/18.
//  Copyright © 2018 Apeksha Sahu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  

    var tableView =  UITableView()
    var miniCategories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    miniCategories = ["Podcasts","Recent","Free","YouTube","Favroties","Paid"]
        setupTableView()
        
    }

    func setupTableView(){
    
        let tableframe = CGRect(x: 0, y: 0, width: (self.view.frame.width/4 - 50), height: self.view.frame.height - 450)
        
        tableView = UITableView(frame: tableframe, style: .grouped)
    self.view.addSubview(tableView)
    self.tableView.dataSource = self
    self.tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miniCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
      cell.textLabel?.text = "\(miniCategories[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print(indexPath.item)
        print(miniCategories[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if (context.nextFocusedIndexPath == nil) {
            print("not browsing the table")
            return
        }
        
        print(context.nextFocusedIndexPath?.item ?? 0)
        print("over")
    }
}

