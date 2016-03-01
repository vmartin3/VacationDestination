//
//  AddSkillVC.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/16/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "AddDestination.h"

@implementation AddDestination


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Makes image into a circle
    [[self.destinationImage layer]setCornerRadius:self.destinationImage.frame.size.width / 2];
    [self.destinationImage setClipsToBounds: YES];
    
    self.pickDestinationImage = [[UIImagePickerController alloc]init];
    self.pickDestinationImage.delegate = self;
    
    //Dismiss Keyboard
    [self.destinationNameField setDelegate:self];
    [self.destinationDescriptionField setDelegate:self];
}

//Dismiss Keybaord
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
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

- (NSManagedObjectContext *)managedObjectContext{
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        self.context = [delegate managedObjectContext];
    }
    return self.context;
}

- (IBAction)addNewDestination:(id)sender {
    if (self.destinationNameField && self.destinationDescriptionField && self.destinationImage) {
            NSManagedObjectContext *context = [self managedObjectContext];
        Destinations *newDestination = [NSEntityDescription insertNewObjectForEntityForName:@"Destinations" inManagedObjectContext:context];
        [newDestination setDestinationName:self.destinationNameField.text];
        [newDestination setDestinationDescription:self.destinationDescriptionField.text];
        [newDestination setDestinationImage:self.destinationImage.image];
        [context save:nil];
    }
}
@end
