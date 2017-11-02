import Reactant

final class MainRootView: PlainTableView<NoteCell> {
    init() {
        super.init()

        footerView = UIView() // this is so that cell dividers end after the last cell
        rowHeight = NoteCell.height
        separatorStyle = .singleLine
        tableView.contentInset.bottom = 0
    }
}
