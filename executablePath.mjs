import { homedir } from 'os'
import { join } from 'path'
import { BrowserFetcher } from 'puppeteer-core'
import { PUPPETEER_REVISIONS } from 'puppeteer-core/lib/cjs/puppeteer/revisions.js'

// NOTE: 出来ればpuppeteerのAPIを使ってcacheディレクトリのパスを定義したい
const browserFetcher = new BrowserFetcher({ path: join(homedir(), '.cache', 'puppeteer', 'chrome') })
const revisionInfo = await browserFetcher.download(PUPPETEER_REVISIONS.chromium)

process.stdout.write(revisionInfo.executablePath)
