PSwebstone
==========

PowerShell v1.0.0 Web load tool

This tool loads web endpoints from a windows powershell workflow, where parallel processing simulates a concurrent user base.


Release notes:
--------------
v1.0.0
proof of concept using windows workflow.  
logging is via listener.exe which listens on a UDP port ( 7700 ) and logs output to console and or
log file.





To do:
-------
Endpoints and configuration needs to be teased out and set in commandlets in the out of process worker activity process
Add functions to the procedural code?  or not?
Understand workflow jobs better and have ability to poll jobs status 
