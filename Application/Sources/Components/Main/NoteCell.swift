import Reactant
import UIKit

final class NoteCell: ViewBase<Note, Void>, Reactant.TableViewCell {
    static let height: CGFloat = 80

    private let title = UILabel().styled(using: Styles.title)
    private let preview = UILabel().styled(using: Styles.preview)

    override func update() {
        title.text = componentState.title
        preview.text = componentState.body
    }

    override func loadView() {
        children(
            title,
            preview
        )
    }
}

extension NoteCell {
    fileprivate struct Styles {
        static func title(label: UILabel) {
            label.numberOfLines = 1
            label.lineBreakMode = .byTruncatingTail
            label.font = UIFont.systemFont(ofSize: 16)
        }

        static func preview(label: UILabel) {
            label.numberOfLines = 2
            label.lineBreakMode = .byTruncatingTail
            label.font = UIFont.systemFont(ofSize: 12)
        }
    }
}
