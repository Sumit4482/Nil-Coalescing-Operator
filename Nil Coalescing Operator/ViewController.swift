import UIKit

class ViewController: UIViewController {
    
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    let idTextField = UITextField()
    let submitButton = UIButton(type: .system)
    var peopleArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        nameTextField.placeholder = "Enter Name"
        nameTextField.borderStyle = .roundedRect
        
        ageTextField.placeholder = "Enter Age"
        ageTextField.borderStyle = .roundedRect
        ageTextField.keyboardType = .numberPad
        
        idTextField.placeholder = "Enter ID"
        idTextField.borderStyle = .roundedRect
        idTextField.keyboardType = .numberPad
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(idTextField)
        view.addSubview(submitButton)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            idTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            submitButton.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func submitButtonTapped() {
        let name = nameTextField.text?.isEmpty == false ? nameTextField.text : nil
        let age = ageTextField.text?.isEmpty == false ? Int(ageTextField.text!) : nil
        let id = idTextField.text?.isEmpty == false ? Int(idTextField.text!) : nil
        
        let person = Person(name: name, age: age, id: id)
        peopleArray.append(person)
        
        let displayVC = DisplayViewController()
        displayVC.peopleArray = peopleArray
        navigationController?.pushViewController(displayVC, animated: true)
    }
}
