class NextpnrIce40 < Formula
  desc "portable FPGA place-and-route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen" => :build
  depends_on "python@3.9"
  depends_on "boost@1.85"
  depends_on "boost-python3"
  depends_on "icestorm"

  def install
    boost = Formula["boost@1.85"]
    icestorm = Formula["icestorm"]

    ENV["CMAKE_PREFIX_PATH"] = boost.opt_prefix

    mkdir "build" do
      system "cmake", "..",
             "-DARCH=ice40",
             "-DICESTORM_INSTALL_PREFIX=#{icestorm.opt_prefix}",
             *std_cmake_args
      system "make", "install"
    end
  end

end
