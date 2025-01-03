import { Speaker } from 'utils';
import { emitter } from '@kit.BasicServicesKit';

@Component
export struct Header {
  @State message: string = '快速入门'
  @State isPlaying: boolean = false
  private speaker: Speaker = new Speaker()
  private content = '余承东邀请你开启鸿蒙体验之旅 欢迎来到HarmonyOS世界';

  aboutToAppear(): void {
    emitter.on('eventId', () => {
      this.isPlaying = false
      // this.speaker.stopSpeak()
    })
  }

  build() {
    Row() {
      Text(this.message)
        .fontFamily('HarmonyHeiTi-Bold')
        .fontSize(24)
        .textAlign(TextAlign.Start)
        .lineHeight(33)
        .fontWeight(700)

      Image(this.isPlaying ? $r('app.media.ic_AI_read_on') : $r('app.media.ic_AI_read_normal'))
        .width(40)
        .height(40)
        .onClick(() => {
          this.isPlaying = !this.isPlaying;
          if (this.isPlaying === true) {
            this.speaker.startSpeak(this.content)
          } else {
            this.speaker.stopSpeak()
          }
        })
    }
    .padding({
      left: 16,
      right: 16
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .height(56)
    .margin({
      bottom: 11
    })
    .width('100%')
  }
}