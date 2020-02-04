#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
BOOL enabled = YES;
BOOL cursorColorSwitch = YES;
BOOL highlightColorSwitch = YES;
// Color Options
NSString* colorString = @"#147efb";
NSString* selectedPreset = @"0";
NSString* presetHex;
// Custom Color Options
BOOL useCustomCursorColorSwitch = NO;
NSString* customCursorString = @"#147efb";

BOOL useCustomHighlightColorSwitch = NO;
NSString* customHighlightString = @"#147efb";

BOOL customAlphaSwitch = NO;
NSString* alphaLevel = @"0.1";

@interface UITextInputTraits : NSObject
@property (nonatomic,retain) UIColor * selectionHighlightColor; 
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end