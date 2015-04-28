//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FilterViewControllerDelegate {

    var businesses: [Business]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        self.searchBar.delegate = self
        self.searchBar.sizeToFit()
        navigationItem.titleView = self.searchBar
        navigationController?.navigationBar.backgroundColor = UIColor.yellowColor()
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["pizza"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
           
            //searchController.hidesNavigationBarDuringPresentation = false
            for business in businesses {
                println(business.name!)
                println(business.address!)
                self.tableView.reloadData()
            }
        }
       // self.tableView.rowHeight = 180
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.businesses = self.businesses.filter ({$0.name!.lowercaseString.rangeOfString(searchText.lowercaseString) != nil})
        for b in self.businesses{
            print(b.name)
        }
        tableView.reloadData()

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = self.businesses[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.businesses != nil {
            return self.businesses.count
        }
        else{
            return 0
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nav = segue.destinationViewController as!UINavigationController
        let filterVC = nav.topViewController as! FilterViewController
        
        filterVC.delegate = self
    }
    
    func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String : AnyObject]) {
        //earchWithTerm(term: String, sort: YelpSortMode?, categories: [String]?, deals: Bool?, completion: ([Business]!, NSError!) -> Void) -> Void {filters["sort"] as! YelpSortMode.RawValue
        print(filters)
            Business.searchWithTerm("Restaurants", sort: (filters["sort"] as? YelpSortMode) , categories: (filters["categories"] as? [String]), deals: (filters["deals"] as? Bool)) { (businesses: [Business]!, error: NSError!) -> Void in
                self.businesses = businesses
                
                for business in businesses {
                    println(business.name!)
                    println(business.address!)
                    self.tableView.reloadData()
                }
            }
        
    }

}
