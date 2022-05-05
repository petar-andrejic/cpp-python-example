#include <catch2/catch.hpp>
#include <example/foo.hpp>

TEST_CASE("Addition works", "[add]") {
    REQUIRE(example::add(1, 2) == 3);
}