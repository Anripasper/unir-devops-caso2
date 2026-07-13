set -e

USER="${1:-admin}"
PASS="${2:-changeme123}"

mkdir -p ssl auth

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ssl/server.key -out ssl/server.crt \
  -subj "/C=ES/ST=Alicante/O=CasoPractico2/CN=cv-web.local"

# Credenciales de la autenticación básica.
htpasswd -bc auth/.htpasswd "$USER" "$PASS"

echo ">> Generado. Usuario web: $USER"
