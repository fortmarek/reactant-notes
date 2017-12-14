import Reactant
import UIKit

final class NoteCell: ViewBase<Note, Void>, Reactant.TableViewCell {
    static let height: CGFloat = 80

    let title = UILabel()
    let preview = UILabel()

    override func update() {
        title.text = componentState.title
        preview.text = componentState.body
    }

    func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let style = { self.apply(style: highlighted ? Styles.highlightedBackground : Styles.normalBackground) }
        if animated {
            UIView.animate(withDuration: 0.7, animations: style)
        } else {
            style()
        }
    }
}

extension NoteCell.Styles {
    static func normalBackground(_ cell: NoteCell) {
        cell.backgroundColor = nil
    }

    static func highlightedBackground(_ cell: NoteCell) {
        cell.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    }
}
