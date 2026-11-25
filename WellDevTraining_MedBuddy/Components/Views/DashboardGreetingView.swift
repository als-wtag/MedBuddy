import UIKit

class DashboardGreetingView: UIView {
    
    private let greetingText = UILabel()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60)
        ])
        addSubviews()
        setupGreetingText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(greetingText)
    }
    
    private func setupGreetingText() {
        greetingText.text = "Hello,\nSarowar!"
        greetingText.numberOfLines = 2
        greetingText.textColor = UIColor(hex: "#FFFFFF")
        greetingText.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        greetingText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greetingText.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            greetingText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
    }
    
    func configure(text: String, colorHex: String = "#FFFFFF", fontSize: Float = 25) {
        greetingText.text = text
        greetingText.textColor = UIColor(hex: colorHex)
        greetingText.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: .bold)
    }
}
