import Reactant

final class NoteModificationController: ControllerBase<Void, NoteModificationRootView> {
    struct Properties {
        let note: Note?
    }

    private let properties: Properties

    init(properties: Properties) {
        self.properties = properties

        super.init(title: properties.note?.title ?? "New Note")
    }

    override func afterInit() {
        rootView.componentState = properties.note ?? Note(id: UUID().uuidString, title: "", body: "")
    }
}
