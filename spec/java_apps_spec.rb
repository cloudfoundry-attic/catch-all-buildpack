require "spec_helper"

describe "Java apps" do
  describe "when the app contains a pom.xml file" do
    before { using_app "app-with-pom-xml" }

    it "detects successfully" do
      _, status = run_detect
      expect(status).to eq(0)
    end

    describe "compile" do
      before { @stdout, @status = run_compile }

      it "fails to compile" do
        expect(@status).to eq(1)
      end

      it "outputs a warning" do
        puts @stdout
        expect(@stdout).to include("pom.xml")
      end
    end
  end

  describe "when the app contains a build.gradle file" do
    before { using_app "app-with-build-gradle" }

    it "detects successfully" do
      stdout, status = run_detect
      expect(status).to eq(0)
    end

    describe "compile" do
      before { @stdout, @status = run_compile }

      it "fails to compile" do
        expect(@status).to eq(1)
      end

      it "outputs a warning" do
        expect(@stdout).to include("build.gradle")
      end
    end
  end

  describe "when the app does not contain any known java build files" do
    before { using_app "unkown-app" }

    it "does not detect" do
      _, status = run_detect
      expect(status).to eq(1)
    end
  end
end
