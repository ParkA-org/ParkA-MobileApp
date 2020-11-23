import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
  [GMSServices provideAPIKey:@"AIzaSyBwErF7X1x2if8NwqYS3S1oh3DwQM2G3Ds"];
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
