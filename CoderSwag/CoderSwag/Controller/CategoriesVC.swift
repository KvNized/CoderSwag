//
//  ViewController.swift
//  CoderSwag
//
//  Created by Mehmet Kavunoğlu on 30.04.2021.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var categoryTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
// ** EN SON OLARAK delegate ve datasrouce u eklememiz gerekir. self = CategoriesVC olmus olur.
        categoryTable.dataSource = self
        categoryTable.delegate = self
        
        
    }
//  ** kaç tane cell olması gerektigini belirleriz.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
//  ** hangi cell'e, hangi kategorinin koyulacagını belirleriz.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//  NOT: henüz identifier'ı eklememiş olsak da kodda belirtiyoruz, sonra bunu eklememiz gerekiyor.
//  updateview ile sürekli farklı cell geldiginde güncellenmesini saglıyoruz.
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell() // else boş cell gösterir
        }
            
//   NOT:     cell.imageView.image = category.imageName ** kullanılarak yukarıdaki kod yapılabilirdi.
//            Ancak bunu TableView içinde yapmak saglıklı olmaz. Her bir image için tek tek acıklanması daha iyi.
    }

    
    

    
    
 

}

