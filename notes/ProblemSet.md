### 1. O(n logn)求最长上升子序列

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
     * eg 序列[5,6,1,7]，从前向后扫描
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

### 2. 最多两次交易的最大利润

**来源**

Leetcode 123

**描述**

给定一个数组，它的第 *i* 个元素是一支给定的股票在第 *i* 天的价格。

设计一个算法来计算你所能获取的最大利润。最多可以完成*两笔* 交易（两次买入两次卖出）。 

**示例**

> 输入：
>
> ```
> [3,3,5,0,0,3,1,4]
> ```
>
> 输出：
>
> ```
> 6
> ```
>
> 解释：在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。     随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。

**题解**

```java
class Solution {
    /**
     * 使用 local[i][j] 表示到第 i 天最多 j 次交易，且最后一次卖出日为第 i 天的最大利润
     * 使用 global[i][j] 表示到第 i 天最多 j 次交易的最大利润
     * 
     * 转移方程：
     * global 很好得出 global[i][j] = max(global[i - 1][j], local[i][j])
     * local 需要分析一下，第 i 日为卖出日是一定的，对最后一次买入日分情况：
     * 		若为第 i - 1 日，则 
     *			local[i][j] = global[i - 2][j] + prices[i] - prices[i - 1]
     *		若为更早的时间，则可以看作第 i - 1 日别卖了，留到第 i 日卖，可以表示为
     *			local[i][j] = local[i - 1][j] + prices[i] - prices[i - 1]
     * 若第 i - 1 日为买入日，则有 global[i - 2][j] == global[i - i][j]，最后归纳下得到
     *		local[i][j] = max(global[i - i][j], local[i - 1][j]) + prices[i] - prices[i - 1];
     * 由于值覆盖的关系可以对二维数组进行化简为一维。
     */
    public int maxProfit(int[] prices) {

        if(prices==null || prices.length==0)
            return 0;
        int[] local = new int[3];
        int[] global = new int[3];
        for(int i=0;i<prices.length-1;i++)
        {
            int diff = prices[i+1]-prices[i];
            for(int j=2;j>=1;j--)
            {
                local[j] = Math.max(global[j-1], local[j]) + diff;
                global[j] = Math.max(local[j],global[j]);
            }
        }
        return global[2];   
    }
}
```

### 3. 最大子区间

**来源**

[PKU 2796](http://poj.org/problem?id=2796)

**描述**

区间大小定义为区间的和乘以区间最小值的乘积，给定一个序列，求这个序列的最大子区间。

**示例**

> 输入：
>
> ```
> [3,1,6,4,5,2]
> ```
>
> 输出：
>
> ```
> 60
> ```
>
> 解析：
>
> 最大区间为 [6, 4, 5] ，大小为 15 * 4 = 60。

**题解**

```cpp
/**
 * 典型的单调栈应用题
 * 使用单调递增栈同时记录结点值 v 和当前和 s，用这个 s 表示它之前比它大的所有元素的和（含自己）
 * 需要出栈时，可能需要出栈多个结点，每出栈一个结点，就用 sum 累加出栈的 s 
 * 那么对于每个出栈的结点 out，左右区间内比它大的所有结点的和就是 out.s + sum
 * 区间和就为 (out.s + sum) * out.v，这是一个候选值
 * 最后把 sum 累加到当前入栈结点的 s
 */
int maxSection(const int arr[], int n) {
    auto stack = new int[n]; // 单调递增栈
    auto sum = new int[n];
    int top = -1;
    int tSum, t;
    int max = 0x80000000;

    for (int i = 0; i < n; ++i) {
        tSum = 0;

        while (top > -1 && stack[top] > arr[i]) {
            tSum += sum[top];
            if ((t = stack[top--] * tSum) > max)
                max = t;
        }

        stack[++top] = arr[i];
        sum[top] = arr[i] + tSum;
    }

    tSum = 0;
    while (top > -1) {
        tSum += sum[top];
        if ((t = stack[top--] * tSum) > max)
            max = t;
    }

    delete[](stack);
    delete[](sum);

    return max;
}
```

### 4. 寻找有环链表的入口结点

**来源**

牛客网某在线题

**描述**

一个单链表，已知有环，求环的入口结点。

**题解**

使用两个指针，一个快指针每次走两步，一个慢指针每次走一步，等这两个指针第一次相遇时，一定是在环中（此方法也用来判环）。此时快指针走的路程是满指针走的路程的两倍，那么慢指针的路程等于快慢指针路程之差即环的整数倍。那么链表起点到环入口的距离减去相遇点到环入口到相遇点的距离就等于环长的整数倍。也就是说，如果让两个指针分别从起点和相遇点都每次走一步，当他们第一次相遇时候一定在环入口结点。

```cpp
struct Node {
  	int value;
    Node * next;
};

Node * findEntry(Node * root) {
    Node * fast = root, * slow = root;
    do {
        fast = fast->next->next;
        slow = slow->nextl
    } while(fast != slow);
    
    fast = root;
    while(fast != slow) {
        fast = fast->next;
        slow = slow->next;
    }
    
    return fase;
}
```

### 5. 寻找两个相交单链表的第一个交点

**来源**

牛客网面经https://www.nowcoder.com/discuss/99287?type=0&order=0&pos=6&page=1

**描述**

两个单链表，已知相交，求交点。

**解析**

第一种方法可以让一个单链表的末尾结点指向另一个单链表的头结点，然后就转变为了求有环单链表的环入口问题。

第二种方法可以求出两个链表的长度差 diff，然后让较长的单链表指针从头移动 diff 个结点，然后每个链表的指针同步移动，第一个相同的结点就是第一个交点。