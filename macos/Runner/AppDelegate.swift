import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

   override func applicationDidFinishLaunching(_ aNotification: Notification) {
    let flutterViewController = NSApplication.shared.windows.first!.contentViewController as! FlutterViewController
    let screenSize = NSScreen.main!.frame.size
    let windowWidth = screenSize.width/3*2
    let windowHeight = screenSize.height/3*2
    let x = (screenSize.width - windowWidth) / 2
    let y = (screenSize.height - windowHeight) / 2
    let windowFrame = NSRect(x: x, y: y, width: windowWidth, height: windowHeight) // 设置初始窗口大小
    NSApplication.shared.windows.first!.setFrame(windowFrame, display: true)

    // 设置窗口的最小和最大大小
    NSApplication.shared.windows.first!.minSize = NSSize(width: windowWidth, height: windowHeight)
    NSApplication.shared.windows.first!.maxSize = NSSize(width: screenSize.width, height: screenSize.height)

    RegisterGeneratedPlugins(registry: flutterViewController)
    }
}
