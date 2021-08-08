package service;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.techiethoughts.service.PrimeCheckService;
import org.junit.jupiter.api.Test;

public class PrimeCheckServiceTest {

  private PrimeCheckService primeCheckService;

  public PrimeCheckServiceTest() {
    primeCheckService = new PrimeCheckService();
  }

  @Test
  public void checkIfNumber2IsPrime() {

    assertTrue(primeCheckService.isPrime(2));
  }

  @Test
  public void checkIfNumber3IsPrime() {

    assertTrue(primeCheckService.isPrime(3));
  }

  @Test
  public void checkIfNumber8IsPrime() {

    assertFalse(primeCheckService.isPrime(8));
  }
}
