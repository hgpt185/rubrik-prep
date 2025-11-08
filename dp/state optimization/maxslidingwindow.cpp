class Solution {
    public:
        vector<int> maxSlidingWindow(vector<int>& nums, int k) {
            int n=nums.size();
    
            int ans = 0;
            int mx = -100000;
    
            deque<int> dq;
    
            dq.push_back(0);
            vector<int> ret;
    
            for(int i=0;i<n; i++){
                while(!dq.empty() && dq.front() <= i-k) dq.pop_front();
    
                while(!dq.empty() && nums[dq.back()] < nums[i]) dq.pop_back();
                dq.push_back(i);
    
                if(mx < dq.front()){
                    mx = dq.front();
                    ans = i;
                }
                if(i >= k-1)
                    ret.push_back(nums[dq.front()]);
            }
    
    
            // for(int i=max(ans-k+1, 0); i<=ans; i++) {
            //     ret.push_back(nums[i]);
            // }
    
            return ret;
    
        }
    };