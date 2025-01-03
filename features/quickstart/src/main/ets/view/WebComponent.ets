import { webview } from '@kit.ArkWeb'

@Component
export struct WebComponent {
  @Prop webUrl: string
  private webviewController: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Web({ src: this.webUrl, controller: this.webviewController })
        .darkMode(WebDarkMode.Auto)
        .domStorageAccess(true)
        .zoomAccess(true)
        .fileAccess(true)
        .mixedMode(MixedMode.All)
        .cacheMode(CacheMode.None)
        .javaScriptAccess(true)
        .width('100%')
        .layoutWeight(1)
    }
  }
}