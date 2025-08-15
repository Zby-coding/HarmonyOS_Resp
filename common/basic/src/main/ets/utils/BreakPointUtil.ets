interface IValue<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
  xl?: T
}

export class BreakPointUtil<T> {
  private value: IValue<T>

  constructor(value: IValue<T>) {
    this.value = value
  }

  // 中括号取值 取出对应断点的值
  getValue(breakPoint: string): T {
    return (this.value as object)[breakPoint]
  }
}