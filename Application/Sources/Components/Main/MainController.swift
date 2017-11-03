import Reactant

final class MainController: ControllerBase<Void, MainRootView> {
    struct Reactions {
        let newNote: () -> Void
        let modifyNote: (Note) -> Void
    }

    private let reactions: Reactions
    init(reactions: Reactions) {
        self.reactions = reactions
        super.init(title: "RNotes")
    }

    override func afterInit() {
        let notes = [
            Note(id: UUID().uuidString, title: "Groceries", body: "Milk, honey, 2 lemons, 3 melons, a cat"),
            Note(id: UUID().uuidString, title: "TODO", body: "Workout, take Casey on a date, workout some more"),
            Note(id: UUID().uuidString, title: "Diary", body: "Today I found out that I'm gonna be promoted tomorrow! I'm so excited as I don't know what to expect from the new job position. Looking forward to it though.")
        ]
        rootView.componentState = notes

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .plain) { [reactions] in
            reactions.newNote()
        }
    }

    override func act(on action: PlainTableViewAction<NoteCell>) {
        switch action {
        case .selected(let note):
            reactions.modifyNote(note)
        case .refresh, .rowAction(_, _):
            break
        }
    }
}
