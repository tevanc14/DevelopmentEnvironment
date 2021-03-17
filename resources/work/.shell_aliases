GOOGLE_DRIVE="/Users/tevanc/Google\ Drive/My\ Drive"
SUBLIME="/usr/local/bin/sublime"
TOMCAT="/usr/local/Cellar/tomcat/9.0.29/libexec"
ZDEV="/Volumes/zDev"

DEV_STUFF="${GOOGLE_DRIVE}/devStuff"
WORK_DOCS="${GOOGLE_DRIVE}/workDocs"
SCRIPTS="${DEV_STUFF}/scripts"
AWS="${SCRIPTS}/aws"
BUILD="${SCRIPTS}/build"
CONNECTION="${SCRIPTS}/connection"
TRULY_RANDOM="${DEV_STUFF}/random/trulyRandom"
WEBAPPS="${TOMCAT}/webapps"

# Navigation
alias 1on1='mkdir -p "/Users/tevanc/Google Drive/My Drive/workDocs/careerDevelopment/1on1/$(date +'%Y')/$(date +'%m')" && cd "$_"'
alias build="cd ${BUILD}"
alias desk="cd ~/Desktop"
alias devst="cd ${DEV_STUFF}"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias expense="cd ${WORK_DOCS}/expense"
alias notes="cd ${WORK_DOCS}/notes"
alias notes_now='mkdir -p "/Users/tevanc/Google Drive/My Drive/workDocs/notes/misc/$(date +'%Y')/$(date +'%m')" && cd "$_"'
alias now='mkdir -p "$(date +'%Y')/$(date +'%m')" && cd "$_"'
alias personal="cd ~/personal"
alias projects="cd ~/personal/projects"
alias proof="cd ${GOOGLE_DRIVE}/workDocs/careerDevelopment/proofOfWork"
alias scripts="cd ${SCRIPTS}"
alias tomcat="cd ${TOMCAT}"
alias webapps="cd ${TOMCAT}/webapps"
alias workdocs="cd ${GOOGLE_DRIVE}/workDocs/"
alias zdev="cd ${ZDEV}/; ls -lh"

# Files
alias edit_aliases="vim ~/.bash_aliases"
alias edit_functions="vim ~/.bash_functions"
alias edit_zsh="vim ~/.zshrc"
alias source_zsh="source ~/.zshrc"
alias tomcat_logs_tail="tail -f ${TOMCAT}/logs/catalina.out"
alias tomcat_logs_view="vim ${TOMCAT}/logs/catalina.out"

# Build
alias build_admin="sh ${BUILD}/admin-build.sh"
alias build_admin_devweb="sh ${BUILD}/admin-build-devweb.sh"
alias build_admin_test="sh ${BUILD}/admin-build-test.sh"
alias build_ratecloud="sh ${BUILD}/ratecloud-build.sh"
alias build_marksman="sh ${BUILD}/marksman-build.sh"
alias build_marksman_devweb="sh ${BUILD}/marksman-build-devweb.sh"
alias build_marksman_test="sh ${BUILD}/marksman-build-test.sh"
alias build_mi="sh ${BUILD}/mi-build.sh"
alias build_mi_test="sh ${BUILD}/mi-build-test.sh"
alias build_connect="sh ${BUILD}/connect-build.sh"
alias build_lockinpro="sh ${BUILD}/lockinpro-build.sh"
alias build_lockinpro_devweb="sh ${BUILD}/lockinpro-build-devweb.sh"
alias build_ratecloud_fast="sh ${BUILD}/ratecloud-build-fast.sh"
alias build_lendingtree="sh ${BUILD}/lendingtree-build.sh"
alias copy_marksman_jsps="cp -r ${ZDEV}/marksman/src/main/webapp/mpgjsp/ ${WEBAPPS}/mpg/mpgjsp/"
alias copy_marksman_jsps_devweb="sh ${BUILD}/copy-marksman-jsps-devweb.sh"
alias repeat_gradle="sh ${SCRIPTS}/random/repeatGradle.sh"
alias restart_tomcat="sh ${TOMCAT}/bin/catalina.sh stop; sh ${TOMCAT}/bin/catalina.sh start"
alias restart_tomcat_log="restart_tomcat && tomcat_logs_tail"

    ## Shorthand
    alias bm="build_marksman"
    alias bmrt="build_marksman; restart_tomcat;"
    alias rt="restart_tomcat"

# Connection
alias devweb="sh ${CONNECTION}/devweb.sh"
alias beanstalk_connect="python3 ${AWS}/beanstalk_connect/main.py"

# Development Scripts
alias MakeLambdaRepo="${ZDEV}/devscripts/lambda/MakeLambdaRepo"

# Pip
alias pip_update="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# Virtual Environment
alias activate="source venv/bin/activate"
alias make_venv="python3 -m venv venv"

# Python setup
alias pyset="python setup.py"
alias pysetbuild="python setup.py build"
alias pysettest="python setup.py test"
alias pysetzip="python setup.py zip"

# AWS
alias replace_swagger_fields="sh ${AWS}/replaceSwaggerFields.sh"

# Git
alias gcmsg_personal='git commit --author="Tevan Carrell <tevanc14@gmail.com>" -m'
alias gedit_commit="git commit --amend --no-edit && git push -f"
alias gloa="git pull origin alpha"
alias glom="git pull origin master"
alias gundo_commit="git reset HEAD~"

# Gitlab
alias glrepo="sh ${SCRIPTS}/random/gitlabRepoFinder.sh"

# Npm
alias n="npm"
alias ni="npm install"
alias nig="npm install -g"
alias nisd="npm install --save-dev"
alias nisp="npm install --save-prod"
alias nr="npm run"
alias nu="npm uninstall"
alias nug="npm uninstall -g"
alias nup="npm update"

# Terraform
alias tfm="terraform"

# Text formatting
alias prettier_clipboard="pbpaste > tmp.json && prettier --write tmp.json && cat tmp.json | pbcopy && rm tmp.json"
alias json_key_quote="pbpaste | sed -E 's/(([a-zA-Z\d])+)(:)/\"\1\"\3/g' | pbcopy"

# Miscellaneous
alias bouncer="cat ${TRULY_RANDOM}/bouncer.txt"
alias delete_buffers="find . -type f -name '*~' -exec rm -f '{}' \;"
# Get this by running displayplacer list
alias displays='displayplacer "id:A13B341A-0E7F-95AF-1EA0-012087BE01C7 res:1080x1920 hz:60 color_depth:8 scaling:off origin:(0,0) degree:270" "id:859049B2-A570-3206-9D30-96334A001B09 res:3840x2160 hz:60 color_depth:8 scaling:off origin:(-3840,-123) degree:0" "id:1D928CD0-D7F2-F55E-54A7-D4DF0F26992A res:1080x1920 hz:60 color_depth:8 scaling:off origin:(-4920,0) degree:90"'
alias flip="cat ${TRULY_RANDOM}/flip.txt"
alias msim_url="cat ${TRULY_RANDOM}/marketplaceSimJWT.txt | pbcopy"
alias oath_runner="sh ${SCRIPTS}/random/oathCaller/wrapper.sh"
alias quote_bitbucket="npm run --prefix ${SCRIPTS}/random/quoteBitbucket quote"
alias refresh_search_repos="sh ${SCRIPTS}/random/refreshSearchRepos.sh"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias sublime=${SUBLIME}
alias tomcat_logs="tail -f ${TOMCAT}/logs/catalina.out"
