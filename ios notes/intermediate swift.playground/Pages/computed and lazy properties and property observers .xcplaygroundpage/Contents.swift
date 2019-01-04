//: Computed properties
struct Rectangle {
    let length: Int
    let width: Int
    static let x: Int = -1
    
    // this is get only
    var area: Int {
        return length * width * Rectangle.x
    }
    
    // both getable and setable
    var center: Int {
        get {
            return 0
        }
        
        set {
            // do something
            print(newValue)
        }
    }
    
}

let r1 = Rectangle(length: 10, width: 20)
r1.area


//: Lazy Stored Properties
 // these variables are created using a function you specify only when that variable is first requested. If it’s never requested, the function is never run, so it does help save processing time.

// only used in a struct or class
// lazy var t = 0


//: Property Observers
import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    var value: Double = 0.0 {
        // note: property obervers are not called during initialization of object
        
        // property observer; called right before var has been changed
        willSet {
            print("Old value: \(value)")
        }
        
        // property observer; called immediately after var has been assigned
        didSet {
            view.alpha = CGFloat(value)
            print("New value: \(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30/255.0, green: 36/255.0, blue: 40/255.0, alpha: 1.0)
        
        // Add target-action pattern for value changed event
        slider.addTarget(self, action: #selector(viewController.slide(sender:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Programmatically add constraints to setup layout
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.widthAnchor.constraint(equalToConstant: 400)
            ])
        
    }
    
    // Method for target-action
    @objc func slide(sender: UISlider) {
        value = Double(sender.value)
    }
    
}


let viewController = ViewController()
PlaygroundPage.current.liveView = viewController.view
