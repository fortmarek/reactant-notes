import Reactant
import RxSwift

enum NoteModificationAction {
    case titleChanged(String)
    case bodyChanged(String)
}

final class NoteModificationRootView: ViewBase<Note, NoteModificationAction> {
    let titleTextField = TextField()
    let bodyTextView = UITextView()

    override var actions: [Observable<NoteModificationAction>] {
        return [
            titleTextField.rx.text.skip(1).replaceNilWith("").map(NoteModificationAction.titleChanged),
            bodyTextView.rx.text.skip(1).replaceNilWith("").map(NoteModificationAction.bodyChanged),
        ]
    }

    override func update() {
        titleTextField.text = componentState.title
        bodyTextView.text = componentState.body
    }

    override func loadView() {
        children(
            titleTextField,
            bodyTextView
        )
    }
}
