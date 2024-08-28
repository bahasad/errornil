//error nil

import UIKit


class NewsSectionHeader: UICollectionReusableView{
    
    static let reuseID: String = "SectionHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.addArrangedSubview(headerText)
        $0.addArrangedSubview(headerBtn)
        return $0
    }(UIStackView())
    
    
    lazy var headerText: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .black)
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var headerBtn: UIButton = {
        $0.setTitleColor(.black, for: .normal)
        return $0
    }(UIButton())
    
    
    func setupHeader(text: String, type: HeaderType){
        
        addSubview(hStack)
        
        headerText.text = text
        switch type {
        case .news:
            headerBtn.setImage(UIImage(named: "btnHeader"), for: .normal)
        case .event:
            headerBtn.setTitle("Подробнее", for: .normal)
        case .users:
            headerBtn.setTitle("Показать всех", for: .normal)
        }
        
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
    }
    
    
}
