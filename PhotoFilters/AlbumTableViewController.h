//
//  AlbumTableViewController.h
//  PhotoFilters
//
//  Created by Vincent Chau on 7/31/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewController : UITableViewController 

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@property (strong,nonatomic) NSMutableArray *albums;


@end
