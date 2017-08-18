//
//  AddBookViewController.swift
//  Cell
//
//  Created by ktds 06 on 2017. 8. 18..
//  Copyright © 2017년 CJOliveNetworks. All rights reserved.
//

import UIKit

protocol AddBookDelegate {
    func sendNewBook(book:Book)
}

class AddBookViewController: UIViewController {

    var delegate:AddBookDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var writerTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // Save
    @IBAction func save(_ sender: Any) {
        

        guard let title = titleTextField.text else {
            return
        }
        
        if title == ""{
            let alert = UIAlertController(title: "오류", message: "제목을 입력하세요", preferredStyle: .alert)
            let closetBtn = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
            alert.addAction(closetBtn)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            let optPrice:Optional<Int> // Int? 랑 Optional<Int>는 동일
            if let price = priceTextField.text{
                optPrice = Int(price)
            }else{
                optPrice = nil
            }
            
            let book = Book(title: title,
                            writer: writerTextField.text,
                            publisher: publisherTextField.text,
                            coverImage: coverImageView.image,
                            price: optPrice,
                            desc: descriptionTextView.text,
                            url: urlTextField.text)
            
            if let prevVC = delegate{
                prevVC.sendNewBook(book: book)
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        

        
    }
    
    // Cancel
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddBookViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var resultImage:UIImage?
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            resultImage = editedImage
            self.coverImageView.image = resultImage
        }
        
        picker.dismiss(animated: true)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("BBB")
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddBookViewController:UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        print("Tap!!")
        return true
        
    }
}




