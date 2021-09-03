//
//  RegisterPicker.swift
//  Fabric
//
//  Created by ziad on 01/09/2021.
//

import Foundation
import UIKit
extension SignUpVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData?.count ?? 0
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.categoryData?[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTxt.text = self.categoryData?[row].name
    }
}
extension SignUpVC: ToolbarPickerViewDelegate {
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        guard let selected = self.categoryData?[row] else { return  }
        self.selectedCategory.append(selected)
        self.collectionViwe.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionHeight.constant = 40
            self.view.layoutIfNeeded()
        }
        self.categoryTxt.text = ""
        self.categoryTxt.resignFirstResponder()
    }
    func didTapCancel() {
        self.categoryTxt.text = ""
        self.categoryTxt.resignFirstResponder()
    }
}


