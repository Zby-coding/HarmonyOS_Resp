@Component
export struct ListItemView {
  @State index: number = 0

  build() {
    ListItem() {
      Text('联系人' + (this.index++))
        .width('100%')
        .height(50)
        .fontColor(Color.Gray)
    }
    .backgroundColor('#DEDEDE')
  }
}