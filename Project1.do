/*==============================================================================
    Project:    Using Git and GitHub within Stata do-files.
    Author:     Shaun Scholes
    Date:       September 2026
    Purpose:    Using Git and GitHub within Stata do-files.
    Input:      Stata commands
    Output:     Documented version control
	Location:   "C:/Git/Project1/Project1.do" 
	Run:		Stata
==============================================================================*/


*=======================================================================.
*Created remote repository (https://github.com/shauns11/Project1.git).
*This do-file initially run from desktop.
*=======================================================================.


*Set up (instructions.do):
!git config --global user.name "Shaun Scholes"
!git config --global user.email "s.scholes@ucl.ac.uk"
!git --version
cd "C:/Git/Projects"
!git clone https://github.com/shauns11/Project1.git 

***This downloads the remote repository.
***Creates a folder called Project1 in "C:/Git/Projects"

cd "C:/Git/Projects/Project1"
!git status
!echo "*.dta" >> .gitignore
!git remote -v


*./ is the current directory;
*../ is the parent of the current directory.
!type nul > "./one.txt"
!type nul > "./two.txt"

!echo This is the 1st line >> "one.txt"
!echo This is the 2nd line >> "one.txt"
!echo This is the 1st line >> "two.txt"
!echo This is the 2nd line >> "two.txt"

*create new folder.
!mkdir "C:/Git/Projects/Project1/myFolder"
cd "./myFolder"

!type nul > "three.txt"
!echo This is the 1st line >> "three.txt"
!echo This is the 2nd line >> "three.txt"

cd "C:/Git/Projects/Project1"

*Stata dataset (which we want git to ignore)
input id str20 golfer score
1 "Rory" 64
2 "Tiger" 68
3 "Morikawa" 69
4 "Hideki" 70
5 "Scheffler" 64
6 "Schauffele" 69
7 "Min-Woo" 71
8 "Spieth" 74
9 "Fleetwood" 70
10 "J.J Spaun" 70
end
save "./golfers.dta", replace

!git status                           // local changes now staged.
!git add --all
!git commit -m "Commit 1"             // commit the local changes
!git push -u origin main              // push locally

*make more changes locally.
!echo This is the 3rd line >> "./one.txt"
!echo This is the 3rd line >> "./two.txt"
!echo This is the 3rd line >> "./myFolder/three.txt"
!echo This is the 4th line >> "./myFolder/three.txt"

*staged->commit->push to remote.
!git add --all
!git commit -m "Commit 2" 
!git push -u origin main

*add README.md
!echo # Project1 >> "./README.md"
!git add "./README.md" 
!git commit -m "Commit 3"
!git push -u origin main
!git status
!git log

erase "./README.md"
!git add --all
!git commit -m "Commit 4" 
!git push -u origin main // README.md now deleted from remote.

*Locally: create a branch
!git branch dev
!git switch dev
!type nul > "./onea.txt"
!echo This is the 1st line >> "./onea.txt"
!echo This is the 2nd line >> "./onea.txt"
!git add "./onea.txt"
!git commit -m "Commit 5: File in dev branch" 

*Merge to main and push to remote.
!git switch main                              
!git merge dev                                
!git push -u origin main                      
!git log
!git show

local date `c(current_date)'
local time `c(current_time)'
display _newline "Run `date' at `time'"

*put this do-file in the local repo.
copy "C:/Users/sscho/OneDrive/Desktop/Project1.do" "C:/Git/Projects/Project1/Project1.do", replace
erase "C:/Users/sscho/OneDrive/Desktop/Project1.do" 

*Changes to this do-file only.

!git add "C:/Git/Projects/Project1/Project1.do" 
!git commit -m "Commit 6: Revised Project1.do" 
!git push -u origin main // README.md now deleted from remote.

di "Project1.do finished"





























