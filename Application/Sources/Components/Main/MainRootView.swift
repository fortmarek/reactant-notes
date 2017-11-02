import Reactant

final class MainRootView: ViewBase<[Note], PlainTableViewAction<NoteCell>> {
    let noteTableView = PlainTableView<NoteCell>(reloadable: false)

    override func update() {
        noteTableView.componentState = .items(componentState)
    }

    override func loadView() {
        noteTableView.footerView = UIView() // this is so that cell dividers end after the last cell
        noteTableView.rowHeight = NoteCell.height
        noteTableView.separatorStyle = .singleLine
        noteTableView.tableView.contentInset.bottom = 0
    }
}
