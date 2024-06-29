import UIKit

class DisplayViewController: UITableViewController {
    
    var peopleArray = [Person]()
    var arrayNil = [Person]()
    var arrayNotNil = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        segregatePeople()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func segregatePeople() {
        arrayNil.removeAll()
        arrayNotNil.removeAll()
        for person in peopleArray {
            if person.id == nil || person.age == nil || person.name == nil {
                arrayNil.append(person)
            } else {
                arrayNotNil.append(person)
            }
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? arrayNil.count : arrayNotNil.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = indexPath.section == 0 ? arrayNil[indexPath.row] : arrayNotNil[indexPath.row]
        
        let name = person.name ?? "No Name"
        let age = person.age ?? -1
        let id = person.id ?? -1
        
        cell.textLabel?.text = "\(name), Age: \(age), ID: \(id)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "People with Nil Values" : "People with Non-Nil Values"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                arrayNil.remove(at: indexPath.row)
            } else {
                arrayNotNil.remove(at: indexPath.row)
            }
            updatePeopleArray()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func updatePeopleArray() {
        peopleArray = arrayNil + arrayNotNil
    }
}
