@Component
export struct chatView {
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        Text('消息1')
      }
      .height('100%')
      .width('100%')
    }
    .onReady((res) => {
      this.pathStack = res.pathStack
    })
  }
}

@Builder
export function chatBuilder() {
  chatView()
}