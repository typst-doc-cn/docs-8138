#import "/i18n-scope.typ": *
#let live-item-data = (
  "abs": (
    65,
    babel(
      en: [
        Calculates the absolute value of a numeric value.

        ```example
        #calc.abs(-5) \
        #calc.abs(5pt - 2cm) \
        #calc.abs(2fr) \
        #calc.abs(decimal("-342.440"))
        ```
      ],
    ),
  ),
  "abs::value": (
    75,
    babel(
      en: [
        The value whose absolute value to calculate.
      ],
    ),
  ),
  "pow": (
    96,
    babel(
      en: [
        Raises a value to some exponent.

        ```example
        #calc.pow(2, 3) \
        #calc.pow(decimal("2.5"), 2)
        ```
      ],
    ),
  ),
  "pow::base": (
    105,
    babel(
      en: [
        The base of the power.

        If this is a @decimal, the exponent can only be an @int[integer].
      ],
    ),
  ),
  "pow::exponent": (
    109,
    babel(
      en: [
        The exponent of the power.
      ],
    ),
  ),
  "exp": (
    158,
    babel(
      en: [
        Raises a value to some exponent of $e$.

        ```example
        #calc.exp(1)
        ```
      ],
    ),
  ),
  "exp::exponent": (
    166,
    babel(
      en: [
        The exponent of the power.
      ],
    ),
  ),
  "sqrt": (
    187,
    babel(
      en: [
        Calculates the square root of a number.

        ```example
        #calc.sqrt(16) \
        #calc.sqrt(2.5)
        ```
      ],
    ),
  ),
  "sqrt::value": (
    195,
    babel(
      en: [
        The number whose square root to calculate. Must be non-negative.
      ],
    ),
  ),
  "root": (
    204,
    babel(
      en: [
        Calculates the real $n$#super[th] root of a number.

        If the number is negative, then $n$ must be odd.

        ```example
        #calc.root(16.0, 4) \
        #calc.root(27.0, 3)
        ```
      ],
    ),
  ),
  "root::radicand": (
    214,
    babel(
      en: [
        The expression to take the root of.
      ],
    ),
  ),
  "root::index": (
    216,
    babel(
      en: [
        The value of $n$.
      ],
    ),
  ),
  "sin": (
    235,
    babel(
      en: [
        Calculates the sine of an angle.

        When called with an integer or a float, they will be interpreted as radians.

        ```example
        #calc.sin(1.5) \
        #calc.sin(90deg)
        ```
      ],
    ),
  ),
  "sin::angle": (
    245,
    babel(
      en: [
        The angle whose sine to calculate.
      ],
    ),
  ),
  "cos": (
    255,
    babel(
      en: [
        Calculates the cosine of an angle.

        When called with an integer or a float, they will be interpreted as radians.

        ```example
        #calc.cos(1.5) \
        #calc.cos(90deg)
        ```
      ],
    ),
  ),
  "cos::angle": (
    265,
    babel(
      en: [
        The angle whose cosine to calculate.
      ],
    ),
  ),
  "tan": (
    275,
    babel(
      en: [
        Calculates the tangent of an angle.

        When called with an integer or a float, they will be interpreted as radians.

        ```example
        #calc.tan(1.5) \
        #calc.tan(90deg)
        ```
      ],
    ),
  ),
  "tan::angle": (
    285,
    babel(
      en: [
        The angle whose tangent to calculate.
      ],
    ),
  ),
  "asin": (
    295,
    babel(
      en: [
        Calculates the arcsine of a number.

        ```example
        #calc.asin(0) \
        #calc.asin(1)
        ```
      ],
    ),
  ),
  "asin::value": (
    303,
    babel(
      en: [
        The number whose arcsine to calculate. Must be between $-1$ and $1$.
      ],
    ),
  ),
  "acos": (
    313,
    babel(
      en: [
        Calculates the arccosine of a number.

        ```example
        #calc.acos(0) \
        #calc.acos(1)
        ```
      ],
    ),
  ),
  "acos::value": (
    321,
    babel(
      en: [
        The number whose arccosine to calculate. Must be between $-1$ and $1$.
      ],
    ),
  ),
  "atan": (
    331,
    babel(
      en: [
        Calculates the arctangent of a number.

        ```example
        #calc.atan(0) \
        #calc.atan(1)
        ```
      ],
    ),
  ),
  "atan::value": (
    339,
    babel(
      en: [
        The number whose arctangent to calculate.
      ],
    ),
  ),
  "atan2": (
    345,
    babel(
      en: [
        Calculates the four-quadrant arctangent of a coordinate.

        The four-quadrant arctangent of $(x, y)$ is defined as the argument of the
        complex number $x + i y$.

        Returns an @angle between `{-180deg}` and `{180deg}`.

        Note that this function accepts $(x, y)$, not $(y, x)$.

        ```example
        #calc.atan2(1, 1) \
        #calc.atan2(-2, -3)
        ```
      ],
    ),
  ),
  "atan2::x": (
    360,
    babel(
      en: [
        The $x$ coordinate.
      ],
    ),
  ),
  "atan2::y": (
    362,
    babel(
      en: [
        The $y$ coordinate.
      ],
    ),
  ),
  "sinh": (
    368,
    babel(
      en: [
        Calculates the hyperbolic sine of a hyperbolic angle.

        The hyperbolic sine of $x$ is defined as follows:
        $ (e^x - e^(-x)) / 2 $

        ```example
        #calc.sinh(0) \
        #calc.sinh(1.5)
        ```
      ],
    ),
  ),
  "sinh::value": (
    379,
    babel(
      en: [
        The hyperbolic angle whose hyperbolic sine to calculate.
      ],
    ),
  ),
  "cosh": (
    385,
    babel(
      en: [
        Calculates the hyperbolic cosine of a hyperbolic angle.

        The hyperbolic cosine of $x$ is defined as follows:
        $ (e^x + e^(-x)) / 2 $

        ```example
        #calc.cosh(0) \
        #calc.cosh(1.5)
        ```
      ],
    ),
  ),
  "cosh::value": (
    396,
    babel(
      en: [
        The hyperbolic angle whose hyperbolic cosine to calculate.
      ],
    ),
  ),
  "tanh": (
    402,
    babel(
      en: [
        Calculates the hyperbolic tangent of a hyperbolic angle.

        The hyperbolic tangent of $x$ is defined as follows:
        $ (e^x - e^(-x)) / (e^x + e^(-x)) $

        ```example
        #calc.tanh(0) \
        #calc.tanh(1.5)
        ```
      ],
    ),
  ),
  "tanh::value": (
    413,
    babel(
      en: [
        The hyperbolic angle whose hyperbolic tangent to calculate.
      ],
    ),
  ),
  "asinh": (
    419,
    babel(
      en: [
        Calculates the inverse hyperbolic sine of a number.

        The inverse hyperbolic sine of $x$ is defined as follows:
        $ ln(x + sqrt(x^2 + 1)) $

        ```example
        #calc.asinh(0) \
        #calc.asinh(1)
        ```
      ],
    ),
  ),
  "asinh::value": (
    430,
    babel(
      en: [
        The number whose inverse hyperbolic sine to calculate.
      ],
    ),
  ),
  "acosh": (
    436,
    babel(
      en: [
        Calculates the inverse hyperbolic cosine of a number.

        The inverse hyperbolic cosine of $x$ is defined as follows:
        $ ln(x + sqrt(x^2 - 1)) $

        ```example
        #calc.acosh(1) \
        #calc.acosh(2.5)
        ```
      ],
    ),
  ),
  "acosh::value": (
    447,
    babel(
      en: [
        The number whose inverse hyperbolic cosine to calculate. Must be greater
        than or equal to $1$.
      ],
    ),
  ),
  "atanh": (
    458,
    babel(
      en: [
        Calculates the inverse hyperbolic tangent of a number.

        The inverse hyperbolic tangent of $x$ is defined as follows:
        $ 1/2 ln((1 + x) / (1 - x)) $

        ```example
        #calc.atanh(0) \
        #calc.atanh(0.5)
        ```
      ],
    ),
  ),
  "atanh::value": (
    469,
    babel(
      en: [
        The number whose inverse hyperbolic tangent to calculate. Must be
        between $-1$ and $1$ (exclusive).
      ],
    ),
  ),
  "log": (
    480,
    babel(
      en: [
        Calculates the logarithm of a number.

        If the base is not specified, the logarithm is calculated in base ten.

        ```example
        #calc.log(100)
        ```
      ],
    ),
  ),
  "log::value": (
    490,
    babel(
      en: [
        The number whose logarithm to calculate. Must be strictly positive.
      ],
    ),
  ),
  "log::base": (
    492,
    babel(
      en: [
        The base of the logarithm. May not be zero.
      ],
    ),
  ),
  "ln": (
    523,
    babel(
      en: [
        Calculates the natural logarithm of a number.

        ```example
        #calc.ln(calc.e)
        ```
      ],
    ),
  ),
  "ln::value": (
    531,
    babel(
      en: [
        The number whose logarithm to calculate. Must be strictly positive.
      ],
    ),
  ),
  "erf": (
    547,
    babel(
      en: [
        Applies the error function to a number.

        The value of the error function at $x$ is defined as follows:
        $ 2 / sqrt(pi) integral_0^x e^(-t^2) dif t $

        ```example
        #calc.erf(0.2)
        ```
      ],
    ),
  ),
  "erf::value": (
    557,
    babel(
      en: [
        The number at which to calculate the error function.
      ],
    ),
  ),
  "fact": (
    563,
    babel(
      en: [
        Calculates the factorial of a number.

        ```example
        #calc.fact(5)
        ```
      ],
    ),
  ),
  "fact::number": (
    570,
    babel(
      en: [
        The number whose factorial to calculate. Must be non-negative.
      ],
    ),
  ),
  "perm": (
    576,
    babel(
      en: [
        Calculates a permutation.

        Returns the $k$-permutation of $n$, or the number of ways to choose $k$
        items from a set of $n$ with regard to order, defined as follows:
        $
          cases(
            0 quad & "if" k > n,
            (n!) / ((n - k)!) quad & "if" k <= n,
          )
        $

        ```example
        #calc.perm(5, 3)
        ```
      ],
    ),
  ),
  "perm::base": (
    592,
    babel(
      en: [
        The value of $n$: The number of items to choose from. Must be
        non-negative.
      ],
    ),
  ),
  "perm::numbers": (
    595,
    babel(
      en: [
        The value of $k$: The number of items to choose. Must be non-negative.
      ],
    ),
  ),
  "binom": (
    623,
    babel(
      en: [
        Calculates a binomial coefficient.

        Returns the $k$-combination of $n$, or the number of ways to choose $k$
        items from a set of $n$ without regard to order, defined as follows:
        $
          cases(
            (n!) / (k! (n - k)!) quad & "if" 0 <= k <= n,
            0 quad & "otherwise",
          )
        $

        ```example
        #calc.binom(10, 5)
        ```
      ],
    ),
  ),
  "binom::n": (
    639,
    babel(
      en: [
        The value of $n$: The numbers of items to choose from. Must be
        non-negative.
      ],
    ),
  ),
  "binom::k": (
    642,
    babel(
      en: [
        The value of $k$: The number of items to choose. Must be non-negative.
      ],
    ),
  ),
  "gcd": (
    670,
    babel(
      en: [
        Calculates the greatest common divisor of two integers.

        This will error if the result of integer division would be larger than the
        maximum 64-bit signed integer.

        ```example
        #calc.gcd(7, 42)
        ```
      ],
    ),
  ),
  "gcd::a": (
    680,
    babel(
      en: [
        The first integer.
      ],
    ),
  ),
  "gcd::b": (
    682,
    babel(
      en: [
        The second integer.
      ],
    ),
  ),
  "lcm": (
    695,
    babel(
      en: [
        Calculates the least common multiple of two integers.

        ```example
        #calc.lcm(96, 13)
        ```
      ],
    ),
  ),
  "lcm::a": (
    702,
    babel(
      en: [
        The first integer.
      ],
    ),
  ),
  "lcm::b": (
    704,
    babel(
      en: [
        The second integer.
      ],
    ),
  ),
  "floor": (
    717,
    babel(
      en: [
        Rounds a number down to the nearest integer.

        If the number is already an integer, it is returned unchanged.

        Note that this function will always return an @int[integer], and will error
        if the resulting @float or @decimal is larger than the maximum 64-bit signed
        integer or smaller than the minimum for that type.

        ```example
        #calc.floor(500.1)
        #assert(calc.floor(3) == 3)
        #assert(calc.floor(3.14) == 3)
        #assert(calc.floor(decimal("-3.14")) == -4)
        ```
      ],
    ),
  ),
  "floor::value": (
    733,
    babel(
      en: [
        The number to round down.
      ],
    ),
  ),
  "ceil": (
    744,
    babel(
      en: [
        Rounds a number up to the nearest integer.

        If the number is already an integer, it is returned unchanged.

        Note that this function will always return an @int[integer], and will error
        if the resulting @float or @decimal is larger than the maximum 64-bit signed
        integer or smaller than the minimum for that type.

        ```example
        #calc.ceil(500.1)
        #assert(calc.ceil(3) == 3)
        #assert(calc.ceil(3.14) == 4)
        #assert(calc.ceil(decimal("-3.14")) == -3)
        ```
      ],
    ),
  ),
  "ceil::value": (
    760,
    babel(
      en: [
        The number to round up.
      ],
    ),
  ),
  "trunc": (
    771,
    babel(
      en: [
        Returns the integer part of a number.

        If the number is already an integer, it is returned unchanged.

        Note that this function will always return an @int[integer], and will error
        if the resulting @float or @decimal is larger than the maximum 64-bit signed
        integer or smaller than the minimum for that type.

        ```example
        #calc.trunc(15.9)
        #assert(calc.trunc(3) == 3)
        #assert(calc.trunc(-3.7) == -3)
        #assert(calc.trunc(decimal("8493.12949582390")) == 8493)
        ```
      ],
    ),
  ),
  "trunc::value": (
    787,
    babel(
      en: [
        The number to truncate.
      ],
    ),
  ),
  "fract": (
    798,
    babel(
      en: [
        Returns the fractional part of a number.

        If the number is an integer, returns `0`.

        ```example
        #calc.fract(-3.1)
        #assert(calc.fract(3) == 0)
        #assert(calc.fract(decimal("234.23949211")) == decimal("0.23949211"))
        ```
      ],
    ),
  ),
  "fract::value": (
    809,
    babel(
      en: [
        The number to truncate.
      ],
    ),
  ),
  "round": (
    819,
    babel(
      en: [
        Rounds a number to the nearest integer.

        Half-integers are rounded away from zero.

        Optionally, a number of decimal places can be specified. If negative, its
        absolute value will indicate the amount of significant integer digits to
        remove before the decimal point.

        Note that this function will return the same type as the operand. That is,
        applying `round` to a @float will return a `float`, and to a @decimal,
        another `decimal`. You may explicitly convert the output of this function to
        an integer with @int, but note that such a conversion will error if the
        `float` or `decimal` is larger than the maximum 64-bit signed integer or
        smaller than the minimum integer.

        In addition, this function can error if there is an attempt to round beyond
        the maximum or minimum integer or `decimal`. If the number is a `float`,
        such an attempt will cause `{float.inf}` or `{-float.inf}` to be returned
        for maximum and minimum respectively.

        ```example
        #calc.round(3.1415, digits: 2)
        #assert(calc.round(3) == 3)
        #assert(calc.round(3.14) == 3)
        #assert(calc.round(3.5) == 4.0)
        #assert(calc.round(3333.45, digits: -2) == 3300.0)
        #assert(calc.round(-48953.45, digits: -3) == -49000.0)
        #assert(calc.round(3333, digits: -2) == 3300)
        #assert(calc.round(-48953, digits: -3) == -49000)
        #assert(calc.round(decimal("-6.5")) == decimal("-7"))
        #assert(calc.round(decimal("7.123456789"), digits: 6) == decimal("7.123457"))
        #assert(calc.round(decimal("3333.45"), digits: -2) == decimal("3300"))
        #assert(calc.round(decimal("-48953.45"), digits: -3) == decimal("-49000"))
        ```
      ],
    ),
  ),
  "round::value": (
    855,
    babel(
      en: [
        The number to round.
      ],
    ),
  ),
  "round::digits": (
    857,
    babel(
      en: [
        If positive, the number of decimal places.

        If negative, the number of significant integer digits that should be
        removed before the decimal point.
      ],
    ),
  ),
  "clamp": (
    879,
    babel(
      en: [
        Clamps a number between a minimum and maximum value.

        ```example
        #calc.clamp(5, 0, 4)
        #assert(calc.clamp(5, 0, 10) == 5)
        #assert(calc.clamp(5, 6, 10) == 6)
        #assert(calc.clamp(decimal("5.45"), 2, decimal("45.9")) == decimal("5.45"))
        #assert(calc.clamp(decimal("5.45"), decimal("6.75"), 12) == decimal("6.75"))
        ```
      ],
    ),
  ),
  "clamp::value": (
    891,
    babel(
      en: [
        The number to clamp.
      ],
    ),
  ),
  "clamp::min": (
    893,
    babel(
      en: [
        The inclusive minimum value.
      ],
    ),
  ),
  "clamp::max": (
    895,
    babel(
      en: [
        The inclusive maximum value.
      ],
    ),
  ),
  "min": (
    914,
    babel(
      en: [
        Determines the minimum of a sequence of values.

        ```example
        #calc.min(1, -3, -5, 20, 3, 6) \
        #calc.min("typst", "is", "cool")
        ```
      ],
    ),
  ),
  "min::values": (
    923,
    babel(
      en: [
        The sequence of values from which to extract the minimum. Must not be
        empty.
      ],
    ),
  ),
  "max": (
    931,
    babel(
      en: [
        Determines the maximum of a sequence of values.

        ```example
        #calc.max(1, -3, -5, 20, 3, 6) \
        #calc.max("typst", "is", "cool")
        ```
      ],
    ),
  ),
  "max::values": (
    940,
    babel(
      en: [
        The sequence of values from which to extract the maximum. Must not be
        empty.
      ],
    ),
  ),
  "even": (
    969,
    babel(
      en: [
        Determines whether an integer is even.

        ```example
        #calc.even(4) \
        #calc.even(5) \
        #range(10).filter(calc.even)
        ```
      ],
    ),
  ),
  "even::value": (
    978,
    babel(
      en: [
        The number to check for evenness.
      ],
    ),
  ),
  "odd": (
    984,
    babel(
      en: [
        Determines whether an integer is odd.

        ```example
        #calc.odd(4) \
        #calc.odd(5) \
        #range(10).filter(calc.odd)
        ```
      ],
    ),
  ),
  "odd::value": (
    993,
    babel(
      en: [
        The number to check for oddness.
      ],
    ),
  ),
  "rem": (
    999,
    babel(
      en: [
        Calculates the remainder of two numbers (signed modulo).

        The value `calc.rem(x, y)` always has the same sign as `x`, and is smaller
        in magnitude than `y`.

        This can error if given a @decimal input and the dividend is too small in
        magnitude compared to the divisor.

        ```example
        #calc.rem(7, 3) \
        #calc.rem(7, -3) \
        #calc.rem(-7, 3) \
        #calc.rem(-7, -3) \
        #calc.rem(1.75, 0.5)
        ```
      ],
    ),
  ),
  "rem::dividend": (
    1017,
    babel(
      en: [
        The dividend of the remainder.
      ],
    ),
  ),
  "rem::divisor": (
    1019,
    babel(
      en: [
        The divisor of the remainder.
      ],
    ),
  ),
  "div_euclid": (
    1041,
    babel(
      en: [
        Performs euclidean division of two numbers.

        The result of this computation is that of a division rounded to the integer
        `{n}` such that the dividend is greater than or equal to `{n}` times the
        divisor.

        This can error if the resulting number is larger than the maximum value or
        smaller than the minimum value for its type.

        ```example
        #calc.div-euclid(7, 3) \
        #calc.div-euclid(7, -3) \
        #calc.div-euclid(-7, 3) \
        #calc.div-euclid(-7, -3) \
        #calc.div-euclid(1.75, 0.5) \
        #calc.div-euclid(decimal("1.75"), decimal("0.5"))
        ```
      ],
    ),
  ),
  "div_euclid::dividend": (
    1061,
    babel(
      en: [
        The dividend of the division.
      ],
    ),
  ),
  "div_euclid::divisor": (
    1063,
    babel(
      en: [
        The divisor of the division.
      ],
    ),
  ),
  "rem_euclid": (
    1083,
    babel(
      en: [
        This calculates the least nonnegative remainder of a division (nonnegative
        modulo).

        Warning: Due to a floating point round-off error, the remainder may equal
        the absolute value of the divisor if the dividend is much smaller in
        magnitude than the divisor and the dividend is negative. This only applies
        for floating point inputs.

        In addition, this can error if given a @decimal input and the dividend is
        too small in magnitude compared to the divisor.

        ```example
        #calc.rem-euclid(7, 3) \
        #calc.rem-euclid(7, -3) \
        #calc.rem-euclid(-7, 3) \
        #calc.rem-euclid(-7, -3) \
        #calc.rem-euclid(1.75, 0.5) \
        #calc.rem-euclid(decimal("1.75"), decimal("0.5"))
        ```
      ],
    ),
  ),
  "rem_euclid::dividend": (
    1105,
    babel(
      en: [
        The dividend of the remainder.
      ],
    ),
  ),
  "rem_euclid::divisor": (
    1107,
    babel(
      en: [
        The divisor of the remainder.
      ],
    ),
  ),
  "quo": (
    1129,
    babel(
      en: [
        Calculates the quotient (floored division) of two numbers.

        Note that this function will always return an @int[integer], and will error
        if the resulting number is larger than the maximum 64-bit signed integer or
        smaller than the minimum for that type.

        ```example
        $ "quo"(a, b) &= floor(a/b) \
          "quo"(14, 5) &= #calc.quo(14, 5) \
          "quo"(3.46, 0.5) &= #calc.quo(3.46, 0.5) $
        ```
      ],
    ),
  ),
  "quo::dividend": (
    1143,
    babel(
      en: [
        The dividend of the quotient.
      ],
    ),
  ),
  "quo::divisor": (
    1145,
    babel(
      en: [
        The divisor of the quotient.
      ],
    ),
  ),
  "norm": (
    1175,
    babel(
      en: [
        Calculates the $p$-norm of a sequence of values.

        The $p$-norm of $x_1, ..., x_n$ is defined as follows:
        $
          cases(
            (sum_(i=1)^n abs(x_i)^p)^frac(style: "horizontal", 1, p)
            quad & "if" 0 < p < +oo,
            max_(i=1)^n abs(x_i) quad & "if" p = +oo,
          )
        $

        ```example
        #calc.norm(1, 2, -3, 0.5) \
        #calc.norm(p: 3, 1, 2)
        ```
      ],
    ),
  ),
  "norm::p": (
    1192,
    babel(
      en: [
        The value of $p$. Must be greater than zero.

        The default value of `{2.0}` corresponds to the Euclidean norm:
        $ sqrt(sum_(i=1)^n x_i^2) $
      ],
    ),
  ),
  "norm::values": (
    1199,
    babel(
      en: [
        The sequence of values to calculate the $p$-norm of. Returns `{0.0}`
        if empty.
      ],
    ),
  ),
)
