//
//  AddSkillVC.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "AddDestination.h"
#import "Post.h"
#import "Singleton.h"

@implementation AddDestination


- (void)viewDidLoad {
    [super viewDidLoad];
     myData = [DataService sharedService];
    
    //Makes image into a circle
    [[self.destinationImage layer]setCornerRadius:self.destinationImage.frame.size.width / 2];
    [self.destinationImage setClipsToBounds: YES];
    
    self.pickDestinationImage = [[UIImagePickerController alloc]init];
    self.pickDestinationImage.delegate = self;
}

//Brings up camera roll and replaces the placeholder image with image selected
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    [self.pickDestinationImage dismissViewControllerAnimated:YES completion:nil];
    [self.destinationImage setImage:image];
}

- (IBAction)addImagePressed:(id)sender {
    //Removes 'Add Image+' text once image is selected
    [sender setTitle:@"" forState:normal];
    [self presentViewController: self.pickDestinationImage animated: YES completion: nil];
}

- (IBAction)addNewDestination:(id)sender {
    if (self.destinationNameField && self.destinationDescriptionField && self.destinationImage) {
        
    UIImage *image = self.destinationImage.image;
    NSString *imagePath;
    imagePath = [myData saveImageAndCreatePath:image];
    
    Post *post = [[Post alloc]initWithDestinationInformation:imagePath destinationName:self.destinationNameField.text destinationDescription:self.destinationDescriptionField.text];
    [myData addPosts:post];
        
    }
}
@end
