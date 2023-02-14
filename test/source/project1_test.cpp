#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "project1" ? 0 : 1;
}
