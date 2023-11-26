import router from '@ohos.router'

@Entry
@Component
struct Show2 {
  @State start: boolean = false
  @State message: string = '手持字幕-Marquee组件实现'
  speed: number = 5
  fontColor: Color = 0x333333
  bgColor: Color = 0xff8460ff

  aboutToAppear() {
    const params = router.getParams(); // 获取传递过来的参数对象
    this.message = params['message']; // 获取message属性的值
    this.speed = params['speed']; // 获取speed属性的值

    this.start = true;
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center }) {
      Marquee({
        start: this.start,
        step: this.speed * 20,
        loop: -1,
        fromStart: true,
        src: this.message
      })
        .width('100%')
        .height('140vp')
        .fontColor(this.fontColor)
        .fontSize('120fp')
        .fontWeight(FontWeight.Bold)
        .backgroundColor(this.bgColor)
        .margin({ bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.bgColor)
  }
}