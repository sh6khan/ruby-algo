# There are two sorted arrays nums1 and nums2 of size m and n respectively.
# Find the median of the two sorted arrays. The overall run time complexity MUST be O(log (m+n)).

# to find the median of an array of N size
# (Array[(N-1)/2] + Array[(N/2)]) / 2


# INCOMPLETE
def find_median(nums1, nums2)

  len1 = nums1.length
  len2 = nums2.length

  return find_median(nums2, nums1) if (len1 < len2)

  return (nums1[(len1-1)/2] + nums1[(len/2)] ) / 2 if len2 == 0

  lo = 0
  hi = len1 * 2

  while lo <= hi
    cut1 =
  end

end
