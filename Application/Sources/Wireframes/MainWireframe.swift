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
            let reactions = MainController.Reactions(
                newNote: {
                    provider.navigation?.push(controller: self.noteModification(note: nil))
                },
                modifyNote: { note in
                    provider.navigation?.push(controller: self.noteModification(note: note))
                })
            return MainController(reactions: reactions)
        }
    }

    private func noteModification(note: Note?) -> NoteModificationController {
        return create { provider in
            let properties = NoteModificationController.Properties(note: note)
            return NoteModificationController(properties: properties)
        }
    }
}
