#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
extern BOOL enabled;
BOOL cursorColorSwitch = YES;
BOOL highlightColorSwitch = YES;
// Color Options
NSString* colorString = @"#147efb";
NSString* selectedPreset = @"0";
NSString* presetHex;
NSString* presetHex2;
// Custom Color Options
BOOL useCustomCursorColorSwitch = NO;
NSString* customCursorString = @"#147efb";

BOOL useCustomHighlightColorSwitch = NO;
NSString* customHighlightString = @"#147efb";

BOOL customAlphaSwitch = NO;
NSString* alphaLevel = @"0.1";

BOOL useRandomColorSwitch = NO;

int randomNumber;

@interface UITextInputTraits : NSObject
@property (nonatomic,retain) UIColor * selectionHighlightColor; 
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end