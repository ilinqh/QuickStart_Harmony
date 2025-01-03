import { ArticleClass } from '../model/ArticleClass'
import { BannerClass } from '../model/BannerClass'
import { Banner } from '../view/Banner'
import { EnablementView } from '../view/EnablementView'
import { Header } from '../view/Header'
import { TutorialView } from '../view/TutorialView'
import { ArticleDetailPage } from './ArticleDetailPage'
import { BannerDetailPage } from './BannerDetailPage'

@Component
export struct QuickStartPage {
  @Provide('articlePathStack') articlePathStack: NavPathStack = new NavPathStack()
  @State message: string = '快速入门'

  @Builder
  quickStartRoute(name: string, param?: ArticleClass | BannerClass) {
    if (name === 'articleDetail') {
      ArticleDetailPage()
    } else if (name === 'bannerDetailPage') {
      BannerDetailPage()
    }
  }

  build() {
    Navigation(this.articlePathStack) {
      Column() {
        // Text(this.message)
        //   .fontSize(24)
        //   .fontWeight(700)
        //   .width('100%')
        //   .textAlign(TextAlign.Start)
        //   .padding({ left: 16 })
        //   .fontFamily("HarmonyHeiTi-Bold")
        //   .lineHeight(33)
        Header()
        Scroll() {
          Column() {
            Banner()
            EnablementView()
            TutorialView()
          }
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.TopStart)
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')

    }
    .navDestination(this.quickStartRoute)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}
