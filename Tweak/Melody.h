#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "SparkColourPickerUtils.h"

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
BOOL enabled = YES;
BOOL colorUIButtonSwitch = NO;
BOOL colorUIButtonBarButtonSwitch = NO;
BOOL colorUITabBarButtonSwitch = NO;
BOOL colorUIButtonLabelSwitch = NO;
BOOL colorMPButtonSwitch = NO;
BOOL colorMPRouteButtonSwitch = NO;
BOOL colorUISwitchSwitch = NO;
BOOL colorUISwitchThumbSwitch = NO;
BOOL colorCSQuickActionsButtonSwitch = NO;
// Color Options
BOOL useCustomColorSwitch = NO;
NSString* colorString = @"#147efb";
NSString* selectedPreset = @"0";
NSString* presetHex;

// Custom Color Options
BOOL useCustomUIButtonColorSwitch = NO;
NSString* customUIButtonString = @"#147efb";

BOOL useCustomUITabBarButtonColorSwitch = NO;
NSString* customUITabBarButtonString = @"#147efb";

BOOL useCustomUIButtonBarButtonColorSwitch = NO;
NSString* customUIButtonBarButtonString = @"#147efb";

BOOL useCustomUIButtonLabelColorSwitch = NO;
NSString* customUIButtonLabelString = @"#147efb";

BOOL useCustomMPButtonColorSwitch = NO;
NSString* customMPButtonString = @"#147efb";

BOOL useCustomMPRouteButtonColorSwitch = NO;
NSString* customMPRouteButtonString = @"#147efb";

BOOL useCustomUISwitchColorSwitch = NO;
NSString* customUISwitchString = @"#147efb";

BOOL useCustomUISwitchThumbColorSwitch = NO;
NSString* customUISwitchThumbString = @"#147efb";

BOOL useCustomCSQuickActionsButtonColorSwitch = NO;
NSString* customCSQuickActionsButtonString = @"#ffffff";

//Interfaces
@interface _UIButtonBarButton : NSObject
@property(nonatomic, assign, readwrite)UIColor* tintColor;
@end

@interface UITabBarButton : NSObject
@property(nonatomic, assign, readwrite)UIColor* tintColor;
@end

@interface UIButtonLabel : NSObject
@property(nonatomic, strong, readwrite)UIColor* textColor;
@end

@interface MPButton : NSObject
@property(nonatomic, assign, readwrite)UIColor* tintColor;
@end

@interface MPRouteButton : NSObject
@property(nonatomic, assign, readwrite)UIColor* tintColor;
@end

@interface CSQuickActionsButton : NSObject
@property(nonatomic, assign, readwrite)UIColor* tintColor;
- (id)_viewControllerForAncestor;
@end

@interface _UIStatusBarWifiSignalView : UIView
//@property(nonatomic, assign, readwrite)UIColor* tintColor;
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end