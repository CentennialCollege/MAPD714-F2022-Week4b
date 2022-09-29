import UIKit

class ViewController: UIViewController {
    var lhs: Float = 0.0
    var rhs: Float = 0.0
    var activeOperator: String = ""
    var haveLHS: Bool = false
    var haveRHS: Bool = false
    var inputReady: Bool = true
    var result: Float = 0.0
    
    
    //Result Label
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Operator Functions
    func Add(_ lhs: Float, _ rhs: Float) -> Float
    {
        return lhs + rhs
    }
    
    func Subtract(_ lhs: Float, _ rhs: Float) -> Float
    {
        return lhs - rhs
    }
    
    func Multiply(_ lhs: Float, _ rhs: Float) -> Float
    {
        return lhs * rhs
    }
    
    func Divide(_ lhs: Float, _ rhs: Float) -> Float
    {
        return lhs / rhs
    }
    
    func Evaluate()
    {
        switch (activeOperator)
        {
        case "+":
            result = Add(lhs, rhs)
        case "-":
            result = Subtract(lhs, rhs)
        case "X":
            result = Multiply(lhs, rhs)
        case "/":
            result = Divide(lhs, rhs)
        default:
            print("Not Implemented!")
        }
        lhs = result
        rhs = 0.0
        haveLHS = true
        haveRHS = false
        inputReady = false
        ResultLabel.text = String(result)
    }
    
    // Event Handlers

    @IBAction func OperatorButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let buttonText = button.titleLabel?.text
        
        if(!haveLHS)
        {
            lhs = Float(ResultLabel.text!)!
            haveLHS = true
            inputReady = false
        }
        else
        {
            rhs = Float(ResultLabel.text!)!
            haveRHS = true
            inputReady = false
        }
        
        if((buttonText != "=") && (haveLHS) && (haveRHS))
        {
            Evaluate()
        }
            
             
        switch (buttonText)
        {
        case "+":
            activeOperator = "+"
        case "-":
            activeOperator = "-"
        case "X":
            activeOperator = "X"
        case "/":
            activeOperator = "/"
        case "=":
            if(haveLHS && haveRHS)
            {
                Evaluate()
            }
        default:
            print("Not Implemented!")
        }
    }
    
    @IBAction func NumberButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let buttonText = button.titleLabel?.text
        
        if(!inputReady)
        {
            ResultLabel.text = ""
            inputReady = true
        }
        
        switch (buttonText)
        {
        case ".":
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text?.append(buttonText!)
            }
        default:
            if(ResultLabel.text == "0")
            {
                ResultLabel.text = buttonText
            }
            else
            {
                ResultLabel.text?.append(buttonText!)
            }
            
        }
    }
    
    @IBAction func ExtraButton_Pressed(_ sender: UIButton)
    {
        let button = sender as UIButton
        let buttonText = button.titleLabel?.text
        switch buttonText
        {
        case "C":
            ResultLabel.text = "0"
            lhs = 0.0
            rhs = 0.0
            haveLHS = false
            haveRHS = false
            inputReady = true
            activeOperator = ""
        default:
            if(ResultLabel.text!.count == 1)
            {
                ResultLabel.text = "0"
            }
            else
            {
                ResultLabel.text?.removeLast()
            }
        }
    }
    
    
}

