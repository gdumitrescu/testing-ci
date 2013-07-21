<?php
/**
 * CakculatorTest.php
 *
 * @package Tests
 */


use App\Libs\Calculator;

class CalculatorTest extends PHPUnit_Framework_TestCase {

    private $calc = null;


    /**
     * Setup the test environment
     */
    public function setUp() {

        $this->calc = new Calculator;
    }


    /**
     * Teardown the test environment
     */
    public function tearDown() {

        $this->calc = null;
    }


    /**
     * Test provide invalid argument throw an exception
     *
     * @expectedException InvalidArgumentException
     */
    public function testInvalidArgumentIsProperlyThrown() {

        $this->calc->add('A', 2);

    }


    /**
     * Test calculation return a true sumi
     *
     * @test
     */
    public function testValidResult() {

        $this->assertEquals(4, $this->calc->add(2, 2));
    }


}
