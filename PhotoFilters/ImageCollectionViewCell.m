//
//  ImageCollectionViewCell.m
//  PhotoFilters
//
//  Created by Vincent Chau on 8/2/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import "ImageCollectionViewCell.h"

#define IMAGEVIEW_BORDER_LENGTH 1

@implementation ImageCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{   // called by story board
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup
{
    self.bounds = CGRectMake(0, 0, 155, 155);
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];
    
    
}



@end
