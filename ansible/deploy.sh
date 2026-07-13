set -euo pipefail

for t in ansible-playbook az; do
  command -v "$t" >/dev/null || { echo "Falta la herramienta: $t"; exit 1; }
done
az account show >/dev/null 2>&1 || { echo "No hay sesión de Azure: ejecuta 'az login'"; exit 1; }
[ -f hosts.ini ] || { echo "No existe hosts.ini: ejecuta 'terraform apply' primero"; exit 1; }

echo "== 1/2 App cv-web en la VM (Podman) =="
ansible-playbook playbook_podman.yml

echo "== 2/2 App proyectos-web en AKS =="
ansible-playbook playbook_k8s.yml

echo "== Despliegue completado =="
