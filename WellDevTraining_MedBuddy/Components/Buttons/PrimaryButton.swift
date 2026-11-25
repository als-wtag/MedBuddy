import UIKit

final class PrimaryButton: UIButton {

    init(title: String, systemImageName: String? = nil) {
        super.init(frame: .zero)
        setupConfiguration(title: title, systemImageName: systemImageName)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfiguration(title: title(for: .normal) ?? "", systemImageName: nil)
    }

    private func setupConfiguration(title: String, systemImageName: String?) {
        var config = UIButton.Configuration.filled()
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        config.attributedTitle = attributedTitle
        config.image = UIImage(systemName: systemImageName ?? "")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
            pointSize: 14,
            weight: .regular,
            scale: .default
        )
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.buttonSize = .large
        config.cornerStyle = .fixed
        config.background.cornerRadius = 22
        config.baseBackgroundColor = UIColor(hex: "#1c61fd")
        config.baseForegroundColor = .white
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.configuration = config
    }

    override func updateConfiguration() {
        guard var config = configuration else { return }
        switch state {
        case .highlighted:
            config.baseBackgroundColor = UIColor.systemBlue.withAlphaComponent(0.8)
            config.baseForegroundColor = .white
        case .disabled:
            config.baseBackgroundColor = .systemGray4
            config.baseForegroundColor = .systemGray
        default:
            config.baseBackgroundColor = UIColor(hex: "#1c61fd")
            config.baseForegroundColor = .white
        }

        self.configuration = config
    }
}
