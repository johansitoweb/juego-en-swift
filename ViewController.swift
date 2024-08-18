import UIKit  

class ViewController: UIViewController {  

    @IBOutlet weak var instructionLabel: UILabel!  
    @IBOutlet weak var guessTextField: UITextField!  
    @IBOutlet weak var resultLabel: UILabel!  

    var randomNumber: Int = 0  
    
    override func viewDidLoad() {  
        super.viewDidLoad()  
        startNewGame()  
    }  
    
    @IBAction func guessButtonTapped(_ sender: UIButton) {  
        guard let guessText = guessTextField.text, let guess = Int(guessText) else {  
            resultLabel.text = "Por favor, ingresa un número válido."  
            return  
        }  
        
        if guess < 1 || guess > 100 {  
            resultLabel.text = "El número debe estar entre 1 y 100."  
            return  
        }  
        
        if guess < randomNumber {  
            resultLabel.text = "Demasiado bajo! Prueba de nuevo."  
        } else if guess > randomNumber {  
            resultLabel.text = "Demasiado alto! Prueba de nuevo."  
        } else {  
            resultLabel.text = "¡Correcto! El número era \(randomNumber)."  
            startNewGame()  
        }  
    }  
    
    func startNewGame() {  
        randomNumber = Int.random(in: 1...100)  
        instructionLabel.text = "Adivina un número entre 1 y 100"  
        resultLabel.text = ""  
        guessTextField.text = ""  
    }  
}