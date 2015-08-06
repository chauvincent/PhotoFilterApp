//
//  PhotoDetailViewController.m
//  PhotoFilters
//
//  Created by Vincent Chau on 8/3/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Photo.h"
#import "FilterCollectionViewController.h"

@interface PhotoDetailViewController ()

@end

@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.imageView.image = self.photo.image;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"FilterSegue"])
        if ([segue.destinationViewController isKindOfClass:[FilterCollectionViewController class]])
        {
            FilterCollectionViewController *nextVC = segue.destinationViewController;
            nextVC.photo = self.photo;
        }



}


- (IBAction)addFilterButtonPressed:(id)sender {
}

- (IBAction)deleteButtonPressed:(id)sender
{
    [[self.photo managedObjectContext] deleteObject:self.photo];
    [self.navigationController popViewControllerAnimated:YES];
    
    NSError *error = nil;
    [[self.photo managedObjectContext] save:&error];

    if(error)
        NSLog(@"error");
}
@end
