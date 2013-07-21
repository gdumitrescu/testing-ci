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
     *
     * @return unknown
     */
    public function inputNumbers() {
        return [
        [2, 2 , 4],
        [-9, -9 , 18]
        ];
    }


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
     * Test instance of $this->calc
     *
     * @test
     */
    public function testInstanceOf() {

        $this->assertInstanceOf('App\Libs\Calculator', $this->calc);
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
     * @dataProvider inputNumbers
     * @test
     * @param unknown $x
     * @param unknown $y
     * @param unknown $sum
     */
    public function testValidResult($x, $y, $sum) {

        $this->assertEquals($sum, $this->calc->add($x, $y));
    }


}
