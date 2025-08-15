import { window } from '@kit.ArkUI'
import { BOTTOM_AREA, TOP_AREA } from '../../../../Index'
import deviceInfo from '@ohos.deviceInfo'

class ScreenManage {
  async openScreen(ctx: Context) {
    //获取window对象
    const win = await window.getLastWindow(ctx)
    // 设置沉浸式
    win.setWindowLayoutFullScreen(true)
    if (deviceInfo.deviceType !== '2in1') {
      this.getTopArea(ctx)
      this.getBottomArea(ctx)
    }
  }

  async getTopArea(ctx: Context) {
    //获取window对象
    const win = await window.getLastWindow(ctx)
    // 获取顶部高度安全区域
    AppStorage.setOrCreate(TOP_AREA, px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height))
  }

  async getBottomArea(ctx: Context) {
    //获取window对象
    const win = await window.getLastWindow(ctx)
    // 获取底部高度安全区域
    AppStorage.setOrCreate(BOTTOM_AREA,
      px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height))
  }

  async closeScreen(ctx: Context) {
    // 获取window对象
    const win = await window.getLastWindow(ctx)
    // 关闭沉浸式
    win.setWindowLayoutFullScreen(false)
    // 重新设置高度
    AppStorage.set(TOP_AREA, 0)
    AppStorage.set(BOTTOM_AREA, 0)
  }

  // 设置横向
  async setLandSpace(ctx: Context) {
    const win = await window.getLastWindow(ctx)
    win.setPreferredOrientation(window.Orientation.LANDSCAPE)
  }

  // 设置竖向
  async setPortrait(ctx: Context) {
    const win = await window.getLastWindow(ctx)
    win.setPreferredOrientation(window.Orientation.PORTRAIT)
  }
}

export const screenManage = new ScreenManage()