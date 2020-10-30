//
//  ViewController.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/1/20.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var starshipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        
    }
    
    func setUp() {
        
        starshipButton.backgroundColor = UIColor.white
        starshipButton.tintColor = UIColor.gray
        starshipButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        starshipButton.layer.shadowOffset = CGSize(width: 4.0, height: 7.0)
        starshipButton.layer.shadowOpacity = 3.0
        starshipButton.layer.shadowRadius = 7.0
        starshipButton.layer.masksToBounds = false
        starshipButton.layer.cornerRadius = 15.0
        
        
        selectButton.backgroundColor = UIColor.white
        selectButton.tintColor = UIColor.gray
        selectButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        selectButton.layer.shadowOffset = CGSize(width: 4.0, height: 7.0)
        selectButton.layer.shadowOpacity = 3.0
        selectButton.layer.shadowRadius = 7.0
        selectButton.layer.masksToBounds = false
        selectButton.layer.cornerRadius = 15.0
    }
    @IBAction func selectBtnOnClik(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "selectionVC") as! selectionViewController
        navigationController?.pushViewController(vc, animated: true)

        
        
//        let vcCam = UIImagePickerController()
//        vcCam.sourceType = .camera
//        vcCam.allowsEditing = true
//        vcCam.delegate = self
//        present(vcCam, animated: true)
        
    }
    @IBAction func starShipBtnOnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "starshipsVC") as! StarShipsPageViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

            guard let image = info[.editedImage] as? UIImage else {
                print("No image found")
                return
            }

            // print out the image size as a test
            print(image.size)
    }
}

