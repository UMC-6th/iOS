//
//  ViewController.swift
//  Week2
//
//  Created by 김승원 on 4/8/24.
//

import UIKit

//let cellID = "Cell"

struct DataModel {
    let title: String
    let place: String
    let time: String
    let price: String
    let mCount: String
    let hCount: String
}

let dataModel: [DataModel] = [
    DataModel(title: "아이폰 12미니 128기가", place: "수궁동", time: "25분 전", price: "200,000원", mCount: "4", hCount: "25"),
    DataModel(title: "아이폰 13mini 블루 팔아요~", place: "구로구 오류제1동", time: "2시간 전", price: "430,000원", mCount: "1", hCount: "3"),
    DataModel(title: "SONY WH-1000 노이즈 캔슬링", place: "소사본동", time: "2분 전", price: "210,000원", mCount: "2", hCount: "7"),
    DataModel(title: "맥북 17년형 15인치", place: "옥길동", time: "1시간 전", price: "1,400,000원", mCount: "6", hCount: "12"),
    DataModel(title: "플레이스테이션 급처", place: "오류 제2동", time: "1분 전", price: "200,000원", mCount: "1", hCount: "0"),
    DataModel(title: "iOS UIKit 어렵네요@ㅠ", place: "괴안동", time: "3일 전", price: "9,999,999원", mCount: "999", hCount: "999"),
    DataModel(title: "title7", place: "place7", time: "time7", price: "price7", mCount: "0", hCount: "0"),
    DataModel(title: "title8", place: "place8", time: "time8", price: "price8", mCount: "6", hCount: "9"),
    DataModel(title: "title9", place: "place9", time: "time9", price: "price9", mCount: "4", hCount: "10"),
    DataModel(title: "title10", place: "place10", time: "time10", price: "price10", mCount: "6", hCount: "11"),
    

]

//let dataModel = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]


class ViewController: UIViewController {

    
    
    // MARK: - Properites
    
    //Views
    let topWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "광명동"
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let bellButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell"), for: .normal)
        btn.tintColor = .black
//        btn.contentMode = .scaleAspectFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let searchButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let menuButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let tableView: UITableView = {
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    // scrollView
//    let scrollView: UIScrollView = {
//        let sv = UIScrollView()
//        sv.backgroundColor = .blue
//        sv.translatesAutoresizingMaskIntoConstraints = false
//        return sv
//    }()
    
//    let contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .brown
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    
    
    // collectionView
//    let mainCollectionView: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        flowLayout.scrollDirection = .horizontal // 이거 왜 반대로??
//        cv.backgroundColor = .yellow
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
   
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        mainCollectionView.dataSource = self
//        mainCollectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .red
        
        addSubViews()
        configureConstraints()
    }
    
    // MARK: - addSubViews
    private func addSubViews() {
        
        view.addSubview(topWhiteView)
        
        topWhiteView.addSubview(locationLabel)
        topWhiteView.addSubview(locationButton)
        topWhiteView.addSubview(bellButton)
        topWhiteView.addSubview(searchButton)
        topWhiteView.addSubview(menuButton)
        
        view.addSubview(tableView)
        
//        view.addSubview(scrollView)
        
//        scrollView.addSubview(contentView)
        
//        contentView.addSubview(mainCollectionView)
//        view.addSubview(mainCollectionView)
//        mainCollectionView.register(mainCell.self, forCellWithReuseIdentifier: cellID)
    
        
    }
    
    // MARK: - Constraint
    private func configureConstraints() {

        // 상단 흰 뷰
        topWhiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topWhiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topWhiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        topWhiteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        topWhiteView.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15).isActive = true
        
        // 위치 라벨
        locationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: topWhiteView.leadingAnchor, constant: 15).isActive = true
        
        // 위치 라벨 옆 화살표 버튼
        locationButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 8).isActive = true
        
        // 종 버튼
        bellButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        bellButton.trailingAnchor.constraint(equalTo: topWhiteView.trailingAnchor, constant: -15).isActive = true
//        bellButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        bellButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        // 돋보기 버튼
        searchButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -8).isActive = true
        
        // 햄버거 버튼
        menuButton.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor, constant: 0).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8).isActive = true
        
        // 테이블 뷰
        tableView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // 스크롤 뷰
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
//            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2.0),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        ])
        
//        scrollView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
//        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
//        contentView.heightAnchor.constraint(equalToConstant: scrollView.frame.height).isActive = true
        
        // 콜렉션 뷰
//        mainCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
//        mainCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
//        mainCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
//        mainCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
//        mainCollectionView.topAnchor.constraint(equalTo: topWhiteView.bottomAnchor, constant: 0).isActive = true
//        mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    

}

// MARK: - extension

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let rowData = dataModel[indexPath.row]
        
        // 사진
        let cellImageView: UIImageView = {
            let iv = UIImageView(image: UIImage(named: "tempImage"))
            iv.layer.cornerRadius = 8.0
            iv.layer.masksToBounds = true
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        cell.contentView.addSubview(cellImageView)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 15),
            cellImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 15),
            cellImageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -15),
            cellImageView.heightAnchor.constraint(equalToConstant: 100),
            cellImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        // 제목
        let titleLabel: UILabel = {
            let lb = UILabel()
            lb.text = rowData.title
            lb.textColor = .black
            lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            lb.backgroundColor = .clear
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        cell.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15)
        ])
        
        // 위치, 시간
        let placeLabel: UILabel = {
            let lb = UILabel()
            lb.text = rowData.place + ", " + rowData.time
            lb.textColor = .gray
            lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            lb.backgroundColor = .clear
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        cell.contentView.addSubview(placeLabel)
        
        NSLayoutConstraint.activate([
            placeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            placeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0)
        ])
        
        // 가격
        let priceLabel: UILabel = {
            let lb = UILabel()
            lb.text = rowData.price
            lb.textColor = .black
            lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            lb.backgroundColor = .clear
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        cell.contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: placeLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: placeLabel.leadingAnchor, constant: 0)
        ])
        
        // 채팅 수
        
        let messageCountLabel: UILabel = {
            let lb = UILabel()
            lb.text = rowData.mCount
            lb.textColor = .black
            lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            lb.backgroundColor = .clear
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        cell.contentView.addSubview(messageCountLabel)
        
        NSLayoutConstraint.activate([
            messageCountLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -15),
            messageCountLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -15),
        ])
        
        let messageImageView: UIImageView = {
            let iv = UIImageView(image: UIImage(systemName: "message"))
            iv.tintColor = .black
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        cell.contentView.addSubview(messageImageView)
        
        NSLayoutConstraint.activate([
            messageImageView.trailingAnchor.constraint(equalTo: messageCountLabel.leadingAnchor, constant: -2),
            messageImageView.centerYAnchor.constraint(equalTo: messageCountLabel.centerYAnchor),
            messageImageView.heightAnchor.constraint(equalToConstant: 13),
            messageImageView.widthAnchor.constraint(equalToConstant: 13)
        ])
        
        // 하트 수
        
        let heartCountLabel: UILabel = {
            let lb = UILabel()
            lb.text = rowData.hCount
            lb.textColor = .black
            lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            lb.backgroundColor = .clear
            lb.translatesAutoresizingMaskIntoConstraints = false
            return lb
        }()
        
        cell.contentView.addSubview(heartCountLabel)
        
        NSLayoutConstraint.activate([
            heartCountLabel.trailingAnchor.constraint(equalTo: messageImageView.leadingAnchor, constant: -6),
            heartCountLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -15),
        ])
        
        let heartImageView: UIImageView = {
            let iv = UIImageView(image: UIImage(systemName: "heart"))
            iv.tintColor = .black
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        cell.contentView.addSubview(heartImageView)
        
        NSLayoutConstraint.activate([
            heartImageView.trailingAnchor.constraint(equalTo: heartCountLabel.leadingAnchor, constant: -2),
            heartImageView.centerYAnchor.constraint(equalTo: heartCountLabel.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalToConstant: 13),
            heartImageView.widthAnchor.constraint(equalToConstant: 13)
        ])
        
        return cell

    }
    
}

//extension UIViewController: UICollectionViewDataSource {
//    
//    // 셀의 개수
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//    
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! mainCell
//        cell.backgroundColor = .red
//        return cell
//    }
//    
//    
//}
//
//extension UIViewController: UICollectionViewDelegate {
//    
//}
//
//extension UIViewController: UICollectionViewDelegateFlowLayout {
//    // 셀 크기 설정
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
//    
//    // 디폴트 스페이싱 설정
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    
//}
