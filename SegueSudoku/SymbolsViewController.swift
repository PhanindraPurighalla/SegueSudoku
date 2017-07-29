//
//  SymbolsViewController.swift
//  SegueSudoku
//
//  Created by Phanindra purighalla on 29/07/17.
//  Copyright © 2017 Aarna Solutions Inc. All rights reserved.
//

import UIKit

class SymbolsViewController: UIViewController {
    
    var rowNumber = 0
    var colNumber = 0
    var valueSelected = "0"

    @IBOutlet var Symbols: [UIButton]!
    
    @IBAction func SymbolPressed(_ sender: UIButton) {
        valueSelected = sender.title(for: .normal)!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print ("Came here from \(rowNumber) \(colNumber)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! SudokuViewController
        destinationVC.selectedSymbol = valueSelected
    }
    

}
