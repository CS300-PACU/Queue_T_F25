/**************************************************************************
 File name:  UnitTests.cpp
 Author:     Computer Science, Pacific University
 Date:			 9.9.16
 Class:			 CS300
 Assignment: Queue
 Purpose:    Unit Test for the Queue
 *************************************************************************/

#include <gtest/gtest.h>

extern "C" {
	#include "../include/queue.h"
}

//***************************************************************************
// Test:    		Test_FirstTest
//
// Description: Demonstrate how to write test, use EXPECT_EQ, and <<
//
//***************************************************************************
TEST (TestSuiteQ, Test_FirstTest) {

  EXPECT_EQ(1, 1) << 
    "1 is not equal to one!";
}

//TEST (TestSuite, ExpectException) {
//  EXPECT_THROW( methodThatThrows( 'A'), std::invalid_argument);
//}

//TEST (TestSuite, ExpectTerminate) {
//  // expect exit with code 1
//  EXPECT_EXIT(methodThatCallsExit(-1), testing::ExitedWithCode(EXIT_FAILURE), ".*");
//  // expect any nonzero exit code
//  EXPECT_DEATH(methodThatCallsExit(-100), ".*");
//}


//https://stackoverflow.com/a/22737849
// cmake --build build 
// build/test/TestsToRun
// TestsToRun is from CMakeLists.txt line 5
//    set(This TestsToRun)
int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
