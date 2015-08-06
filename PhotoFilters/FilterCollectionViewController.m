//
//  FilterCollectionViewController.m
//  PhotoFilters
//
//  Created by Vincent Chau on 8/4/15.
//  Copyright (c) 2015 Vincent Chau. All rights reserved.
//

#import "FilterCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "Photo.h"

@interface FilterCollectionViewController ()

@property (strong,nonatomic) NSMutableArray *filters;
@property (strong, nonatomic) CIContext *context;

@end

@implementation FilterCollectionViewController

static NSString * const reuseIdentifier = @"PhotoCell";

-(NSMutableArray *)filters
{
    if (!_filters)
        _filters = [[NSMutableArray alloc] init];
    return _filters;
}
-(CIContext *)context
{
    if (!_context)
        _context = [CIContext contextWithOptions:nil];
    return _context;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    self.filters = [[[self class] photoFilters] mutableCopy];

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Helpers
+(NSArray*)photoFilters
{

    CIFilter *sepia = [CIFilter filterWithName:@"CISepiaTone" keysAndValues: nil];
    
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputRadiusKey, @1, nil];
    
    CIFilter *colorClamp = [CIFilter filterWithName:@"CIColorClamp" keysAndValues:@"inputMaxComponents", [CIVector vectorWithX:0.9 Y:0.9 Z:0.9 W:0.9], @"inputMinComponents", [CIVector vectorWithX:0.2 Y:0.2 Z:0.2 W:0.2], nil];
    
    CIFilter *instant = [CIFilter filterWithName:@"CIPhotoEffectInstant" keysAndValues: nil];
    
    CIFilter *noir = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues: nil];
    
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignetteEffect" keysAndValues: nil];
    
    CIFilter *colorControl = [CIFilter filterWithName:@"CIColorControls" keysAndValues: kCIInputSaturationKey, @0.5, nil];
    
    CIFilter *transfer = [CIFilter filterWithName:@"CIPhotoEffectTransfer" keysAndValues: nil];
    
    CIFilter *unsharpen = [CIFilter filterWithName:@"CIUnsharpMask" keysAndValues: nil];
    
    CIFilter *monochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues: nil];
    
    NSArray *allFilters = @[sepia, blur, colorClamp, instant, noir, vignette, colorControl, transfer, unsharpen, monochrome];
    
    return allFilters;

}

-(UIImage *)filteredImageFromImage:(UIImage*)image andFilter:(CIFilter *)filter
{
    //Conversion Process: UIImage->CIImage->CGImageRef->UIImage
    CIImage *unfilteredImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    
    [filter setValue:unfilteredImage forKey:kCIInputImageKey];
    
    CIImage *filteredImage = [filter outputImage];
    
    CGRect extent = [filteredImage extent];
    
    CGImageRef cgImage = [self.context createCGImage:filteredImage fromRect:extent];
    
    UIImage *finalImage = [UIImage imageWithCGImage:cgImage];
    
    return finalImage;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//
//    return 0;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.filters count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t filterQ = dispatch_queue_create("filter queue", NULL);
    
    // push this queue on another thread
    dispatch_async(filterQ,
    ^{
        UIImage *filteredImage = [self filteredImageFromImage:self.photo.image andFilter:self.filters[indexPath.row]];
        // go back to main thread
        dispatch_async(dispatch_get_main_queue(),
        ^{
            cell.imageView.image = filteredImage;
        });
    });
    
    //cell.imageView.image = [self filteredImageFromImage:self.photo.image andFilter:self.filters[indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *selectedCell = (ImageCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    self.photo.image = selectedCell.imageView.image;
    NSError *error = nil;
    
    if (self.photo.image)
    {

    
        if (![[self.photo managedObjectContext] save:&error])
        {
            NSLog(@"Error");
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
