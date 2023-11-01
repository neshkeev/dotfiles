[ -f /tmp/cwd ] && [ $(pwd) != $(cat /tmp/cwd) ] && cd $(cat /tmp/cwd)

alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias cb='cat ~/.bashrc'

alias c='docker compose'
alias cup='docker compose up --remove-orphans'
alias cbu='docker compose up --build'
alias cps='docker compose ps'
alias ce='docker compose exec -it'

function cex() {
    docker compose exec -it $1 bash
}

alias gp='git push origin HEAD:$(git rev-parse --abbrev-ref HEAD)'

function cd() {
    [ $# -eq 0 ] && pushd ~ || pushd $@
    pwd > /tmp/cwd
}

function b() {
    popd $@
    pwd > /tmp/cwd
}

function set_java() {
    local version=$1

    local jdks_home=$HOME/.jdks

    [ -z $version ] && {
        echo "No version passed"
        return 1
    }

    local jdk_dir=$(ls -lt $jdks_home | grep "$version" | awk '{print $9}'| head -n 1)

    [ -z $jdk_dir ] && {
        echo "No version ${version} found"
        echo "Available versions:"
        ls -lt ${jdks_home}
        return 1
    }

    ln -sf ${jdks_home}/$jdk_dir ${jdks_home}/jdk
}

export JAVA_HOME=~/.jdks/jdk
export M3_HOME=~/tools/apache-maven-3.9.5

export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin
