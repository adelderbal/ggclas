
@interface FBSystemService : NSObject
+ (id)sharedInstance;
- (void)exitAndRelaunch: (bool)arg1;
@end

static void respring() {
   [[%c(FBSystemService) sharedInstance] exitAndRelaunch:true];
}


%ctor {
   CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                   NULL,
                                   respring,
                                   CFSTR("com.okanon.prefexam.respring"),
                                   NULL,
                                   CFNotificationSuspensionBehaviorCoalesce);
}
