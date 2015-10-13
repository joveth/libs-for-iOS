#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface GPUImageController : UIViewController
{
    GPUImagePicture *sourcePicture;
    GPUImageOutput<GPUImageInput> *sepiaFilter, *sepiaFilter2;
    
    UISlider *imageSlider;
}

// Image filtering
- (void)setupDisplayFiltering;
- (void)setupImageFilteringToDisk;
- (void)setupImageResampling;

- (IBAction)updateSliderValue:(id)sender;

@end
