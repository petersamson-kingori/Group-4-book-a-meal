# README



*Hot-Fix-Branch
Use this branch to correct failed deploys. It should be merged from the last working development branch before making any feature changes

*development branch:
Use this for tested,working features from the feature-merge branch. Always make a copy using 'git merge development' from the Hot-fix-Branch before working on any features locally so you have a copy of the working development branch before your changes in case something goes wrong.
.

*feature-merge branch:
Use this branch by merging your 'feature-whatever-name' you create. If it commits here without conflicts then we can merge this branch from the development branch. If it spoils, then do the opposite (merge back the development branch from inside the feature-merge branch) 

*feature-whatever-name':
create your own feature branches by checking out from the development branch e.g "git checkout -b feature-authentication". Once finished, test for conflicts by checking out to feature-merge branch and merge your changes. Follow correction steps for feature-merge branch if you experience conflicts or have code-breaking errors.


The root link is: https://group-4-book-a-meal-api.onrender.com/