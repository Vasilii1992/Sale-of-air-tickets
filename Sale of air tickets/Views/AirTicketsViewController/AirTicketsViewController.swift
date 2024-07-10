
import UIKit

class AirTicketsViewController: UIViewController {
    
    var offers: [Offer] = MockData.shared.offers
    
    

    private lazy var viewManager: ViewManager = {
        return ViewManager(controller: self)
    }()
    
    lazy private var width: CGFloat = {
        return view.frame.width - 20
    }()
    lazy private var height: CGFloat = {
        return (view.frame.height) / 6
    }()
    
    lazy var musicTitle = viewManager.createMusicTitle()
    
    // вью на которой наши текст филды
    lazy var backForSearchBar = viewManager.createBackForSearchBar()
    lazy var backIntoSearchBar = viewManager.createBackIntoSearchBarBackIntoSearchBar()
   // коллекция
    lazy var collectionView = viewManager.createCollectionView()

     lazy var fromTextField = viewManager.createFromTextField(color: UIColor(hex: "#3E3F43FF")!)
     lazy var toTextField = viewManager.createToTextField(color: UIColor(hex: "#3E3F43FF")!)
    lazy var headerStack = viewManager.createHeaderStack(backForSearchBar: backForSearchBar)
    
    lazy var searchStack = viewManager.createSearchStack(fromTextField: fromTextField, toTextField: toTextField)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#0C0C0CFF")
        setupViews()
        setupConstraints()
        setupDelegate()
        fetchOffers()
        loadLastFromTextFieldValue()
  
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLastFromTextFieldValue()
    }
    
    func navigateToSearchViewController() {
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func fetchOffers() {
        NetworkService.shared.fetchOffers { [weak self] result in
            switch result {
            case .success(let offers):
                DispatchQueue.main.async {
                    self?.offers = offers
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching offers: \(error)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 450, width: view.frame.size.width, height: 214).integral
    }

    func setupViews() {
        view.addSubview(headerStack)
        view.addSubview(musicTitle)
        view.addSubview(collectionView)
        
        backForSearchBar.addSubview(backIntoSearchBar)
        backIntoSearchBar.addSubview(searchStack)
        
        collectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.identifier)
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        fromTextField.delegate = self
        toTextField.delegate = self

    }
}
