Script for total time calculation spent on a specific activity

**Files**
- st.rb - start script with this file
- sumtime.rb - implementation of all necessary methods
- format.rb - timestamp formats
- tests.rb - unit tests

**Usage**
Manually log time spent on a specific activity (project, work, etc.)
You can log it on paper or sticky notes. Text file or Sticky notes app is also a good option if you prefer to log your time on a computer. 
time is logged in the following format:
```
time_start1 - time end1 time_startN - time endN
```

For example if you've been working on a project from 10:30 to 11:25, then took 20 min. break, started working again at 11:45 and finished working at 12:30 then your working activity would be logged like this:
```
10:30 - 11:25 11:45 - 12:30
```

When you have your time logged, start script from terminal with time intervals as argument.

```
ruby st.rb "10:30 - 11:25 11:45 - 12:30"
```
**Time offsets**
Additionally you can add time offsets. For example you forgot to log time but you know the amount of time spent on a project, you can simply add the amount of time in minutes to your time log:
```
10:30 - 11:25 11:45 - 12:30 20
```

Let's say you've been working on a project from 10:30 to 11:25 but had a phone call for 10 minutes during this time. In this case you can add negative time offset:
```
10:30 - 11:25 -10
```

Some samples of time intervals:
```
10:30 - 11:25 11:45 - 12:30 12:30 - 13:40
10:30 - 11:25 11:45 - 12:30 20 12:30 - 13:40 -5
9:24 - 13:17 13:38 - 13:56 5
```
