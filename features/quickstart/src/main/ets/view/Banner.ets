import { BannerClass } from '../model/BannerClass'
import { bufferToString } from '../util/BufferUtil'
import { JSON } from '@kit.ArkTS'

@Component
export struct Banner {
  @State bannerList: Array<BannerClass> = []
  @Consume('articlePathStack') articlePathStack: NavPathStack

  aboutToAppear(): void {
    this.getBannerDataFromJSON()
  }

  getBannerDataFromJSON() {
    getContext(this).resourceManager.getRawFileContent('BannerData.json').then(value => {
      // 转换为字符串
      let res: string = bufferToString(value)
      // 解析为数据结构
      this.bannerList = JSON.parse(res) as BannerClass[]
    })
  }

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image($r(item.imageSrc))
          .objectFit(ImageFit.Contain)
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
          .onClick(() => {
            this.articlePathStack.pushPathByName('bannerDetailPage', item)
          })
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator().color('#1a000000').selectedColor('#0A59F7')
    )
  }
}
