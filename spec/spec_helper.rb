require 'open3'

BIN_DIR = File.expand_path("../../bin", __FILE__)
TEST_APPS_DIR = File.expand_path("../test-apps", __FILE__)

def using_app(app_name)
  @app = app_name
end

def run_script(script_name)
  stdout, status = Open3.capture2("#{BIN_DIR}/#{script_name} #{TEST_APPS_DIR}/#{@app}")
  [stdout, status.exitstatus]
end

def run_detect
  run_script "detect"
end

def run_compile
  run_script "compile"
end
