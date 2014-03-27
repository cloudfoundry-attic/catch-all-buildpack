def java_build_files
  %w(pom.xml build.gradle)
end

def find_java_build_file(app_dir)
  java_build_files.each do |build_file|
    if File.exists?(File.join(app_dir, build_file))
      yield(build_file)
      return
    end
  end
end
