def countdown(n):
    """
    >>> for number in countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    "*** YOUR CODE HERE ***"
    val=n
    while val>=0:
        yield val
        val-=1
def trap(s, k):
    """Return a generator that yields the first K values in iterable S,
    but raises a ValueError exception if any more values are requested.

    >>> t = trap([3, 2, 1], 2)
    >>> next(t)
    3
    >>> next(t)
    2
    >>> next(t)
    ValueError
    >>> list(trap(range(5), 5))
    ValueError
    """
    assert len(s) >= k
    "*** YOUR CODE HERE ***"
    val=0
    while val<k:
        yield s[val]
        val+=1
    raise ValueError("It's a trap!")

def repeated(t, k):
    """Return the first value in iterator T that appears K times in a row.

    >>> s = [3, 2, 1, 2, 1, 4, 4, 5, 5, 5]
    >>> repeated(trap(s, 7), 2)
    4
    >>> repeated(trap(s, 10), 3)
    5
    >>> print(repeated([4, None, None, None], 3))
    None
    """
    assert k > 1
    "*** YOUR CODE HERE ***"
    count=0
    list_el=None
    for el in t:
        if el == list_el:
            count+=1
            if count==k:
                return el
        else:
            count=1
        list_el=el


def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    "*** YOUR CODE HERE ***"
    i = n
    while i != 1:
        yield i
        if i % 2 == 0:
            i //=2
        else:
            i=i*3+1
    yield i
