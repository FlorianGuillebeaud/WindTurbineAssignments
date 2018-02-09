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
- typing in the Terminal : git clone + "the url you will get from me"

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
=> use it as follow : "git commit "




What is the difference between git commit and git add ? 
