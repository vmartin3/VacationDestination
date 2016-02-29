//
//  AddVacationDestVC.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Singleton.h"
#import "DataService.h"


@interface AddDestination : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    Singleton* mySingleton;
    DataService* myData;
}
- (IBAction)addNewDestination:(id)sender;
- (IBAction)addImagePressed:(id)sender;
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo;


@property (weak, nonatomic) IBOutlet UITextField *destinationNameField;
@property (weak, nonatomic) IBOutlet UITextField *destinationDescriptionField;
@property (weak, nonatomic) IBOutlet UIImageView *destinationImage;
@property UIImagePickerController *pickDestinationImage;

@end
