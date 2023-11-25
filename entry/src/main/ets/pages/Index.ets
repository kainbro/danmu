import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = '手持字幕DEMO'

  build() {
    Column() {

      Text('请输入弹幕内容..')
        .fontSize('12fp')
        .fontColor('#ffb3b3b3')
        .fontWeight(FontWeight.Bold)
        .margin({top: '30vp'})

      TextInput()
        .type(InputType.Normal)
        .onChange((value: string) => {
          this.message = value;
        })
        .margin({top: '12vp'})

      Button('显示弹幕', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor('#317aff')
        .width(90)
        .height(40)
        .margin({top: '12vp'})
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Show',
            params: {
              message: this.message
            }
          })
        })

    }
    .padding('12vp')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}