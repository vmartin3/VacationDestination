//
//  AddVacationDestVC.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Destinations.h"


@interface AddDestination : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)addNewDestination:(id)sender;
- (IBAction)addImagePressed:(id)sender;
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo;
- (NSManagedObjectContext *)managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *destinationNameField;
@property (weak, nonatomic) IBOutlet UITextField *destinationDescriptionField;
@property (weak, nonatomic) IBOutlet UIImageView *destinationImage;
@property UIImagePickerController *pickDestinationImage;
@property NSManagedObjectContext *context;

@end
