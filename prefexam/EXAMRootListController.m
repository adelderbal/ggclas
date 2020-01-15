#include "EXAMRootListController.h"

#define rgb(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define rgba(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@implementation EXAMRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


- (void)loadView {
	[super loadView];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"respring"
        																					style: UIBarButtonItemStylePlain
																						   target: self
																					   	action: @selector(resp)];
}

- (void)viewWillAppear:(bool)animated {
   [super viewWillAppear:animated];

   [[UISwitch appearance] setOnTintColor: rgba(253, 110, 165, 1)];
   self.navigationController.navigationBar.tintColor = rgba(253, 110, 165, 1);
   self.navigationController.navigationController.navigationBar.tintColor = rgba(253, 110, 165, 1);
}

- (void)viewWillDisappear:(bool)animated {
   [super viewWillDisappear:animated];

   self.navigationController.navigationBar.tintColor = nil;
   self.navigationController.navigationController.navigationBar.tintColor = nil;
   [[UISwitch appearance] setOnTintColor: nil];
}

- (void)open2witter {
   NSString *uid = @"@cxx_flags";
   NSDictionary *scheme = @{@"tweetbot": @":///user_profile/" ,
                            @"twitterrifc": @":///profile?screen_name=",
                            @"tweetings": @":///user?screen_name=",
                            @"twitter": @"://user?screen_name=",
                            @"https": @"://mobile.twitter.com/"};

   UIApplication *app = [UIApplication sharedApplication];

   [scheme enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {  
      NSDLog(@"key = %@ obj = %@", key, obj);
      if ([app canOpenURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@:", key]]]) {
         NSDLog(@"TRUE!!!!!!");
         [app openURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@%@", key, obj, uid]] 
              options:@{} 
              completionHandler:nil];  

         *stop = YES;
         return;
      }
   }];
}

- (void)resp {
   CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(),
                                        CFSTR("com.okanon.prefexam.respring"),
                                        NULL, NULL, YES);
}

@end

/*
@interface EXAMCreditsListController : PSListController {
}
@end

@implementation EXAMCreditsListController


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Credits" target:self];
	}

	return _specifiers;
}
@end
*/

