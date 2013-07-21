<?php
/**
 * Calculator.php
 *
 * @package libs
 */


namespace App\Libs;

use InvalidArgumentException;

class Calculator
{

  /**
   * Calculator
   *
   * @param unknown $x
   * @param unknown $y
   * @return unknown
   */
  public function add($x, $y)
  {

    if ( !is_numeric($x) or !is_numeric($y) ) {
      throw new InvalidArgumentException("Please provide a set of integers");
    }

    return $x + $y;
  }


}
