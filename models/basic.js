import { rawArray } from '@/utils'

export default class AppModel {
  toJSON () {
    return { ...this } // fix warn
  }

  static createFromRaw () {
    return Object.assign(new this(), {})
  }

  static createListFromRaw (rawList) {
    return rawArray(rawList).map(item => this.createFromRaw(item))
  }
}
