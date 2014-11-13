require "spec_helper"

describe Logging::Device do

  context "#from" do
    it "accepts a file handle" do
      expect(Logging::Device.from(STDOUT)).to eq STDOUT
    end

    it "accepts a string representing STDOUT" do
      expect(Logging::Device.from("stdout")).to eq STDOUT
      expect(Logging::Device.from("STDOUT")).to eq STDOUT
    end

    it "accepts a string representing STDERR" do
      expect(Logging::Device.from("stderr")).to eq STDERR
      expect(Logging::Device.from("STDERR")).to eq STDERR
    end
  end

  context "#describe" do
    it "gets a filename" do
      logger = Logger.new("/tmp/file.log")
      expect(Logging::Device.describe(logger)).to eq "/tmp/file.log"
    end

    it "gets a device" do
      logger = Logger.new(STDOUT)
      expect(Logging::Device.describe(logger)).to eq "STDOUT"
    end
  end

end