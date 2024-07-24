
import UIKit

class ViewController: UIViewController {
    
    lazy var uiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "myImage")
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var viewForUIimageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewForFamilyAndName: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var uiImageViewForFamily: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forFamily")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var stackForImageAndName: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        $0.text = "Имя Фамилия"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var editButton: UIButton = {
        $0.setTitle("редактировать", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.frame.size = CGSize(width: 147, height: 34)
        $0.layer.cornerRadius = 5
        return $0
    }(UIButton())
    
    lazy var addDescLabel = UILabel()
    
    lazy var changePassLabel = UILabel()
    
    lazy var oldPassTextField = UITextField()
    
    lazy var newPassTextField = UITextField()
    
    lazy var textView: UITextView = {
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())
    
    lazy var saveBtn: UIButton = {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .blue
        $0.setTitle("Сохранить", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor( .white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewForUIimageView)
        viewForUIimageView.addSubview(uiImageView)
        view.addSubview(viewForFamilyAndName)
        viewForFamilyAndName.addSubview(uiImageViewForFamily)
        viewForFamilyAndName.addSubview(stackForImageAndName)
        view.addSubview(addDescLabel)
        view.addSubview(textView)
        
        
        setConstraintForViewForUIImageView()
        setConstrForViewFamilyAndName()
        setStackWIthNameAndLabel()
        setAddDescLabel()
        setTextView()
        setchangePassLabel()
        setOldPassTextField()
        setNewPassTextField()
        setSaveBtn()
    }
    
    func setConstraintForViewForUIImageView() {
        NSLayoutConstraint.activate([
            viewForUIimageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewForUIimageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewForUIimageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewForUIimageView.heightAnchor.constraint(equalToConstant: 156)
        ])
        
        NSLayoutConstraint.activate([
            uiImageView.topAnchor.constraint(equalTo: viewForUIimageView.topAnchor),
            uiImageView.leadingAnchor.constraint(equalTo: viewForUIimageView.leadingAnchor),
            uiImageView.trailingAnchor.constraint(equalTo: viewForUIimageView.trailingAnchor),
            uiImageView.bottomAnchor.constraint(equalTo: viewForUIimageView.bottomAnchor)
        ])
    }
    
    func setConstrForViewFamilyAndName() {
        NSLayoutConstraint.activate([
            viewForFamilyAndName.topAnchor.constraint(equalTo: viewForUIimageView.bottomAnchor, constant: 33),
            viewForFamilyAndName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForFamilyAndName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForFamilyAndName.heightAnchor.constraint(equalToConstant: 100)
        ])
        uiImageViewForFamily.frame = CGRect(x: 30, y: 0, width: 100, height: 100)
    }
    
    func setStackWIthNameAndLabel() {
        stackForImageAndName.addArrangedSubview(nameLabel)
        stackForImageAndName.addArrangedSubview(editButton)
        stackForImageAndName.frame = CGRect(x: 146, y: 19, width: 147, height: 50)
    }
    
    func setAddDescLabel() {
        addDescLabel = self.setSharedLabel(text: "Добавить описание")
        view.addSubview(addDescLabel)
        NSLayoutConstraint.activate([
            addDescLabel.topAnchor.constraint(equalTo: viewForFamilyAndName.bottomAnchor, constant: 52),
            addDescLabel.leadingAnchor.constraint(equalTo: viewForFamilyAndName.leadingAnchor, constant: 30),
            addDescLabel.trailingAnchor.constraint(equalTo: viewForFamilyAndName.trailingAnchor),
        ])
        
    }
    
    func setTextView() {
        textView.backgroundColor = UIColor(hex: "#F0F0F0")
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: addDescLabel.bottomAnchor, constant: 9),
            textView.leadingAnchor.constraint(equalTo: addDescLabel.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: viewForFamilyAndName.trailingAnchor, constant: -30),
            textView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func setchangePassLabel() {
        changePassLabel = setSharedLabel(text: "Изменить пароль")
        view.addSubview(changePassLabel)
        NSLayoutConstraint.activate([
            changePassLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 33),
            changePassLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            changePassLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor)
            
        ])
    }
    
    func setOldPassTextField() {
        oldPassTextField = setSharedTextField(placeholder: "Старый пароль")
        view.addSubview(oldPassTextField)
        NSLayoutConstraint.activate([
            oldPassTextField.topAnchor.constraint(equalTo: changePassLabel.bottomAnchor, constant: 9),
            oldPassTextField.leadingAnchor.constraint(equalTo: changePassLabel.leadingAnchor),
            oldPassTextField.trailingAnchor.constraint(equalTo: changePassLabel.trailingAnchor),
            oldPassTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
    }
    
    func setNewPassTextField() {
        newPassTextField = setSharedTextField(placeholder: "Новый пароль")
        view.addSubview(newPassTextField)
        NSLayoutConstraint.activate([
            newPassTextField.topAnchor.constraint(equalTo: oldPassTextField.bottomAnchor, constant: 9),
            newPassTextField.leadingAnchor.constraint(equalTo: oldPassTextField.leadingAnchor),
            newPassTextField.trailingAnchor.constraint(equalTo: oldPassTextField.trailingAnchor),
            newPassTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
    }
    
    func setSaveBtn() {
        view.addSubview(saveBtn)
        NSLayoutConstraint.activate([
            saveBtn.topAnchor.constraint(equalTo: newPassTextField.bottomAnchor, constant: 100),
            saveBtn.leadingAnchor.constraint(equalTo: newPassTextField.leadingAnchor),
            saveBtn.trailingAnchor.constraint(equalTo: newPassTextField.trailingAnchor),
            saveBtn.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func setSharedTextField(placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = UIColor(hex: "#F0F0F0")
        tf.layer.cornerRadius = 10
        tf.placeholder = placeholder
        tf.textColor = UIColor(hex: "#A6A6A6")
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }
    
    func setSharedLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
}


//googled from https://www.omaralbeik.com/blog/uicolor-from-hex copy pasted this extension to convert hex to rgb and took hex color from Figma
extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") { // Remove the '#' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            hexString = String(hexString[start...])
        }
        if hexString.lowercased().hasPrefix("0x") { // Remove the '0x' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 2)
            hexString = String(hexString[start...])
        }

        let r, g, b, a: CGFloat
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil } // Make sure the string is a hex code.
        switch hexString.count {
        case 3, 4: // Color is in short hex format
            var updatedHexString = ""
            hexString.forEach { updatedHexString.append(String(repeating: String($0), count: 2)) }
            hexString = updatedHexString
            self.init(hex: hexString)

        case 6: // Color is in hex format without alpha.
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            b = CGFloat(hexNumber & 0x0000FF) / 255.0
            a = 1.0
            self.init(red: r, green: g, blue: b, alpha: a)

        case 8: // Color is in hex format with alpha.
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(hexNumber & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)

        default: // Invalid format.
            return nil
        }
    }
}

