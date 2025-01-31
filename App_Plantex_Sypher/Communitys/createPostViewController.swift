//
//  createPostViewController.swift
//  App_Plantex_Sypher
//
//  Created by DIWAKAR KUMAR on 24/01/25.
//

import UIKit

class createPostViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postDecs: UITextField!
    
    @IBOutlet weak var postTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        postImage.addGestureRecognizer(tapGesture)
        postImage.isUserInteractionEnabled = true
    }
    @objc func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            postImage.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            postImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func createPost(_ sender: UIButton) {
        
        guard let postTitleText = postTitle.text, !postTitleText.isEmpty,
                  let postDescription = postDecs.text, !postDescription.isEmpty,
                  let selectedImage = postImage.image else {
                let alert = UIAlertController(title: "Error", message: "Please fill all fields and select an image.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
                return
            }
            
            let imageName = UUID().uuidString + ".png"
            
            // Save the image to local storage (optional)
            if let imageData = selectedImage.pngData() {
                let fileManager = FileManager.default
                if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let filePath = documentDirectory.appendingPathComponent(imageName)
                    do {
                        try imageData.write(to: filePath)
                        print("Image saved at: \(filePath)")
                    } catch {
                        print("Error saving image: \(error)")
                    }
                }
            }
            
            // Save the post in the model
            CommunityModel.shared.addPost(profileImage: "defaultProfile.png",
                                          userName: "CurrentUser",
                                          plantImage: imageName,
                                          comment: "\(postTitleText): \(postDescription)")
            
            let alert = UIAlertController(title: "Success", message: "Post created successfully!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true)
        }
        
    }
    
    


