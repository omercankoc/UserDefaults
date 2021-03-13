import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelMessage: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // EN : Bring the recorded data when the application starts.
        // TR : Uygulama başladığında kaydedilen verileri getir.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        
        // EN : Show the data if it is not empty and the String can be cast.
        // TR : Eger bos degil ise ve String yapilabiliyorsa verileri goster.
        if let name = storedName as? String{
            if let surname = storedSurname as? String{
                LabelMessage.text = "Hello " + name + surname + "!"
            }
        }
    }

    @IBAction func onClickSave(_ sender: Any) {
        
        // EN : Save data in key-value type.
        // TR : Verileri Anahtar-Deger tipinde kaydet.
        UserDefaults.standard.set(textFieldName.text!, forKey: "name")
        UserDefaults.standard.set(textFieldSurname.text, forKey: "surname")
        
        // EN : Show data or set data to label.
        // TR : Veriyi goster veya label'a veri ata.
        LabelMessage.text = "Hello \(textFieldName.text! + " " + textFieldSurname.text! + "!")"
    }
    
    @IBAction func onClickDelete(_ sender: Any) {
        
        // EN : Get data to delete.
        // TR : Silinecek verileri getir.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        
        // EN : If not null, delete data.
        // TR : Eger bos degil ise, gelen veriyi sil.
        if (storedName as? String) != nil{
            if (storedSurname as? String) != nil{
                UserDefaults.standard.removeObject(forKey: "name")
                UserDefaults.standard.removeObject(forKey: "surname")
    
                LabelMessage.text = "Hello! Deleted User Data!!"

            }
        }
    }
}

