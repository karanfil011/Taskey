//
//  HomeViewController.swift
//  Taskey
//
//  Created by Ali on 05.11.2019.
//  Copyright © 2019 Ali. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SendData, ChangeTask {
    
    func deleteTask(indx: Int) {
        context.delete(taskey[indx])
        taskey.remove(at: indx)
        
        saveTask()
    }
    
    
    func sendDataToMain() {
        
        loadTask()
        mainCollectionView.reloadData()
    }
    
    
    let myTaskTitle: UILabel = {
        let title = UILabel()
        title.text = "My Tasks"
        title.font = UIFont.systemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        let mainCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCV.allowsSelection = true
        mainCV.showsVerticalScrollIndicator = false
        mainCV.backgroundColor = .white
        mainCV.translatesAutoresizingMaskIntoConstraints = false
        return mainCV
    }()
    
    let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    

    let mainCvCellId = "mainCvCellId"
    
    
    let checkBoxImage = [
        UIImage(named: "uncheckedBox"),
        UIImage(named: "checkedBox")
    ]
    
    var taskey = [Taskey]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: mainCvCellId)
        
        setupView()
        
        mainCollectionView.reloadData()
        loadTask()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskey.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCvCellId, for: indexPath) as! MainCollectionViewCell
        cell.iconImage = UIImage(named: taskey[indexPath.item].image!)
        cell.taskTitle = taskey[indexPath.item].title
        cell.checkBoxImage = checkBoxImage[0]
        
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
        
        cell.delegate = self
        cell.index = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dVC = (storyboard?.instantiateViewController(withIdentifier: "SelectedViewController") as? SelectedViewController)!
        
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
            try context.save()
        }
        catch {
            print("Error saving taskey \(error)")
        }
        
        self.mainCollectionView.reloadData()
    }
    
    func loadTask() {
        let request: NSFetchRequest<Taskey> = Taskey.fetchRequest()
        
        do {
            taskey = try context.fetch(request)
        }
        catch {
            print("Error loading taskey \(error)")
        }
    }
    
    func setupView() {
        view.addSubview(myTaskTitle)
        view.addSubview(mainCollectionView)
        view.addSubview(completedLabel)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        myTaskTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        myTaskTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 170).isActive = true
        myTaskTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        myTaskTitle.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        
        completedLabel.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor, constant: 20).isActive = true
        completedLabel.leftAnchor.constraint(equalTo: mainCollectionView.leftAnchor, constant: 20).isActive = true
        completedLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }


}
