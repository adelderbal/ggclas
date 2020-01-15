#include "EXAMCreditsListController.h"

#define rgb(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define rgba(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define device_width [[UIScreen mainScreen] bounds].size.width


@implementation EXAMCreditsListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Credits" target:self];
	}

	return _specifiers;
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

- (void)openGithub {
   UIApplication *app = [UIApplication sharedApplication];
   [app openURL:[NSURL URLWithString:@"https://github.com/okanon"] 
        options:@{} 
        completionHandler:nil];  
}

- (void)sendEmail {
   UIApplication *app = [UIApplication sharedApplication];
   if ([app canOpenURL:[NSURL URLWithString:@"googlegmail:"]])
      [app openURL:[NSURL URLWithString:@"googlegmail://co?to=flat.cydia37jins.pc@gmail.com&subject=PreferenceExam"] 
           options:@{} 
           completionHandler:nil];  
   else
      [app openURL:[NSURL URLWithString:@"mailto:flat.cydia37jins.pc@gmail.com?subject=PreferenceExam"] 
           options:@{} 
           completionHandler:nil];  
}

- (void)openDonate {
   UIApplication *app = [UIApplication sharedApplication];
   [app openURL:[NSURL URLWithString:@"https://github.com/okanon"] 
        options:@{} 
        completionHandler:nil];  
}

@end

@interface EXAMCreditCell : PSTableCell {
   UIImageView *bg;
   UILabel *name;
   UILabel *role;
}
@end

@implementation EXAMCreditCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {
   if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier])) {
      NSMutableDictionary *properties = specifier.properties;
      bg = [[UIImageView alloc] initWithImage:properties[@"iconImage"]];
      bg.frame = CGRectMake(10, 15, 70, 70);
      bg.layer.cornerRadius = bg.frame.size.width / 2;
      bg.layer.masksToBounds = true;

      properties[@"iconImage"] = nil;
      [self addSubview:bg];

      CGRect frame = [self frame];

      name = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 18, frame.size.width, frame.size.height)];
      [name setText:properties[@"name"]];
      [name setBackgroundColor: [UIColor clearColor]];
      [name setTextColor: [UIColor blackColor]];
      [name setFont: [UIFont fontWithName:@"Helvetica Light" size: 23]];
      
      [self addSubview:name];

      role = [[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x + 95, frame.origin.y + 40, device_width - (device_width / 2.29), frame.size.height)];
      [role setText:properties[@"role"]];
      [role setBackgroundColor: [UIColor clearColor]];
      [role setTextColor: [UIColor grayColor]];
      [role setFont: [UIFont fontWithName:@"Helvetica Light" size: 15]];

      [self addSubview:role];
   }
   return self;
}

@end
