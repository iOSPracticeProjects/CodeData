//
//  ViewController.swift
//  demoCoreData
//
//  Created by vmulugu on 10/28/19.
//  Copyright © 2019 vmulugu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
    newUser.setValue("veera", forKey: "username")
    newUser.setValue("1234", forKey: "password")
    newUser.setValue("1", forKey: "age")
        do {
            try context.save()
        } catch{
            print("Failed saving")
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
             //request.predicate = NSPredicate(format: "age = %@", "12")
             request.returnsObjectsAsFaults = false

             do {
                 let result = try context.fetch(request)
                 for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "username") as! String)
                 }
                 
             } catch {
                 
                 print("Failed")
             }
        
        
    }

    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
}

