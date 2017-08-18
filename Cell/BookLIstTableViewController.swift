//
//  BookLIstTableViewController.swift
//  Cell
//
//  Created by ktds 06 on 2017. 8. 17..
//  Copyright © 2017년 CJOliveNetworks. All rights reserved.
//

import UIKit
import Foundation

class BookLIstTableViewController: UITableViewController {
    
    var books:[Book] = Array()
    //var books:[String] = ["홍길동", "김철수", "고길동", "둘리"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(title: "아무것도 아닌 지금은 없다",
                         writer: "글배우",
                         publisher: "쌤앤파커스",
                         coverImage: UIImage(named: "book1")!,
                         price: 13000,
                         description: "오늘도 무사히 버텨낸 당신에게 전하는 응원의 메시지!",
                         url: "http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&orderClick=LEB&barcode=9788965704959")
        
        let book2 = Book(title: "보노보노처럼 살다니 다행이야(특별판)",
                         writer: "김신희",
                         publisher: "놀",
                         coverImage: UIImage(named: "book2")!,
                         price: 16000,
                         description: "1986년 출간되어 1988년 고단샤 만화상을 수상한 후 30년 넘게 연재를 이어오고 있는 네 컷 만화 ‘보노보노’. 우리나라엔 1995년 만화책으로 처음 정식 소개되었다. 그 후 애니메이션과 영화로 각색되어 국내에도 두터운 팬층을 형성했다. 보노보노가 서른이 되어가는 동안 만화책과 애니메이션을 보고 자란 어린이들 역시 이제 어른이 되었다. 하지만 나이를 먹어도 여전히 사는 게 잘 모르겠고, 솔직해지려 하면 할수록 자신만 손해본다는 느낌에 스스로를 감추게 된다. 어른은 어른인데, 아직도 사는 데 소질 없는 ‘서툰 어른’이 된 것이다. ",
                         url: "http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791130611853&orderClick=LEB&Kc=")

        let book3 = Book(title: "언어의 온도",
                         writer: "이기주",
                         publisher: "말글터",
                         coverImage: UIImage(named:"book3")!,
                         price: 13800,
                         description: "어제 노트북을 켜고 ‘사람’을 입력하려다 실수로 ‘삶’을 쳤다. 그러고 보니 ‘사람’에서 슬며시 받침을 바꾸면 ‘사랑’이 되고 ‘사람’에서 은밀하게 모음을 빼면 ‘삶’이 된다. 세 단어가 닮아서일까. 사랑에 얽매이지 않고 살아가는 사람도, 사랑이 끼어들지 않는 삶도 없는 듯하다. ",
                         url: "http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791195522125&orderClick=LEB&Kc=")
        
        self.books.append(book1)
        self.books.append(book2)
        self.books.append(book3)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if let bookCell = cell as? BookTableViewCell{
            let book = self.books[indexPath.row]
            
            
            let numFormatter:NumberFormatter = NumberFormatter()
            numFormatter.numberStyle = NumberFormatter.Style.decimal
            let price = book.price
            let priceStr = numFormatter.string(from: NSNumber(integerLiteral: price))
            
            bookCell.bookTitleLabel.text = book.title
            bookCell.bookWriterLabel.text = book.writer
            bookCell.bookPriceLabel.text = priceStr
            bookCell.bookImageView.image = book.coverImage
            return bookCell
        }
        
        // Configure the cell...
        
//        let book = self.books[indexPath.row]
//        cell.textLabel?.text = book.title
//        cell.detailTextLabel?.text = book.writer
//        cell.imageView?.image = book.coverImage
        
//        cell.textLabel?.text = books[indexPath.row]
        
        
        
//        cell.textLabel?.text = "Hello, World"
//        cell.detailTextLabel?.text = "Hello, World"
//        cell.imageView?.image = UIImage(named: "1")
//        print("Cell Index : \(indexPath.row)")
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? UITableViewCell
        let vc = segue.destination as? BookDetailViewController
        
        guard let selectedCell = cell, let detailVC = vc else{
            return
        }
        
        if let idx = self.tableView.indexPath(for: selectedCell){
            detailVC.book = self.books[idx.row]
        }
        
        
    }
}

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

