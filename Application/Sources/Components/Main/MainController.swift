import Reactant

final class MainController: ControllerBase<Void, MainRootView> {
    struct Dependencies {
        let noteService: NoteService
    }
    struct Reactions {
        let newNote: () -> Void
        let modifyNote: (Note) -> Void
    }

    private let dependencies: Dependencies
    private let reactions: Reactions
    
    init(dependencies: Dependencies, reactions: Reactions) {
        self.dependencies = dependencies
        self.reactions = reactions
        super.init(title: "RNotes")
    }

    override func afterInit() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .plain) { [reactions] in
            reactions.newNote()
        }

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Wipe", style: .plain) { [unowned self, dependencies] in
            try? dependencies.noteService.deleteNotes()
            self.invalidate()
        }
    }

    override func update() {
        do {
            rootView.componentState = try dependencies.noteService.loadNotes()
        } catch let error {
            print("Failed to load saved notes:", error.localizedDescription)
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

    override func viewWillAppear(_ animated: Bool) {
        invalidate()
        super.viewWillAppear(animated)
    }
}
