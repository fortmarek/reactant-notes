import Reactant
import UIKit

final class NoteCell: ViewBase<Note, Void> {
    static let height: CGFloat = 80

    private let title = UILabel()
    private let preview = UILabel()

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