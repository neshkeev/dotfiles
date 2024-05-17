[ -f /tmp/cwd ] && [ "$(pwd)" != "$(cat /tmp/cwd)" ] && cd "$(cat /tmp/cwd)"

[ -f ~/.tokens ] && source ~/.tokens

export HISTFILESIZE=100000
export HISTSIZE=100000

alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias cb='cat ~/.bashrc'

alias d='docker'
alias de='docker exec -it'
alias c='docker compose'
alias cup='docker compose up --remove-orphans'
alias cbu='docker compose up --build --remove-orphans'
alias cps='docker compose ps'
alias ce='docker compose exec -it'

function cex() {
    docker compose exec -it $1 bash
}

function ceh() {
    docker compose exec -it $1 sh
}

alias gp='git push origin HEAD:$(git rev-parse --abbrev-ref HEAD)'

function cd() {
    [ $# -eq 0 ] && pushd ~ || pushd "$@"
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

    local jdk_dir=$(ls -t $jdks_home | grep "\-$version" | head -n 1)

    [ -z $jdk_dir ] && {
        echo "No version ${version} found"
        echo "Available versions:"
        ls -lt ${jdks_home}
        return 1
    }

    rm -rf ${jdks_home}/jdk

    ln -sf ${jdks_home}/$jdk_dir ${jdks_home}/jdk
}

function check_ports() {
    cat /proc/net/tcp | awk '{print $2}' | awk -F ':' '{print "0x"$2}' | while read line; do printf "%d\n" "$line" ; done | sort -un
}

function rand_word() {
    cat /dev/urandom | tr -dc '[:alpha:][:digit:]' | fold -w ${1:-32} | head -n 1
}

export JAVA_HOME=~/.jdks/jdk
export M3_HOME=~/tools/apache-maven-3.9.5

export PATH=$PATH:$JAVA_HOME/bin:$M3_HOME/bin
