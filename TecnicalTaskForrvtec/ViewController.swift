//
//  ViewController.swift
//  TecnicalTaskForrvtec
//
//  Created by THOTA NAGARAJU on 1/30/20.
//  Copyright © 2020 THOTA NAGARAJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var urlReqst:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    var datafetching:[String:Any]!
    var churchNames = [String]()
    var churchId = [String]()
    var churchDiscription = [String]()
    var churchAdress = [String]()
    var churchImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        fetchData()
        tableView.delegate   = self
        tableView.dataSource = self
       
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(churchId.count)
        return churchNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCELL") as! TableViewCell
        cell.titleLbl.text! = churchNames[indexPath.row]
        cell.idLbl.text! = churchId[indexPath.row]
        cell.addressLbl.text! = churchDiscription[indexPath.row]
        cell.discritLbl.text! = churchAdress[indexPath.row]
        cell.imageView?.image = churchImages[indexPath.row]
        
     return cell
    }
    
      func fetchData()  {
        
        datafetching =  dataFromServer()
        
        let totalData = datafetching["data"] as! [[String:Any]]
        for i in totalData{
            let churchTitle = i["title"] as! String
            churchNames.append(churchTitle)
          
            let churchID = i["id"] as! String
            churchId.append(churchID)
        
            let churchDiscr = i["description"] as! String
            churchDiscription.append(churchDiscr)
          
            let churchAdres = i["address"] as! String
            churchAdress.append(churchAdres)
          
            let churchImage = i["logo"] as! String
            do{
                let urlImage = URL(string: churchImage)
                let imageData = try! Data(contentsOf: urlImage!)
                let churchImg = UIImage(data: imageData)
                churchImages.append(churchImg!)
                
            }catch{
                print("not getting image")
            }
            
            
        }
        
       }

    var url = "http://appwebprojects.com/TestAPI/api/testApi"
    
    func dataFromServer()-> [String:Any]
    {
        var dataResponse :[String:Any]!

        urlReqst = URLRequest(url:URL(string: url)!)
        urlReqst.setValue("api", forHTTPHeaderField: "Access-Control-Allow-Origin")
   urlReqst.setValue("V0XpSCOFVXiEd2nAuMPdbQc/rDdRDPdkbPSV5EU4eEHnM9eMttFh1F7EzaCRMQhmopme3CF5g4WHXVdt3og9kS", forHTTPHeaderField: "APPKEY")
        urlReqst.setValue("application/json", forHTTPHeaderField: "Content-Type")

        dataTaskObj = URLSession.shared.dataTask(with: urlReqst, completionHandler: { (data, response, error) in

            do{
                dataResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)   as? [String:Any]
                print(dataResponse)
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
                
            }catch{
                print("Data is not Getting")
              }
        })
        dataTaskObj.resume()
        while (dataResponse == nil)
        {

        }
        return dataResponse!
}

}


