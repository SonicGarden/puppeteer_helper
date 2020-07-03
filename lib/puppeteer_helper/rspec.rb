RSpec.configure do
  # NOTE: puppeteer経由でchromiumのバージョンを管理している
  module_path = Rails.root.join('node_modules/puppeteer')
  chromium_revision = `node -e "process.stdout.write(require('#{module_path}/lib/cjs/revisions').PUPPETEER_REVISIONS.chromium)"`
  chromium_path = `node -e "process.stdout.write(require('puppeteer').createBrowserFetcher().revisionInfo('#{chromium_revision}').executablePath)"`
  Selenium::WebDriver::Chrome.path = chromium_path
  # NOTE: Chromiumの場合、環境やバージョンによってwebdrivers gemの自動バージョン判定が正しく機能しないので自前で判定している
  chromium_major_version = Webdrivers::ChromeFinder.version.split('.').first
  Webdrivers::Chromedriver.required_version = Webdrivers::Network.get("https://chromedriver.storage.googleapis.com/LATEST_RELEASE_#{chromium_major_version}")
end
