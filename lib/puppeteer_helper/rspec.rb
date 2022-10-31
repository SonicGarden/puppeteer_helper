require 'fileutils'

RSpec.configure do
  gem_dir = File.expand_path('../..', __dir__)
  # NOTE: プロジェクト内にスクリプトファイルを設置しないと、node_modules以下の参照が上手くいかなかった為に一時的にコピーするようにしている
  tmp_path = Rails.root.join('tmp/puppeteerHelperExecutablePath.mjs')
  FileUtils.cp("#{gem_dir}/executablePath.mjs", tmp_path)
  chromium_path = `node #{tmp_path}`
  FileUtils.rm_f(tmp_path)

  Selenium::WebDriver::Chrome.path = chromium_path
  # NOTE: Detect from the major version
  # SEE: https://chromedriver.chromium.org/downloads/version-selection
  # SEE: https://github.com/titusfortner/webdrivers/issues/180
  chromium_major_version = Webdrivers::ChromeFinder.version.split('.').first
  Webdrivers::Chromedriver.required_version = Webdrivers::Network.get("https://chromedriver.storage.googleapis.com/LATEST_RELEASE_#{chromium_major_version}")
end
