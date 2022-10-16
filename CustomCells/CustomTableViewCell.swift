//
//  CustomTableViewCell.swift
//  CustomCells
//
//  Created by Алексей Гайдуков on 15.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let indentifire = "CustomTableViewCell"
    
    private let _swith: UISwitch = {
       let _swith = UISwitch()
        _swith.onTintColor = .blue
        _swith.isOn = true
        return _swith
    }()
    
    private let myImage: UIImageView = {
      let image = UIImageView()
        image.image = UIImage(named: "Cats1")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let myLable: UILabel = {
       let lable = UILabel()
        lable.textColor = .white
        lable.font = .systemFont(ofSize: 17, weight: .bold)
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(_swith)
        contentView.addSubview(myLable)
        contentView.addSubview(myImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        myLable.text = text
        myImage.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLable.text = nil
        myImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
        let switchSize = _swith.sizeThatFits(contentView.frame.size)
        
        _swith.frame = CGRect(
            x: 5,
            y: (contentView.frame.size.height - switchSize.height) / 2,
            width: switchSize.width,
            height: switchSize.height
        )
        
        myLable.frame = CGRect(
            x: 10+_swith.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 10 - _swith.frame.size.width - imageSize,
            height: contentView.frame.size.height
        )
        
        myImage.frame = CGRect(
            x: contentView.frame.size.width - imageSize,
            y: 3,
            width: imageSize,
            height: imageSize
        )
    }
    
}
