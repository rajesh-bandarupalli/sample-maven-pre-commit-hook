# How to automate coding standards and enforce code coverage, code quality and code security in a Java project.

> **Goal:** 
> 
>  1. Format the code automatically as per [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html).
>  2. Run test cases in the corresponding maven module and fail the commit, if minimum required code coverage is not met.
>  3. Run static code analysis on staged files and fail the commit, if there are any critical issues.

> **Configuration required:**  
> Define below plugins in `pom.xml`.
>  1. Define `git-build-hook-maven-plugin` plugin.
>  2. Define `maven-git-code-format` plugin.
>  3. Define `spotbugs-maven-plugin` plugin.
>  4. Create `pre-commit.sh` file in the root directory of the maven module and give it execute permission by running `chmod +x pre-commit.sh`

> **How does it work?**
> 
>  1. Run  `mvn clean install`  
	> 		- During maven life cycle `install` phase, content of `pre-commit.sh` will be copied to `pre-commit`
	file in `.git/hooks` directory.
>  2. When files are committed pre-commit hook will be invoked by git and if the script returns a non zero exit code, commit will be failed.

Reference:

 - Pre-commit hooks for maven project. https://github.com/rudikershaw/git-build-hook
 - Code formatting as per [Google Java StyleGuide](https://google.github.io/styleguide/javaguide.html).
	 - https://github.com/google/google-java-format
	 - https://github.com/Cosium/git-code-format-maven-plugin
 - Code Coverage Check https://www.eclemma.org/jacoco/
 - Code Quality and Code Security: https://spotbugs.readthedocs.io/en/stable/index.html
