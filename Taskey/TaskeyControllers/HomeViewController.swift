//
//  HomeViewController.swift
//  Taskey
//
//  Created by Ali on 05.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SendData, ChangeTask {
    
    var alertView: AlertView!
    

    
    func checkTask(indChk: Int) {
        taskey[indChk].setValue(true, forKey: "checked")
        saveTask()
    }
    
    
    func sendDataToMain() {
        
        loadTask()
        mainCollectionView.reloadData()
    }
    
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        let mainCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCV.allowsSelection = true
        mainCV.showsVerticalScrollIndicator = false
        mainCV.reloadInputViews()
        mainCV.backgroundColor = .white
        mainCV.translatesAutoresizingMaskIntoConstraints = false
        return mainCV
    }()
    
    let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Made With Love"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    

    let mainCvCellId = "mainCvCellId"
    
    var isDeleted = true
    var deleteIndex = 0
    
    let checkBoxImage = [
        UIImage(named: "uncheckedBox"),
        UIImage(named: "checkedBox")
    ]
    
    var taskey = [Taskey]()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: mainCvCellId)
       
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (grandet, error) in
            
        }
       
        let content = UNMutableNotificationContent()
        content.title = "Hey im notif"
        content.body = "i cant type"
        
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            
        }
        
        setupView()
        
        loadTask()
        
    }
    
    func animateIn() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.alertView.alpha = 0
            self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.alertView.removeFromSuperview()
        }
    }
    
    func setAlert() {
        alertView = (Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)?.first as! AlertView)
        view.addSubview(alertView)
        alertView.center = view.center
        alertView.viewOfAlert.layer.cornerRadius = 5
        alertView.leftButton.layer.cornerRadius = 5
        alertView.rightButton.layer.cornerRadius = 5
        alertView.leftButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        alertView.rightButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        animateIn()

    }
    
    @objc func leftButtonPressed() {
        animateOut()
    }
    
    @objc func rightButtonPressed() {
        
        context!.delete(taskey[deleteIndex])
        mainCollectionView.reloadData()
        taskey.remove(at: deleteIndex)
        saveTask()
        animateOut()
//        alertView.removeFromSuperview()
        
    }
    
    
    func deleteTask(indx: Int) {
        setAlert()
        deleteIndex = indx
//            context!.delete(taskey[indx])
//            mainCollectionView.reloadData()
//            taskey.remove(at: indx)
//            saveTask()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskey.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCvCellId, for: indexPath) as! MainCollectionViewCell
        
        cell.mainTitleLabel.text = taskey[indexPath.item].title
        cell.mainImageView.image = UIImage(named: taskey[indexPath.item].image!)
        
        if taskey[indexPath.item].importance == "important" {
            cell.layer.backgroundColor = UIColor.purple.cgColor
            cell.mainTitleLabel.textColor = .white
            
        }
        else if taskey[indexPath.item].importance == "urgent" {
            cell.layer.backgroundColor = UIColor.red.cgColor
            cell.mainTitleLabel.textColor = .white
            
        }
        else if taskey[indexPath.item].importance == "not much"{
            cell.layer.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            cell.mainTitleLabel.textColor = .white
        }
        
        if taskey[indexPath.item].checked == false {
            cell.checkBoxImageButton.setImage(checkBoxImage[0], for: .normal)
        }
        else if taskey[indexPath.item].checked == true {
            cell.checkBoxImageButton.setImage(checkBoxImage[1], for: .normal)
        }
        
        cell.index = indexPath
        cell.delegate = self
        cell.checkDelegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dVC = (storyboard?.instantiateViewController(withIdentifier: "SelectedViewController") as? SelectedViewController)!
        
        dVC.image = taskey[indexPath.item].image
        dVC.titleTask = taskey[indexPath.item].title
        dVC.detailTask = taskey[indexPath.item].detail
        dVC.taskNotification = taskey[indexPath.item].notification
        dVC.importance = taskey[indexPath.item].importance
        
        
        self.navigationController?.pushViewController(dVC, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 157)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let addVC = segue.destination as! AddTaskViewController
            addVC.delegate = self
        }
    }
    
    func saveTask() {
        
        do {
            try context?.save()
        }
        catch {
            print(error)
        }
        self.mainCollectionView.reloadData()
    }
    
    func loadTask() {
        
        let request: NSFetchRequest<Taskey> = Taskey.fetchRequest()
        
        do {
            taskey = try (context?.fetch(request))!
        }
        catch {
            print("Error is \(error)")
        }
        
    }
    
    func setupView() {
        
        view.addSubview(mainCollectionView)
        view.addSubview(completedLabel)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        
        mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110).isActive = true
        
        completedLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        completedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        completedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}
