import UIKit

class TableSectionHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "TableSectionHeader"
    private let titleLabel = UILabel()
 
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) { fatalError() }
    
    private func setupViews() {
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
