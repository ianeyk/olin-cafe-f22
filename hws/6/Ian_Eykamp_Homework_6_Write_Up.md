# Ian Eykamp Homework 6 Write-Up

## 1. Metastability and Designing for Failure

### (a) Estimating reasonable Mean Time Before Failure (MTBF)

#### Toy Piano:
1 year $\approx \pi \cdot 10^7$ seconds.
This could be a little lower, but 1 year is a convenient figure, and you can't always count on a toddler to know how to power cycle the device.

### Industrial Robot Arm:
100 years
Industrial machinery costs on the order of millions of dollars and could cause a lot of physical damage if it malfunctions, so a very large MTBF is warranted. Moreover, since the cost is already so large, and the robotic arm itself has a power draw much larger than the controller circuitry, the cost of bulking up the circuitry to increase the MTBF is relatively small.

### Vehicle ADAS (Automated Driver Assistance System):
10,000 years
Safety critical, so a single error within its lifetime is unacceptable. (Assume its lifetime is 50 years). The MTBF should be very large, subject to performance constraints, but not very sensitive to cost constraints, because human lives are more valuable than money.