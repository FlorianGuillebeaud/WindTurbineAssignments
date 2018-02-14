# WindTurbineAssignments

Git presents the avantage that everyone can work on the source folder (cloned locally) and then submit it to GitHub. One could also work on someone's code by cloning it to its local directory (I guess). 

What is Git ? 
-- Git is a powerfull Version Control. 

What is a Version control ? 
-- To make it simple, it's the idea of keeping history when collaborating on a same project. 

Still confused ? 
-- See that as a google drive where everyone could work separatly on the code assignment1.m and then have access to someone's modifications. 

Maybe, but how does it work ? 
-- First of, for Git to work, you'll have to use your Terminal. Once you have found how to open a Terminal window, you've done most of the job. 

Hang on, what is a Terminal window ? 
-- I guess at the very beginning of computer, it was the only interface to communicate to the computer. On windows, you can simply open it by following Start >> Program Files >> Accessories >> Command Prompt. You can read the basic commands online to get the main idea.

Ok got it, what's next ?
-- Create an account on GitHub.com, which hosts the master and branches of the project on which we're going to work on (for us it's gonna be the data files, the matlab code and do one, but it can be extended to everything !) 

Fair enough, then ? 
-- I have created a remote directory on GitHub that contains all the files (so far) of our project, plus this README file. What you're going to do is then clone this remote directory locally on your computer, wherever you want. 

Do so by : 
- first locating your terminal in the directory you wanna be 
- typing in the Terminal : git clone + "the url you will get from me I guess"

----------
----------
Now we can start working 
----------
----------

There are few basic commands we'll be using mainly all the time ! 
1/ git status % tells you the status of the directory you're working on (all the modifications if there are some, if files are not tracked...)
=> use it straight "git status"

- git add % add the modification you've brought to a file for instance. It can also be used to add a new file that was no tracked - for instance you decide to create a new function.m, you then need to track it on git, so first of, add it ! 
=> use it as follow : "git add function.m" or "git add --all" (will add everything at once!) 

- git commit % when added, the files are just on the local staging area, neither the remote or the local directory see these modifications. However, now you can commit. Commit basically puts the files you commit on the local repository. That means that now you can see the modification you have done, and they have been saved locally. 
=> use it as follow : "git commit -m "write a message here" " NB : -m "" is REALLY IMPORTANT, it's simply a brief message to inform what you have done. AVOID "modifications" or "function.m modified" since git save the modifications, we'll know that you have modified it ! Prefer -m "function.m import vector detailled" or whatever, but be specific and short. 

What if I forget to put -m "" ? Well you'll see a weird message appear, from which you'll only be able to get out by : 
1/ specifying a message
2/ press ESC and write :wq (don't ask me why)

- git push % now you want us to see the changes you've made, i.e. you want to save the modifications on the remote depository. This push command simply pushes the modification up-there. 
=> use it as follow : "git push origin master" (if you work on the master // we'll get back to that)

- git pull % let's say some one comes the morning early, want to work on the project, then he would have to pull (down on its directory) what you have pushed earlier ! (make sense right ?)
=> use it as follow : "git pull origin master" if you want to pull everything down from the master


That is basically it for the simple and basic commands.   

----------
----------
Let's complexify a bit
----------
----------


alias graph "git log --all --decorate --online --graph"
https://www.youtube.com/watch?v=FyAAIHHClqI


Ok I hadn't figured it out until now but you can do everything in here !


Demonstration for my friends

