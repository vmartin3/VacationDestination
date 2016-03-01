//
//  ViewController.h
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/15/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AddDestination.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)informationButtonPressed:(id)sender;
- (IBAction)gotItButtonPressed:(id)sender;
- (NSManagedObjectContext *)managedObjectContext;
- (void)viewDidAppear:(BOOL)animated;

//Declaring properties for information screen
@property (weak, nonatomic) IBOutlet UIView         *informationScreen;
@property (weak, nonatomic) IBOutlet UIImageView    *logoInstructionScreen;
@property (weak, nonatomic) IBOutlet UILabel        *aboutText;
@property (weak, nonatomic) IBOutlet UILabel        *welcomeText;
@property (weak, nonatomic) IBOutlet UIImageView    *background;
@property (weak, nonatomic) IBOutlet UIButton       *gotItButton;
@property (weak, nonatomic) IBOutlet UILabel        *detail1;
@property (weak, nonatomic) IBOutlet UILabel        *detail2;
@property (weak, nonatomic) IBOutlet UILabel        *detail3;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

