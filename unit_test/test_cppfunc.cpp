#include <gtest/gtest.h>
#include "cppfunc.h"

TEST(MyLibTest, Case1_add_int) {
    ASSERT_EQ(add(2, 2), 4);
}

TEST(MyLibTest, Case1_add_double) {
    ASSERT_NEAR(add(2.1, 1.8), 3.9, 0.0000001);
}