//
//  MovesVC.swift
//  Pokelist
//
//  Created by Dmytro Aprelenko on 14.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class MovesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemon: Pokemon!

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    

    @IBAction func backBtn(_ sender: UIButton) {
        
    }
    
}
