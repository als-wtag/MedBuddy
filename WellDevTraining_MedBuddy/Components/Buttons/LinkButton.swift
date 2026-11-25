import UIKit

final class LinkButton: UIButton {

    init(title: String, systemImageName: String? = nil) {
        super.init(frame: .zero)
        setupConfiguration(title: title, systemImageName: systemImageName)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfiguration(title: title(for: .normal) ?? "", systemImageName: nil)
    }

    private func setupConfiguration(title: String, systemImageName: String?) {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = UIImage(systemName: "chevron.forward")
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(
            pointSize: 16,
            weight: .regular,
            scale: .default
        )
        config.imagePlacement = .trailing
        config.imagePadding = 4
        config.baseForegroundColor = UIColor(hex: "#1c61fd")
        config.contentInsets = .zero
        self.configuration = config
        self.contentHorizontalAlignment = .center
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
            config.baseBackgroundColor = .white
            config.baseForegroundColor = UIColor(hex: "#1c61fd")
        }

        self.configuration = config
    }
}
