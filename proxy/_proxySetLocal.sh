_hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
_wslip=$(hostname -I | awk '{print $1}')
_proxyPort=7890

_PROXY_HTTP="http://${_hostip}:${_proxyPort}"

_proxySetShell() {
    echo "setting current shell proxy..."
    export http_proxy="${_PROXY_HTTP}"
    export HTTP_PROXY="${_PROXY_HTTP}"

    export https_proxy="${_PROXY_HTTP}"
    export HTTPS_proxy="${_PROXY_HTTP}"
}


_proxySetGit() {
    echo "setting git proxy..."
    git config --global http.proxy "${_PROXY_HTTP}"
    git config --global https.proxy "${_PROXY_HTTP}"
}

_proxySetAll() {
    echo "setting current shell & git proxy..."
    _proxySetShell
    _proxySetGit
}

_proxyUnsetShell() {
    echo "unsetting current shell proxy..."
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
}

_proxyUnsetGit() {
    echo "unsetting git proxy..."
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

_proxyUnsetAll() {
    echo "unsetting current shell & git proxy..."
    _proxyUnsetShell
    _proxyUnsetGit
}

_proxyTestLocalIP(){
    echo "Host ip:" ${_hostip}
    echo "WSL ip:" ${_wslip} "\n"
}

_proxyTestLocalProxy(){
    echo "Current proxy:" $http_proxy "\n"
}

_proxyTestAll() {
    _proxyTestLocalIP
    _proxyTestLocalProxy
}