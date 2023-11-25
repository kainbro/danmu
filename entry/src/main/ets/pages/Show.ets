import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = '手持字幕DEMO'
  @State offSetValue: number = 0
  intervalId: number
  speed: number = 8
  fontColor: Color = 0x333333
  bgColor: Color = 0xff8460ff

  aboutToAppear() {
    const params = router.getParams(); // 获取传递过来的参数对象
    this.message = params['message']; // 获取message属性的值

    this.intervalId = setInterval(() => {
      if (this.speed < 1) {
        this.speed = 1;
      } else if (this.speed > 10) {
        this.speed = 10;
      }
      this.offSetValue = this.offSetValue + this.speed;

      if (this.offSetValue > vp2px(240)) {
        this.offSetValue = vp2px(-240);
      }
    }, 10);
  }

  aboutToDisappear() {
    clearInterval(this.intervalId);
  }

  build() {
      Row() {
        Text(this.message)
          .fontSize('120fp')
          .fontWeight(FontWeight.Bold)
          .fontColor(this.fontColor)
          .offset({ x: -1 * this.offSetValue})
          .height('130vp')
      }
      .width('100%')
      .height('100%')
      .backgroundColor(this.bgColor)
      .alignItems(VerticalAlign.Center)
  }
}