#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface ViewController : UIViewController<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@end
@implementation ViewController
- (void)viewDidLoad{
  [super viewDidLoad];
  self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
  [self.view addSubview:self.webView];
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"Web"];
  if(url) [self.webView loadFileURL:url allowingReadAccessToURL:[url URLByDeletingLastPathComponent]];
}
@end
