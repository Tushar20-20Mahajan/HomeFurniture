
import UIKit

class FurnitureDetailViewController: UIViewController {
    
    var furniture: Furniture?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        
        // User to make a selection or use an existing photo
        print("Photo")
        let alertController = UIAlertController(title: nil, message: "Test Message", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("User Selected camera action")})
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
        print("where")
    }
    
}
