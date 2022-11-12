import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    setupStoryApi()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func setupStoryApi() -> Void {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    HostStoryApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: StorySenderApi())
  }
}
