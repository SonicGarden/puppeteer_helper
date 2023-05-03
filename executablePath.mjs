import { detectBrowserPlatform, Browser, resolveBuildId, computeExecutablePath } from '@puppeteer/browsers'
import { getConfiguration } from 'puppeteer/lib/esm/puppeteer/getConfiguration.js'
import { PUPPETEER_REVISIONS } from 'puppeteer-core/lib/cjs/puppeteer/revisions.js'

const configuration = getConfiguration()

const platform = detectBrowserPlatform()
if (!platform) {
  throw new Error('The current platform is not supported.')
}

const browser = Browser.CHROME
const unresolvedBuildId = PUPPETEER_REVISIONS['chrome']

const executablePath = computeExecutablePath({
  cacheDir: configuration.cacheDirectory,
  browser: Browser.CHROME,
  buildId: await resolveBuildId(browser, platform, unresolvedBuildId),
})
process.stdout.write(executablePath)
