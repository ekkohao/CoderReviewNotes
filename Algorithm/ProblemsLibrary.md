### O(n logn)求最长上升子序列

**来源**

Leetcode 300

**描述**

 给定一个无序的整数数组，找到其中最长上升子序列的长度。 

**示例**

> 输入：
>
> ```
> [10,9,2,5,3,7,101,18]
> ```
>
> 输出：
>
> ```
> 4
> ```

**题解**

```java
class Solution {
    /**
     * B数组保存当前扫描数相应长度递增序列的最小末位
     * 如 B[i]==3 表示当前长度为i + 1的递增子序列最小末位为3
     * 
     * eg 序列[5,6,1,7]，从向向后扫描
     * 扫描5，B数组为空，B=[5]
     * 扫描6，b=[5,6]
     * 扫描1，b=[1,6],此时长度为1的序列最小末位为1，长度为2的序列最小末位为6
     * 扫描7，b=[1,6,7]
     * 得到最长序列长度3，但具体序列通过B数组无法得出
     * 如需得到具体序列，仍需要O(n^2)的动态规划实现
     */
    public int lengthOfLIS(int[] nums) {
        int[] B = new int[nums.length];
        int len = 0;

        for (int i = 0; i <nums.length ; i++) {
            int p = 0, q = len - 1, mid;
            while (p <= q) {
                mid = (p + q) / 2;
                if(B[mid] > nums[i]) q = mid - 1;
                else if(B[mid] < nums[i]) p = mid + 1;
                else {
                    p = mid;
                    break;
                }
            }
            B[p] = nums[i];
            if(p + 1 > len) len = p + 1;
        }
        
        return len;
    }
}
```

