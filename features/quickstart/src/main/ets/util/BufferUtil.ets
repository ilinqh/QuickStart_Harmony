import { util } from '@kit.ArkTS';

export function bufferToString(buffer: Uint8Array): string {
  let textDecoder = util.TextDecoder.create('utf-8', {
    ignoreBOM: true
  })
  return textDecoder.decodeToString(buffer)
}