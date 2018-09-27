protocol BoredomInteractorInput {
    func getActivity(request: Boredom.GetActivity.Request)
}

protocol BoredomInteractorOutput: class {
    func addActivity(response: Boredom.GetActivity.Response)
    func handle(error: Error)
}

class BoredomInteractor: BoredomInteractorInput {
    weak var output: BoredomInteractorOutput?

    var worker: BoredomWorker?
    // MARK: Do something

    func getActivity(request: Boredom.GetActivity.Request) {
        worker = BoredomWorker(apiClient: DefaultAPIClient())
        worker?.getActivities(request: request, completionHandler: { [unowned self] result in
            if case .success(let activity) = result {
                self.output?.addActivity(response: activity)
            } else if case .failure(let error) = result {
                self.output?.handle(error: error)
            }
        })
    }
}
