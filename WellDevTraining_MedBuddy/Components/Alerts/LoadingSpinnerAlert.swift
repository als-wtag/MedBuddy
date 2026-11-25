import UIKit

class LoadingSpinnerAlert {
    static func loadingAlert(message: String = "Please wait...") -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        alert.view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor),
            spinner.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 20)
        ])
        return alert
        
//        present(alert, animated: true)
    }
}

