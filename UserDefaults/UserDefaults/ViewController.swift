import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelMessage: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bring the recorded data when the application starts.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        
        // If not null, show data.
        if let name = storedName as? String{
            if let surname = storedSurname as? String{
                LabelMessage.text = "Hello " + name + surname + "!"
            }
        }
    }

    @IBAction func onClickSave(_ sender: Any) {
        
        // Save data in key-value type.
        UserDefaults.standard.set(textFieldName.text!, forKey: "name")
        UserDefaults.standard.set(textFieldSurname.text, forKey: "surname")
        
        // Show data.
        LabelMessage.text = "Hello \(textFieldName.text! + " " + textFieldSurname.text! + "!")"
    }
    
    @IBAction func onClickDelete(_ sender: Any) {
        
        // Get data to delete.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        
        // If not null, delete data.
        if (storedName as? String) != nil{
            if (storedSurname as? String) != nil{
                UserDefaults.standard.removeObject(forKey: "name")
                UserDefaults.standard.removeObject(forKey: "surname")
    
                LabelMessage.text = "Hello! Deleted User Data!!"

            }
        }
    }
}

