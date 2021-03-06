defmodule NervesSystemRpi3Pigpio.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_rpi3_pigpio,
     version: @version,
     elixir: "~> 1.2",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
   []
  end

  defp deps do
    [{:nerves, "~> 0.4.0"},
     {:nerves_system_br, "~> 0.8.1"},
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.8.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
   """
   Nerves System - Raspberry Pi 3 B with pigpio support
   (https://github.com/joan2937/pigpio)
   """
  end

  defp package do
   [maintainers: ["Vassil Kolarov"],
    files: ["LICENSE", "mix.exs", "nerves_defconfig", "nerves.exs", "README.md", "VERSION", "rootfs-additions", "fwup.conf", "cmdline.txt", "linux-4.4.defconfig", "config.txt", "post-createfs.sh"],
    licenses: ["Apache 2.0"],
    links: %{"Github" => "https://github.com/vascokk/nerves_system_rpi3_pigpio"}]
  end
end
