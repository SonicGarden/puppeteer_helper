RSpec.configure do
  # NOTE: Using Chromium included in Puppeteer
  module_path = Rails.root.join('node_modules/puppeteer-core')
  chromium_revision = `node -e "process.stdout.write(require('#{module_path}/lib/cjs/puppeteer/revisions').PUPPETEER_REVISIONS.chromium)"`
  chromium_path = `node -e "process.stdout.write(require('puppeteer').createBrowserFetcher().revisionInfo('#{chromium_revision}').executablePath)"`
  Selenium::WebDriver::Chrome.path = chromium_path
  # NOTE: Detect from the major version
  # SEE: https://chromedriver.chromium.org/downloads/version-selection
  # SEE: https://github.com/titusfortner/webdrivers/issues/180
  chromium_major_version = Webdrivers::ChromeFinder.version.split('.').first
  Webdrivers::Chromedriver.required_version = Webdrivers::Network.get("https://chromedriver.storage.googleapis.com/LATEST_RELEASE_#{chromium_major_version}")
end
