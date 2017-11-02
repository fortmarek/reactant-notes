import Reactant

final class MainController: ControllerBase<Void, MainRootView> {
    override func afterInit() {
        let notes = [
            Note(title: "Groceries", body: "Milk, honey, 2 lemons, 3 melons, a cat"),
            Note(title: "TODO", body: "Workout, take Casey on a date, workout some more"),
            Note(title: "Dear Diary", body: "Today I found out that I'm gonna be promoted tomorrow! I'm so excited as I don't know what to expect from the new job position. Looking forward to it though.")
        ]
        rootView.componentState = notes
    }
}
