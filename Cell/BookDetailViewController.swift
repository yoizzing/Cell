//
//  BookDetailViewController.swift
//  Cell
//
//  Created by ktds 06 on 2017. 8. 17..
//  Copyright © 2017년 CJOliveNetworks. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var book:Book?
    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let newBook = self.book else{
            return
        }
        
        self.bookCoverImageView.image = newBook.coverImage
        self.bookAuthorLabel.text = newBook.writer
        self.bookPublisherLabel.text = newBook.publisher
        self.bookPriceLabel.text = String(newBook.price)
        self.bookDescriptionTextView.text = newBook.description
        
        // Title 표시
        self.navigationItem.title = newBook.title

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webVC = segue.destination as? WebViewController{
            webVC.shopURL = self.book?.url
        }
    }


    
    
}
