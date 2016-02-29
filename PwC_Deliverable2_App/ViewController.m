//
//  ViewController.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/15/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "PostCell.h"
#import "Singleton.h"
@import UIKit;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Creating instance of DataService which is a singleton and will return the same instance of the class when it is created allowing access to the data from any class
    myData = [DataService sharedService];
    
    //Look for data in this table
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //Loads previous post and listens for when new posts are loaded
    [myData loadPosts];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onPostsLoaded:) name:@"postsLoaded" object:nil];
}

//Overwriting necessary Table Methods when working with UITableView
- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Creates number of rows based on the length of the array aka how many posts there are
    return myData.loadedPosts.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    self.post = myData.loadedPosts[indexPath.row];
    
    PostCell *cell = (PostCell*)[tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    if (cell) {
        [cell configureCell:self.post];
        return cell;
    }else{
        cell = [[PostCell alloc]init];
        [cell configureCell:self.post];
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[myData loadedPosts] removeObjectAtIndex:indexPath.row];
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
