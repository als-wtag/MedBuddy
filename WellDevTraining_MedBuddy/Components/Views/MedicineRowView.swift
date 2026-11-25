import UIKit

class MedicineRowView2: UIView {
    
    private let medicineIcon = UIImageView()
    private let medicineTextWraper = UIStackView()
    private let medicineLabel = UILabel()
    private let medicineSubLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        setupMedicineIcon()
        setupMedicineTextWraper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 80)])
    }
    
    private func addSubviews() {
        addSubview(medicineIcon)
        addSubview(medicineTextWraper)
    }
    
    private func setupMedicineIcon() {
        medicineIcon.translatesAutoresizingMaskIntoConstraints = false
        medicineIcon.image = UIImage.tablet1
        NSLayoutConstraint.activate([
            medicineIcon.heightAnchor.constraint(equalToConstant: 60),
            medicineIcon.widthAnchor.constraint(equalToConstant: 60),
            medicineIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            medicineIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupMedicineLabel() {
        medicineLabel.text = "Metformin 500mg"
        medicineLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        medicineLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMedicineSubLabel() {
        medicineSubLabel.text = "1 tablet - 9:00 AM"
        medicineSubLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        medicineSubLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMedicineTextWraper() {
        medicineTextWraper.axis = .vertical
        medicineTextWraper.translatesAutoresizingMaskIntoConstraints = false
        setupMedicineLabel()
        setupMedicineSubLabel()
        medicineTextWraper.addArrangedSubview(medicineLabel)
        medicineTextWraper.addArrangedSubview(medicineSubLabel)
        NSLayoutConstraint.activate([
            medicineTextWraper.leadingAnchor.constraint(equalTo: medicineIcon.trailingAnchor, constant: 24),
            medicineTextWraper.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configure(title: String, subTitle: String, imageText: String = "tablet_1") {
        medicineLabel.text = title
        medicineSubLabel.text = subTitle
        medicineIcon.image = UIImage(named: imageText)
    }
}
