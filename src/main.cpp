#include <spdlog/spdlog.h>

#include <iterator>
#include <string_view>
#include <vector>

auto main(int argc, char* argv[]) -> int {
  const std::vector<std::string_view> args(argv, std::next(argv, argc));

  if (!args.empty()) {
    spdlog::info("{}: A template for C++ projects", args[0]);
  }

  return 0;
}
