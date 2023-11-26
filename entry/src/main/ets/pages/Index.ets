import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = '手持字幕DEMO'
  @State speedValue: number = 5

  build() {
    Column() {

      Text('请输入弹幕内容：')
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

      Text('请选择滚动速度：')
        .fontSize('12fp')
        .fontColor('#ffb3b3b3')
        .fontWeight(FontWeight.Bold)
        .margin({top: '30vp'})

      Row() {
        Slider({
          value: this.speedValue,
          step: 1,
          max: 10,
          min: 1,
          style: SliderStyle.InSet
        })
          .blockColor('#191970')
          .trackColor('#ADD8E6')
          .selectedColor('#4169E1')
          .showSteps(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.speedValue = value
          })
        Text(this.speedValue.toFixed(0)).fontSize(12)
      }
      .width('80%')
      .margin({top: '12vp'})

      Button('显示弹幕 定时器+属性offset实现', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor('#317aff')
        .width(200)
        .height(40)
        .margin({top: '12vp'})
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Show',
            params: {
              message: this.message,
              speed: this.speedValue
            }
          })
        })

      Button('显示弹幕 跑马灯组件实现', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor('#317aff')
        .width(200)
        .height(40)
        .margin({top: '12vp'})
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Show2',
            params: {
              message: this.message,
              speed: this.speedValue
            }
          })
        })
    }
    .padding('12vp')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}