*Create remote repository (https://github.com/shauns11/Project1.git).
*Contains the first few lines of this do.file.
!git config --global user.name "Shaun Scholes"
!git config --global user.email "s.scholes@ucl.ac.uk"
!git --version
cd "C:/Git/"
!git clone https://github.com/shauns11/Project1.git

******************************
*Now edit Project1.do locally.
******************************

cd "C:/Git/Project1" 
!git status

*./ is the current directory;
*../ is the parent of the current directory.
!type nul > "./one.txt"
!type nul > "./two.txt"

!echo This is the 1st line >> "one.txt"
!echo This is the 2nd line >> "one.txt"
!echo This is the 1st line >> "two.txt"
!echo This is the 2nd line >> "two.txt"

*create new folder.
!mkdir "C:/Git/Project1/myFolder"
cd "./myFolder"

!type nul > "three.txt"
!echo This is the 1st line >> "three.txt"
!echo This is the 2nd line >> "three.txt"

cd "C:/Git/Project1" 
!git status           // local changes now staged.
!git add --all
!git commit -m "Commit 1" 
!git push -u origin main

******************************
*make more changes locally.
******************************

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
















*create a branch
!git branch dev
!git switch dev
!type nul > "C:/Git/MyProjects/Project4a/onea.txt"
!echo "This is dev text" > "C:/Git/MyProjects/Project4a/onea.txt"
!echo This is the 2nd line >> "C:/Git/MyProjects/Project4a/onea.txt"
!echo This is the 3rd line >> "C:/Git/MyProjects/Project4a/onea.txt"
!echo This is the 4th line >> "C:/Git/MyProjects/Project4a/onea.txt"
!echo This is the 5th line >> "C:/Git/MyProjects/Project4a/onea.txt"
!echo This is the 6th line >> "C:/Git/MyProjects/Project4a/onea.txt"

*add and commit.
!git add "C:/Git/MyProjects/Project4a/onea.txt"
!git commit -m "Commit 6:file in dev branch" 

!git switch main                              // Go back to the main branch
!git merge dev                                // Merge. 
!git push -u origin main                      // Push to remote

!git log
!git show

di "finished"
*************************************************



























