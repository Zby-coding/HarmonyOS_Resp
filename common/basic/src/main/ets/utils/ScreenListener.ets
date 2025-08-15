import { Context } from '@kit.AbilityKit';
import window from '@ohos.window';
import display from '@ohos.display';

class ScreenListener {
  async openListener(ctx: Context) {
    // 获取win对象
    const win = await window.getLastWindow(ctx)
    this.setBreakPoint(display.getDefaultDisplaySync().width)
    win.on('windowSizeChange', (size) => {
      this.setBreakPoint(px2vp(size.width))
    })

  }

  setBreakPoint(num: number) {
    let breakPoint = ''
    if (num > 0 && num <= 320) {
      breakPoint = 'xs'
    } else if (num > 320 && num <= 800) {
      breakPoint = 'sm'
    } else if (num > 800 && num <= 1440) {
      breakPoint = 'md'
    } else {
      breakPoint = 'lg'
    }
  }

  async closeListener(ctx: Context) {
    const win = await window.getLastWindow(ctx)
    
  }
}