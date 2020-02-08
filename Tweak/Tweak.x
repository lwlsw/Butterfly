#import "Butterfly.h"

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

%group Butterfly

%hook UITextSelectionView

- (id)caretViewColor {

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.butterflypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"color"];
    customCursorString = [preferencesDictionary objectForKey: @"customCursorColor"];

    if (enabled && cursorColorSwitch && !useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        return color;

    } else if (cursorColorSwitch && useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString: customCursorString withFallback: @"#147efb"];

        return customColor;

    } else if (cursorColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];
        
        return color;

    } else {
        return %orig;
        
    }

}

- (id)floatingCaretViewColor {

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.butterflypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"color"];
    customCursorString = [preferencesDictionary objectForKey: @"customCursorColor"];

    if (enabled && cursorColorSwitch && !useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        return color;

    } else if (cursorColorSwitch && useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString: customCursorString withFallback: @"#147efb"];

        return customColor;

    } else if (cursorColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];
        
        return color;

    } else {
        return %orig;

    }

}

%end

%hook UITextInputTraits

- (void)setSelectionBarColor:(id)arg1 {

    int presetNumber = [selectedPreset intValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.butterflypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"color"];
    customCursorString = [preferencesDictionary objectForKey: @"customCursorColor"];

    if (enabled && cursorColorSwitch && !useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        %orig(color);

    } else if (cursorColorSwitch && useCustomCursorColorSwitch && presetNumber == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString: customCursorString withFallback: @"#147efb"];

        %orig(customColor);

    } else if (cursorColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];
        
        %orig(color);

    } else {
        %orig;
        
    }

}

-(UIColor *)selectionHighlightColor {

    int presetNumber = [selectedPreset intValue];
    double customAlpha = [alphaLevel doubleValue];

    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/sh.litten.butterflypreferences.plist"];
    colorString = [preferencesDictionary objectForKey: @"color"];
    customHighlightString = [preferencesDictionary objectForKey: @"customHighlightColor"];

    if (enabled && highlightColorSwitch && !useCustomHighlightColorSwitch && presetNumber == 0) {
        UIColor* color = [SparkColourPickerUtils colourWithString: colorString withFallback: @"#147efb"];

        if (customAlphaSwitch) {
            return [color colorWithAlphaComponent:customAlpha];

        } else {
            return [color colorWithAlphaComponent:0.1];

        }

    } else if (cursorColorSwitch && useCustomHighlightColorSwitch && presetNumber == 0) {
        UIColor* customColor = [SparkColourPickerUtils colourWithString: customHighlightString withFallback: @"#147efb"];

        if (customAlphaSwitch) {
            return [customColor colorWithAlphaComponent:customAlpha];

        } else {
            return [customColor colorWithAlphaComponent:0.1];

        }

    } else if (highlightColorSwitch && presetNumber != 0) {
        setPreset();
        UIColor* color = [SparkColourPickerUtils colourWithString: presetHex withFallback: @"#147efb"];
        
        if (customAlphaSwitch) {
            return [color colorWithAlphaComponent:customAlpha];

        } else {
            return [color colorWithAlphaComponent:0.1];

        }

    } else {
        return %orig;

    }

}

%end

%end

    // This is an Alert if the Tweak is pirated (DRM)
%group ButterflyIntegrityFail

%hook SBIconController

- (void)viewDidAppear:(BOOL)animated {

    %orig; //  Thanks to Nepeta for the DRM
    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Butterfly"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Butterfly from the official Source https://repo.litten.sh/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.litten.sh to Cydia or Sileo."
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
    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.butterfly.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.butterfly.md5sums"];

    if (dpkgInvalid) {
        %init(ButterflyIntegrityFail);
        return;
    }

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.butterflypreferences"];
    // Enabled and Reminder Options
    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
    // Cursor And Hightlight Color Switches
    [pfs registerBool:&cursorColorSwitch default:YES forKey:@"cursorColor"];
    [pfs registerBool:&highlightColorSwitch default:YES forKey:@"highlightColor"];
    // Color Options
    [pfs registerObject:&colorString default:@"#147efb" forKey:@"color"];
    // Preset
    [pfs registerObject:&selectedPreset default:@"0" forKey:@"selectedPresetList"];
    // Custom Color Options
    [pfs registerBool:&useCustomCursorColorSwitch default:NO forKey:@"useCustomCursorColor"];
    [pfs registerObject:&customCursorString default:@"#147efb" forKey:@"customCursorColor"];
    
    [pfs registerBool:&useCustomHighlightColorSwitch default:NO forKey:@"useCustomHighlightColor"];
    [pfs registerObject:&customHighlightString default:@"#147efb" forKey:@"customHighlightColor"];

    [pfs registerBool:&customAlphaSwitch default:NO forKey:@"customAlpha"];
	[pfs registerObject:&alphaLevel default:@"0.1" forKey:@"alpha"];

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.butterfly.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
            %init(Butterfly);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}