// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

@interface FirstTweakViewController: UIViewController

- (void)showAlert;

@end

%hook FirstTweakViewController

- (void)showAlert {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提醒" message:@"这是hook后的提醒" preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:nil];
    UIAlertAction * confirm = [UIAlertAction actionWithTitle:@"Confirm" style:(UIAlertActionStyleDestructive) handler:nil];
    [alert addAction:cancel];
    [alert addAction:confirm];
    [self presentViewController:alert animated:YES completion:nil];
}

%end
