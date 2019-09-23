//
//  model.swift
//  ToDo List
//
//  Created by vladyslav kyselov on 9/19/19.
//  Copyright © 2019 vladyslav kyselov. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    class func alert(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}

var ToDoList: [[String: Any]] = [["Name":"Coca Cola","Photo":"123","IsComplited":true],["Name":"dinner","Photo":"gir","IsComplited":true],["Name":"cat","Photo":"xor","IsComplited":true],["Name":"love","Photo":"123","IsComplited":true],
["Name":"Prepare cake","Photo":"xxxx","IsComplited":false],["Name":"Buy Beer","Photo":"gir","IsComplited":true]]

func addItem(nameItem:String,Photo:String,InClasstoday:Bool = false){
   
    ToDoList.append(["Name":nameItem, "Photo":Photo,"IsComplited":InClasstoday])
    saveData()
}

func removeItem(at index: Int) {
    ToDoList.remove(at: index)
}

func saveData() {
    UserDefaults.standard.set(ToDoList, forKey: "ToDoKey")
    UserDefaults.standard.synchronize()
}

func loadData(){
    if let array = UserDefaults.standard.array(forKey: "ToDoKey")as? [[String:Any]]{
   ToDoList = array
    }
    else {
        ToDoList = []
    }
    
}


func changeState (at item: Int)->Bool {
    ToDoList[item]["IsComplited"] = !(ToDoList[item]["IsComplited"] as! Bool)
     saveData()
    return (ToDoList[item]["IsComplited"] as? Bool)!
   
}



