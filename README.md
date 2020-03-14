# HanoiTowers
Hanoi Towers problem implemented by Erlang

Game Description:  
http://en.wikipedia.org/wiki/Tower_of_Hanoi  
https://www.youtube.com/watch?v=h8JPtWpctl4  

Flow:  
1.Create a new Erlang module  
2.Call the functions  
example:  
1> T = hanoi2:create_towers(5).  
[{tower1,[1,2,3,4,5]},{tower2,[]},{tower3,[]}]  

2> Hanoi2:display_towers(T).  
tower1: [5,4,3,2,1]  
tower2: []  
tower3: []  
--------------------
