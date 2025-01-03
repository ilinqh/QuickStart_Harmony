import { Speaker } from 'utils'
import { ArticleClass } from '../model/ArticleClass'
import { WebComponent } from '../view/WebComponent'
import { emitter } from '@kit.BasicServicesKit'

@Component
export struct ArticleDetailPage {
  @State articleDetail: ArticleClass | null = null
  @Consume articlePathStack: NavPathStack
  @State isClicked: boolean = false
  private speaker: Speaker = new Speaker()

  aboutToAppear(): void {
    this.articleDetail = this.articlePathStack.getParamByName('articleDetail')[0] as ArticleClass
    emitter.on('eventId', () => {
      this.isClicked = false
    })
  }

  aboutToDisappear(): void {
    this.speaker?.shutdownEngine()
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Row() {
            Image($r('app.media.ic_back'))
              .width(40)
              .height(40)
              .onClick(() => {
                this.articlePathStack.pop()
              })
            Row() {
              Text(this.articleDetail?.title)
                .fontFamily('HarmonyHeiTi-Bold')
                .fontSize(20)
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .fontWeight(700)
                .margin({ left: 8 })
            }
          }
          .width('80%')

          Image(this.isClicked ? $r('app.media.ic_AI_read_on') : $r('app.media.ic_AI_read_normal'))
            .width(40)
            .height(40)
            .onClick(() => {
              this.isClicked = !this.isClicked
              if (this.isClicked) {
                this.speaker.startSpeak(this.articleDetail!.brief)
              } else {
                this.speaker.stopSpeak()
              }
            })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .height(56)

        WebComponent({ webUrl: this.articleDetail?.webUrl })
      }
      .padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .hideTitleBar(true)
  }
}
