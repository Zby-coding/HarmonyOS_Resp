@Component
export struct WxBar {
  @Prop leftImg: ResourceStr
  @Prop rightImg: ResourceStr
  leftImgAction: () => void = () => {
  }
  rightImgAction: () => void = () => {
  }
  @Prop messageCount: number = 99

  build() {
    RelativeContainer() {
      Image(this.leftImg).width(30).aspectRatio(1)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
        })
        .onClick(() => {
          this.leftImgAction()
        })
      Text(`消息(${this.messageCount}+)`)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .align(Alignment.Center)
        .margin({ top: 25 })
      Image(this.rightImg)
        .width(30)
        .aspectRatio(1)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          right: { anchor: '__container__', align: HorizontalAlign.End },
        })
        .onClick(() => {
          this.rightImgAction()
        })
    }
    .width('100%')
    .height(60)
    .padding(10)
  }
}
