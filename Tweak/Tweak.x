#import "Melody.h"

/*
Color HEX codes
 #custom:
 #eeabff litten's pink
 #abefcb litten's green
 #9966ff taki's purple
 default:
 #147efb systemBlue
 #34c759 systemGreen
 #5856D6 systemIndigo
 #ff9500 systemOrange
 #ff2d55 systemPink
 #af52de systemPurple
 #ff3b30 systemRed
 #5ac8fa systemTeal
 #ffcc00 systemYellow
*/

    // This function sets the presetHEX NSString to the appropriate value depending on the list view's selected cell
void setPreset() {

    int presetNumber = [selectedPreset intValue]; // just converting the NSString from the list view to an Integer

    switch(presetNumber) {
        case 1:
            presetHex = @"#147efb";
            break;
        case 2:
            presetHex = @"#34c759";
            break;
        case 3:
            presetHex = @"#5856D6";
            break;
        case 4:
            presetHex = @"#ff9500";
            break;
        case 5:
            presetHex = @"#ff2d55";
            break;
        case 6:
            presetHex = @"#af52de";
            break;
        case 7:
            presetHex = @"#ff3b30";
            break;
        case 8:
            presetHex = @"#5ac8fa";
            break;
        case 9:
            presetHex = @"#ffcc00";
            break;
        case 10:
            presetHex = @"#eeabff";
            break;
        case 11:
            presetHex = @"#abefcb";
            break;
        case 12:
            presetHex = @"#9966ff";
            break;
        default:
            break;
    }

}

%group Melody

%hook UIButton

- (void)setTintColor:(UIColor *)arg1 { // We could also just modify the layoutSubviews but i rather use the method which is used for it

    int presetNumber = [selectedPreset intValue];
        // this part looks for the value in our preferences file
    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customUIButtonString = [preferencesDictionary objectForKey: @"customUIButtonPicker"];
        // if melody's color switches are toggled it should color the buttons with the color pickers value
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorUIButtonSwitch) {
		    %orig(selectedColor);

	    }
        // this is used if the user wants to use a custom color specifically for this option
    } else if (useCustomColorSwitch && useCustomUIButtonColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customUIButtonString withFallback: @"#147efb"];
        %orig(selectedCustomColor);
        // this is used to color the buttons with a preset, you can see that because the presetNumber is not going to be 0
    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset(); // this again sets the appropriate color preset
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorUIButtonSwitch) {
		    %orig(selectedColor);

	    }

    } else {
        %orig;

    }

}

%end
 // same again but with other switch variables of course, this continues to go on like this, almost
%hook _UIButtonBarButton

- (void)setTintColor:(UIColor *)arg1 {

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customUIButtonBarButtonString = [preferencesDictionary objectForKey: @"customUIButtonBarButtonPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorUIButtonBarButtonSwitch) {
		    %orig(selectedColor);

	    }

    } else if (useCustomColorSwitch && useCustomUIButtonBarButtonColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customUIButtonBarButtonString withFallback: @"#147efb"];
        %orig(selectedCustomColor);

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorUIButtonBarButtonSwitch) {
		    %orig(selectedColor);

	    }

    } else {
        %orig;

    }

}

%end

%hook UITabBarButton

- (void)setTintColor:(UIColor *)arg1 {

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customUITabBarButtonString = [preferencesDictionary objectForKey: @"customUITabBarButtonPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorUITabBarButtonSwitch) {
		    %orig(selectedColor);

	    }

    } else if (useCustomColorSwitch && useCustomUITabBarButtonColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customUITabBarButtonString withFallback: @"#147efb"];
        %orig(selectedCustomColor);

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorUITabBarButtonSwitch) {
		    %orig(selectedColor);

	    }

    } else {
        %orig;

    }

}

%end

%hook UIButtonLabel

- (void)layoutSubviews { // Here we use the layout subviews, that's one of two differences to the way/s above

    %orig;

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customUIButtonLabelString = [preferencesDictionary objectForKey: @"customUIButtonLabelPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorUIButtonLabelSwitch) {
		    self.textColor = selectedColor; // instead of the %orig we now change it directly

	    }

    } else if (useCustomColorSwitch && useCustomUIButtonLabelColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customUIButtonLabelString withFallback: @"#147efb"];
        self.textColor = selectedCustomColor; // same here, but with the presets again

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorUIButtonLabelSwitch) {
		    self.textColor = selectedColor; // same here, but with the presets again

	    }

    } else {
        %orig;

    }

}

%end

%hook MPButton

- (void)layoutSubviews {

    %orig;

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customMPButtonString = [preferencesDictionary objectForKey: @"customMPButtonPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorMPButtonSwitch) {
		    self.tintColor = selectedColor;

	    }

    } else if (useCustomColorSwitch && useCustomMPButtonColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customMPButtonString withFallback: @"#147efb"];
        self.tintColor = selectedCustomColor;

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorMPButtonSwitch) {
		    self.tintColor = selectedColor;

	    }

    } else {
        %orig;

    }

}

%end

%hook MPRouteButton

- (void)layoutSubviews {

    %orig;

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customMPRouteButtonString = [preferencesDictionary objectForKey: @"customMPRouteButtonPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorMPRouteButtonSwitch) {
		    self.tintColor = selectedColor;

	    }

    } else if (useCustomColorSwitch && useCustomMPRouteButtonColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customMPRouteButtonString withFallback: @"#147efb"];
        self.tintColor = selectedCustomColor;

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorMPRouteButtonSwitch) {
		    self.tintColor = selectedColor;

	    }

    }

}

%end

%hook UISwitch

- (void)layoutSubviews {

    %orig;

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.melodypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"customColor"];
    customUISwitchString = [preferencesDictionary objectForKey: @"customUISwitchPicker"];
    
    if (enabled && useCustomColorSwitch && presetNumber == 0) {
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (enabled && colorUISwitchSwitch) {
            [self setOnTintColor: selectedColor]; // we use this to set the switches color

	    }

    } else if (useCustomColorSwitch && useCustomUISwitchColorSwitch) {
        UIColor* selectedCustomColor = [SparkColourPickerUtils colourWithString: customUISwitchString withFallback: @"#147efb"];
        [self setOnTintColor: selectedCustomColor]; // same here

    } else if (useCustomColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* selectedColor = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];

        if (enabled && colorUISwitchSwitch) {
            [self setOnTintColor: selectedColor]; // and here

	    }

    } 

}

%end

%end
    // This is an Alert if the Tweak is pirated (DRM)
%group MelodyIntegrityFail

%hook SBIconController

- (void)viewDidAppear:(BOOL)animated {

    %orig; //  Thanks to Nepeta for the DRM
    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Melody"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Melody from the official Source https://repo.litten.sh/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.litten.sh to Cydia or Sileo."
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Aww man" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

			UIApplication *application = [UIApplication sharedApplication];
			[application openURL:[NSURL URLWithString:@"https://repo.litten.sh/"] options:@{} completionHandler:nil];

	}];

		[alertController addAction:cancelAction];

		[self presentViewController:alertController animated:YES completion:nil];

}

%end

%end

%ctor {
        // This code avoid respring loops, only needed if you hook a system process like UIKit or Foundation system wide (in the plist file), also only if you use cephei
    if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    // Someone smarter than Nepeta invented this.
    // https://www.reddit.com/r/jailbreak/comments/4yz5v5/questionremote_messages_not_enabling/d6rlh88/
    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if ((!isFileProvider && isApplication && !skip) || isSpringboard) {
                shouldLoad = YES;
            }
        }
    }

    if (!shouldLoad) return;
  
    // Thanks To Nepeta For The DRM
    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.melody.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.melody.md5sums"];

    if (dpkgInvalid) {
        %init(MelodyIntegrityFail);
        return;
    }

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.melodypreferences"];
    // Enabled Switch
    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
    // Option Switches
    [pfs registerBool:&colorUIButtonSwitch default:NO forKey:@"colorUIButton"];
    [pfs registerBool:&colorUIButtonBarButtonSwitch default:NO forKey:@"colorUIButtonBarButton"];
    [pfs registerBool:&colorUITabBarButtonSwitch default:NO forKey:@"colorUITabBarButton"];
    [pfs registerBool:&colorUIButtonLabelSwitch default:NO forKey:@"colorUIButtonLabel"];
    [pfs registerBool:&colorMPButtonSwitch default:NO forKey:@"colorMPButton"];
    [pfs registerBool:&colorMPRouteButtonSwitch default:NO forKey:@"colorMPRouteButton"];
    [pfs registerBool:&colorUISwitchSwitch default:NO forKey:@"colorUISwitch"];
    // Color Options
    [pfs registerBool:&useCustomColorSwitch default:NO forKey:@"useCustomColor"];
    [pfs registerObject:&colorString default:@"#147efb" forKey:@"customColor"];
    [pfs registerObject:&selectedPreset default:@"0" forKey:@"selectedPresetList"];
    // Custom Color Options
    [pfs registerBool:&useCustomUIButtonColorSwitch default:NO forKey:@"useCustomUIButtonColor"];
    [pfs registerObject:&customUIButtonString default:@"#147efb" forKey:@"customUIButtonPicker"];

    [pfs registerBool:&useCustomUIButtonBarButtonColorSwitch default:NO forKey:@"useCustomUIButtonBarButtonColor"];
    [pfs registerObject:&customUIButtonBarButtonString default:@"#147efb" forKey:@"customUIButtonBarButtonPicker"];

    [pfs registerBool:&useCustomUITabBarButtonColorSwitch default:NO forKey:@"useCustomUITabBarButtonColor"];
    [pfs registerObject:&customUITabBarButtonString default:@"#147efb" forKey:@"customUITabBarButtonPicker"];

    [pfs registerBool:&useCustomUIButtonLabelColorSwitch default:NO forKey:@"useCustomUIButtonLabelColor"];
    [pfs registerObject:&customUIButtonLabelString default:@"#147efb" forKey:@"customUIButtonLabelPicker"];

    [pfs registerBool:&useCustomMPButtonColorSwitch default:NO forKey:@"useCustomMPButtonColor"];
    [pfs registerObject:&customMPButtonString default:@"#147efb" forKey:@"customMPButtonPicker"];

    [pfs registerBool:&useCustomMPRouteButtonColorSwitch default:NO forKey:@"useCustomMPRouteButtonColor"];
    [pfs registerObject:&customMPRouteButtonString default:@"#147efb" forKey:@"customMPRouteButtonPicker"];

    [pfs registerBool:&useCustomUISwitchColorSwitch default:NO forKey:@"useCustomUISwitchColor"];
    [pfs registerObject:&customUISwitchString default:@"#147efb" forKey:@"customUISwitchPicker"];

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.melody.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
            %init(Melody);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}