import UIKit

struct Section {
    let title: String
    let items: [String]
}

class UpcomingMedicinesView: UIView {
    let topStack = UIStackView()
    let cardLabel = UILabel()
    let seeAllButton = LinkButton(title: "See All")
    let upcomingMedicinesTable = UITableView(frame: .zero, style: .grouped)
    var sections: [Section] = []
    
    init() {
        super.init(frame: .zero)
        setupView()
        addSubviews()
        setupTopStack()
        setupUpcomingMedicinesTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        layer.cornerRadius = 25
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        addSubview(topStack)
        addSubview(upcomingMedicinesTable)
    }
    
    func setupTopStack() {
        cardLabel.text = "Upcoming Medicines"
        cardLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .horizontal
        topStack.addArrangedSubview(cardLabel)
        topStack.addArrangedSubview(seeAllButton)
        topStack.alignment = .center
        topStack.distribution = .equalSpacing
        topStack.heightAnchor.constraint(equalToConstant: 24).isActive = true
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            topStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setupUpcomingMedicinesTable() {
        upcomingMedicinesTable.register(TableSectionHeader.self, forHeaderFooterViewReuseIdentifier: TableSectionHeader.reuseIdentifier)
        upcomingMedicinesTable.dataSource = self
        upcomingMedicinesTable.delegate = self
        upcomingMedicinesTable.rowHeight = 80
        upcomingMedicinesTable.translatesAutoresizingMaskIntoConstraints = false
        upcomingMedicinesTable.sectionHeaderTopPadding = 0
        upcomingMedicinesTable.separatorStyle = .none
        sections = [Section(title: "Later Today", items: ["Napa"]), Section(title: "Tomorrow", items: ["Ace", "Sergel"])]
        NSLayoutConstraint.activate([
            upcomingMedicinesTable.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 12),
            upcomingMedicinesTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upcomingMedicinesTable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            upcomingMedicinesTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UpcomingMedicinesView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let contents = MedicineRowView2()
        contents.configure(title: sections[indexPath.section].items[indexPath.row], subTitle: "genericName - strength")
        cell.contentView.addSubview(contents)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension UpcomingMedicinesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = upcomingMedicinesTable.dequeueReusableHeaderFooterView(
            withIdentifier: TableSectionHeader.reuseIdentifier
        ) as? TableSectionHeader else {
            return nil
        }
        header.configure(title: sections[section].title)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}
