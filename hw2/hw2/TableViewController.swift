//
//  TableViewController.swift
//  hw2
//
//  Created by ChangSu Nam on 2/9/23.
//

import UIKit

class myCustomCell: UITableViewCell{
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
}

class TableViewController: UITableViewController {
    
    var location = ["Manhattan","Brooklyn","Queens","Staten Island", "The Bronx", "Seoul"]
    var temperature=["52","48","50","54","49","81"]
    //var weather = [UIImage(named: "sunny"),UIImage(named: "cloudy"),UIImage(named: "rainy")]
    var weather = [UIImage(named: "cloudy"),UIImage(named: "sunny"),UIImage(named: "sunny"),UIImage(named: "cloudy"),UIImage(named: "rainy"),UIImage(named: "sunny")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //  return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  return the number of rows
        return location.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCustomCell

        // Configure the cell...
        cell.locationLabel.text = location[indexPath.row]
        cell.temperatureLabel.text = temperature[indexPath.row]
        cell.weatherImage.image = weather[indexPath.row]
        
//        if (cell.locationLabel.text == "Manhattan" || cell.locationLabel.text == "Staten Island"){
//            cell.weatherImage.image = weather[1]
//        }
//        else if(cell.locationLabel.text == "The Bronx"){
//            cell.weatherImage.image = weather[2]
//        }else{
//            cell.weatherImage.image = weather[0]
//        }
       
        return cell
          
        }
        
      
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            location.remove(at: indexPath.row)
            temperature.remove(at: indexPath.row)
            weather.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let fromLocation = location[fromIndexPath.row]
        let fromTemperature = temperature[fromIndexPath.row]
        let fromWeather = weather[fromIndexPath.row]
        
        location.remove(at: fromIndexPath.row)
        location.insert(fromLocation, at: to.row)
        
        temperature.remove(at: fromIndexPath.row)
        temperature.insert(fromTemperature, at: to.row)
        
        weather.remove(at: fromIndexPath.row)
        weather.insert(fromWeather, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destVC = segue.destination as! detailViewController
        let selectedRow = tableView!.indexPathForSelectedRow
        let currentCell = tableView!.cellForRow(at: selectedRow!) as! myCustomCell
        
        destVC.location = currentCell.locationLabel!.text!
        destVC.temperature = currentCell.temperatureLabel!.text!
        destVC.img = currentCell.weatherImage!.image!
        
    }
    

}
