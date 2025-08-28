[https://github.com/will4614/C_VSCode_Template/blob/main/TestOnZeus.md](https://github.com/will4614/C_VSCode_Template/blob/main/TestOnZeus.md)
## Test on Zeus


## Build connection between Zeus and GitHub 
#### Just do this once

* #### Open a terminal on Codespaces and note the prompt
  ```
  will4614 ➜ /workspaces/C_Primer_F2025 (main) $ 
  ```

* #### Connect to Zeus
  ```
  ssh punetid@zeus.cs.pacificu.edu
  ```
* #### Note the prompt for Zeus

  ```
  chadd@zeus:~> 
  ```
* #### It is important to know where you are running your commands

* ### While logged into Zeus, Generate SSH Keys

  ```
  ssh-keygen -t ed25519

  cat ~/.ssh/id_ed25519.pub
  ```
* ### Copy id_ed25519.pub to GitHub

  * [GitHub SSH Keys](https://github.com/settings/keys) - [https://github.com/settings/keys](https://github.com/settings/keys)
  * New SSH Key
  * Copy and paste **id_ed25519.pub** to Key
	  * This your *public* key
    * Never give away your *private* key: id_ed25519
  * Give the key a title: Zeus
  * Add SSH Key


### Test SSH Keys

#### At the Zeus Command line:
```
ssh -T git@github.com
```
#### Look for a success message:
```
Hi will4614! You've successfully authenticated, but GitHub does not provide shell access.
```


### Clone to Zeus from GitHub
#### Everytime you want to test on Zeus

#### On Codespaces
```
git add .
git commit -m "stkPush done!"
git push
```

Find your repository URL.

[https://github.com/CS300F23-PACU](https://github.com/CS300F25-PACU)

Code | Local | SSH

#### Connect to Zeus

```
ssh punetid@zeus.cs.pacificu.edu
```

You should now see **zeus** in the prompt

```
YOU@zeus>
```

Get your code from GitHub
```
mkdir cs300f25 # just do this once this semester
cd cs300f25
git clone git@github.com:CS300F25-PACU/queue-will4614.git
ls
cd queue-will4614
```

* Get the Google Test files:
```
wget https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz;
tar zxf v1.15.2.tar.gz;
mv googletest-1.15.2/ googletest;
rm v1.15.2.tar.gz;
```
* Run unit tests from the command line:
   * Build the test cases
   ```
   export CXX=`which clang++-16`;
   echo $CXX;
   cmake -S . -B ./build;
   cmake --build build --target clean;
   cmake --build build;
   ```

   * To run the test cases:
   ```
   build/test/TestsToRunQ
   ```
* Remove your directory. This allows you to perform a clean checkout the next time you need to test.

  ```
  cd ..
  rm -rf queue-will4614
  ls
  ```
#### Disconnect from Zeus
```
exit
# you should see the Codespaces prompt
```
