//
//  ViewController.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/15/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "ViewController.h"
#import "PostCell.h"
@import UIKit;

@interface ViewController ()
    @property NSMutableArray *destinations;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Look for data in this table
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSManagedObjectContext *)managedObjectContext{
    NSManagedObjectContext *context;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}
                                           
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // Fetch the destinations from database
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Destinations"];
    self.destinations = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
        
    [self.tableView reloadData];
}

//Overwriting necessary Table Methods when working with UITableView
- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Creates number of rows based on the length of the array aka how many posts there are
    return self.destinations.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    PostCell *cell = (PostCell*)[tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Destinations *destination = [self.destinations objectAtIndex:indexPath.row];
    if (cell) {
        [cell configureCell:destination];
        return cell;
    }else{
        cell = [[PostCell alloc]init];
        [cell configureCell:destination];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [[self managedObjectContext] deleteObject:[self.destinations objectAtIndex:indexPath.row]];
        [[self managedObjectContext]save:nil];
        
        [self.destinations removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 92.0;
}

- (void)onPostsLoaded:(NSNotification *)notif{
    [self.tableView reloadData];
}

//Displays normal homescreen and exits out of information page
- (IBAction)gotItButtonPressed:(id)sender {
    [self isHidingInstructionScreen:YES];
}

//Brings up or unhides the information page
- (IBAction)informationButtonPressed:(id)sender {
    [self isHidingInstructionScreen:NO];
}

-(void)isHidingInstructionScreen:(BOOL)setHiding {
    self.gotItButton.hidden = setHiding;
    self.detail1.hidden = setHiding;
    self.detail2.hidden = setHiding;
    self.detail3.hidden = setHiding;
    self.aboutText.hidden= setHiding;
    self.welcomeText.hidden= setHiding;
    self.logoInstructionScreen.hidden = setHiding;
    self.background.hidden=setHiding;
    self.informationScreen.hidden = setHiding;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
