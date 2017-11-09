import Reactant

final class NoteModificationController: ControllerBase<Note, NoteModificationRootView> {
    struct Dependencies {
        let noteService: NoteService
    }
    struct Properties {
        let title: String
    }

    private let dependencies: Dependencies
    private let properties: Properties

    init(dependencies: Dependencies, properties: Properties) {
        self.dependencies = dependencies
        self.properties = properties

        super.init(title: properties.title)
    }

    override func update() {
        rootView.componentState = componentState
    }

    override func act(on action: NoteModificationAction) {
        switch action {
        case .titleChanged(let title):
            componentState.title = title
            do {
                try dependencies.noteService.save(note: componentState)
            } catch let error {
                print("Failed to save the note:", error.localizedDescription)
            }
        case .bodyChanged(let body):
            componentState.body = body
            do {
                try dependencies.noteService.save(note: componentState)
            } catch let error {
                print("Failed to save the note:", error.localizedDescription)
            }
        }
    }
}
