//
//  ViewController.swift
//  KadaiChallenge12
//
//  Created by 澤田世那 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    private let setTaxRateValueKey = "setTaxRateValue"
    private var taxRateValue: Double?

    @IBOutlet private weak var taxExcludedMoneyTextField: UITextField!
    @IBOutlet private weak var consumptionTaxRateTextField: UITextField!
    @IBOutlet private weak var taxIncludedMoneyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        taxRateValue = UserDefaults.standard.object(forKey: setTaxRateValueKey) as? Double
        if let taxRateValue = taxRateValue {
            consumptionTaxRateTextField.text = String(Int(taxRateValue))
        }
    }

    @IBAction private func calculateButton(_ sender: Any) {
        let taxExcludedMoneyValue = taxExcludedMoneyTextField.text.flatMap { Double($0) }
        guard let taxExcludedMoneyValue = taxExcludedMoneyValue else { return }

        taxRateValue = consumptionTaxRateTextField.text.flatMap { Double($0) }
        guard let taxRateValue = taxRateValue else { return }
        UserDefaults.standard.set(taxRateValue, forKey: setTaxRateValueKey)

        let resultValue = Int(taxExcludedMoneyValue * ( 1 + taxRateValue / 100))
        taxIncludedMoneyLabel.text = String(resultValue)
    }
}
