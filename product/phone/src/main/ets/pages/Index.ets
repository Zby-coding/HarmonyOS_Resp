import { BOTTOM_AREA } from 'basic'
import { HomeView } from 'home'
import { Context } from '@kit.AbilityKit'

@Entry
@Component
struct Index {
  @State index: number = 0
  pathStack: NavPathStack = new NavPathStack()
  @Provide context: Context = getContext(this)
  @StorageProp(BOTTOM_AREA) BOTTOM_AREA: number = 0

  @Builder
  tabBuilder(imgSelected: ResourceStr, img: ResourceStr, index: number, title: string) {
    Column() {
      Image(this.index === index ? imgSelected : img).width(25).aspectRatio(1)
      Text(title).width(50).fontColor(this.index === index ? Color.Orange : Color.Black).textAlign(TextAlign.Center)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height(30)
  }

  aboutToAppear(): void {
    console.log(' -----> ', BOTTOM_AREA)
  }

  build() {
    Column() {
      Navigation(this.pathStack) {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            HomeView({ pathStack: this.pathStack })
          }
          .tabBar(this.tabBuilder($r('[basic].media.ershou'), $r('[basic].media.dakaqu'), 0, '首页'))
          // .backgroundColor('#f7f7f7')
          .backgroundColor(Color.Pink)


          TabContent() {
            Text('联系人').fontSize(45).fontWeight(700)

          }
          .tabBar(this.tabBuilder($r('[basic].media.shoushi'), $r('[basic].media.chongwuyongpin'), 1, '联系人'))
          .backgroundColor(Color.Gray)

          TabContent() {
            Text('发现').fontSize(45).fontWeight(700)
          }
          .tabBar(this.tabBuilder($r('[basic].media.jishishijian'), $r('[basic].media.youjishuiguo'), 2, '发现'))
          .backgroundColor(Color.Brown)

          TabContent() {
            Text('我的').fontSize(45).fontWeight(700)
          }
          .tabBar(this.tabBuilder($r('[basic].media.chongwuyongpin'), $r('[basic].media.tiantianquan'), 3, '我的'))
          .backgroundColor(Color.Blue)

        }
        .margin({ bottom: BOTTOM_AREA })
        .onAnimationStart((index, TIndex) => {
          this.index = TIndex
        })
      }
      // .mode(NavigationMode.Stack)
      .hideToolBar(true)
      .margin({ bottom: this.BOTTOM_AREA })
    }
    .width('100%')
    .height('100%')

    .backgroundColor(Color.Pink)

  }
}