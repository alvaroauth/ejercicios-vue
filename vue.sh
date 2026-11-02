#!/bin/sh
# Atajos para usar Node/npm adentro de Docker. Los proyectos quedan en proyectos/.
#
#   ./vue.sh crear mi-app        crea un proyecto Vue nuevo (te hace unas preguntas)
#   ./vue.sh dev mi-app          instala dependencias (la 1ra vez) y levanta http://localhost:5173
#   ./vue.sh npm mi-app <...>    corre npm adentro del proyecto (ej: ./vue.sh npm mi-app install vue-router)
#   ./vue.sh shell               abre una terminal adentro del contenedor

set -e
cd "$(dirname "$0")"

comando=$1
proyecto=$2

falta_proyecto() {
  if [ -z "$proyecto" ]; then
    echo "Falta el nombre del proyecto. Ejemplo: ./vue.sh $comando mi-app"
    exit 1
  fi
}

case "$comando" in
  crear)
    falta_proyecto
    docker compose run --rm vue npm create vue@latest "$proyecto"
    echo
    echo "Listo. Para levantarlo:  ./vue.sh dev $proyecto"
    ;;
  dev)
    falta_proyecto
    # --host hace que Vite escuche fuera del contenedor, si no el navegador no llega
    docker compose run --rm --service-ports -w "/proyectos/$proyecto" vue \
      sh -c '[ -d node_modules ] || npm install; npm run dev -- --host'
    ;;
  npm)
    falta_proyecto
    shift 2
    docker compose run --rm -w "/proyectos/$proyecto" vue npm "$@"
    ;;
  shell)
    docker compose run --rm vue sh
    ;;
  *)
    sed -n '2,7p' "$0"
    exit 1
    ;;
esac
