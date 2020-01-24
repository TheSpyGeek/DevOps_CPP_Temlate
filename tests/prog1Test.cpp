#include "gtest/gtest.h"
#include "../src/Hello.h"

TEST(blaTest, test1) {
    //arrange
    //act
    //assert

    Hello h1;

    EXPECT_EQ (h1.getMessage(),  "Bonjour");
}


TEST(blaTest2, test2) {
    //arrange
    //act
    //assert

    Hello h1;

    EXPECT_NE(h1.getMessage(), "Hello");
}