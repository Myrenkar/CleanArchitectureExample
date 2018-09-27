protocol BoredomPresenterInput {
    func getActivity(response: Boredom.GetActivity.Response)
}

protocol BoredomPresenterOutput: class {
    func addActivity(response: Boredom.GetActivity.ViewModel)
}

class BoredomPresenter: BoredomPresenterInput {
    weak var output: BoredomPresenterOutput?
    
    // MARK: Add activity to list
    func getActivity(response: Boredom.GetActivity.Response) {
        let viewModel = Boredom.GetActivity.ViewModel(activity: response.activity, type: response.type, participants: response.participants, price: response.price)
        output?.addActivity(response: viewModel)
    }
}
