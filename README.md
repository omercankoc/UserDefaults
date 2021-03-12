## UserDefaults Sample
 
If you have a relatively small collection of key-values that you'd like to save, you should use the UserDefaults. A UserDefaults object points to a file containing key-value pairs and provides simple methods to read and write them. Each UserDefaults file is managed by the framework and can be private or shared.

Bring the recorded data when the application starts:
```swift
let storedName = UserDefaults.standard.object(forKey: "name")
let storedSurname = UserDefaults.standard.object(forKey: "surname")
    if let name = storedName as? String{
        if let surname = storedSurname as? String{
            LabelMessage.text = "Hello " + name + surname + "!"
        }
    }
```
Set data in key-value type:
```swift
UserDefaults.standard.set(textFieldName.text!, forKey: "name")
UserDefaults.standard.set(textFieldSurname.text, forKey: "surname")
LabelMessage.text = "Hello \(textFieldName.text! + " " + textFieldSurname.text! + "!")"
```

Remove data in key-value type:
```swift
let storedName = UserDefaults.standard.object(forKey: "name")
let storedSurname = UserDefaults.standard.object(forKey: "surname")      
    if (storedName as? String) != nil{
        if (storedSurname as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "surname")    
            LabelMessage.text = "Hello! Deleted User Data!!"
        }
    }
```
