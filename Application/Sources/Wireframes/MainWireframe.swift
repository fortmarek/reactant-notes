import UIKit
import Reactant

final class MainWireframe: Wireframe {
    private let module: DependencyModule

    init(module: DependencyModule) {
        self.module = module
    }

    func entrypoint() -> UIViewController {
        let mainController = main()
        return UINavigationController(rootViewController: mainController)
    }

    private func main() -> MainController {
        return create { provider in
            let dependencies = MainController.Dependencies(noteService: module.noteService)
            let reactions = MainController.Reactions(
                newNote: {
                    provider.navigation?.push(controller: self.noteModification(note: nil))
                },
                modifyNote: { note in
                    provider.navigation?.push(controller: self.noteModification(note: note))
                })
            return MainController(dependencies: dependencies, reactions: reactions)
        }
    }

    private func noteModification(note: Note?) -> NoteModificationController {
        return create { provider in
            let dependencies = NoteModificationController.Dependencies(noteService: module.noteService)
            let properties = NoteModificationController.Properties(title: note?.title ?? "New Note")
            return NoteModificationController(dependencies: dependencies, properties: properties)
                .with(state: note ?? Note(id: UUID().uuidString, title: "", body: ""))
        }
    }
}
