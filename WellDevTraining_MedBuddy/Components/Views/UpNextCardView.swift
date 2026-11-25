import UIKit

class UpNextCardView: UIView {
    private let wraperStack = UIStackView()
    private let headerStack = UIStackView()
    private let cardLabel = UILabel()
    private let seeAllButton = LinkButton(title: "See All")
    private let medicineInfo = MedicineRowView2()
    private let actionButtonsStack = UIStackView()
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        setupTopStack()
        setupActionButtonsStack()
        setupWraperStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 25
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubviews() {
        addSubview(wraperStack)
    }
    
    private func setupWraperStack() {
        wraperStack.translatesAutoresizingMaskIntoConstraints = false
        wraperStack.axis = .vertical
        NSLayoutConstraint.activate([
            wraperStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            wraperStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            wraperStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            wraperStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        wraperStack.addArrangedSubview(headerStack)
        wraperStack.addArrangedSubview(medicineInfo)
        wraperStack.addArrangedSubview(actionButtonsStack)
        wraperStack.spacing = 12
    }
    
    private func setupTopStack() {
        cardLabel.text = "Up Next"
        cardLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        headerStack.axis = .horizontal
        headerStack.addArrangedSubview(cardLabel)
        headerStack.addArrangedSubview(seeAllButton)
        headerStack.alignment = .center
        headerStack.distribution = .equalSpacing
        headerStack.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupActionButtonsStack() {
        actionButtonsStack.axis = .horizontal
        actionButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        let takeNowButton = PrimaryButton(title: "Take Now", systemImageName: "checkmark")
        let skipButton = SecondaryButton(title: "Skip Once", systemImageName: "chevron.right.dotted.chevron.right")
        actionButtonsStack.addArrangedSubview(takeNowButton)
        actionButtonsStack.addArrangedSubview(skipButton)
        actionButtonsStack.spacing = 12
    }
}
