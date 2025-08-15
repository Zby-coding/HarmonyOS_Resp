import { TOP_AREA, WxBar } from 'basic'
import { ListItemView } from './ListItem'

@Component
export struct HomeView {
  @State leftImg: ResourceStr = ''
  @State rightImg: ResourceStr = ''
  @StorageProp(TOP_AREA) TOP_AREA: number = 0
  @Provide('pathStack') pathStack: NavPathStack = new NavPathStack()
  @Prop ctx: Context

  aboutToAppear(): void {
    console.log(' -----> ', TOP_AREA)
  }

  build() {
    Column() {
      // Button('点我横屏').onClick(() => {
      //   screenManage.setLandSpace(globalThis.entryContext)
      // })
      // Button('点我竖屏').onClick(() => {
      //   screenManage.setPortrait(globalThis.entryContext)
      // })
      WxBar({
        leftImg: $r('[basic].media.sousuo'),
        messageCount: 99,
        rightImg: $r('[basic].media.tianjia'),
        rightImgAction: () => {
          AlertDialog.show({ message: '点我添加好友!' })
        },
        leftImgAction: () => {
        } // 添加缺失的rightImgAction属性
      })
        .margin({ top: this.TOP_AREA })

      List({ space: 10 }) {
        ForEach(Array.from({ length: 20 }), (item: null, index: number) => {
          ListItemView({ index: index })
            .onClick(() => {
              this.pathStack.pushPath({ name: 'chatView' })
            })
        })
      }
    }
    .height('100%')
    .width('100%')

  }
}
