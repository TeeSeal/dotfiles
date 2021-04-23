alias osslcer="openssl x509 -noout -text -in"

function mkcsr() {
  name="${1%.*}"
  openssl req -new -config "$1" -out "${name}.csr" -keyout "${name}.key"
}
