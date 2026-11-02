# Aprendé Vue con ejercicios 

12 ejercicios cortos que van desde cero hasta armar una app de tareas completa.
Cada ejercicio es **un solo archivo HTML**: no hay que instalar nada, Vue se carga desde internet.

```
Vue/
├── README.md        ← esto
├── estilos.css      ← estilos compartidos (no hace falta tocarlo)
├── ejercicios/      ← acá trabajás vos
├── soluciones/      ← para cuando te trabás (mismo nombre de archivo)
├── Dockerfile, docker-compose.yml, vue.sh   ← para crear proyectos Vue "de verdad"
└── proyectos/       ← acá quedan esos proyectos
```

## Antes de empezar

- Necesitás saber lo básico de **HTML** y **JavaScript**: variables, funciones, arrays, objetos y arrow functions (`=>`).
  Si `lista.filter(x => x > 2)` te suena a chino, repasá eso primero: Vue es JavaScript.
- Necesitás conexión a internet (Vue se baja de un CDN y el ejercicio 09 pide datos a una API).

## Cómo arrancar

En una terminal, parado en esta carpeta:

```bash
python3 -m http.server 8000
```

Y abrí <http://localhost:8000/ejercicios/> en el navegador.

> También podés abrir los `.html` con doble click, pero con el servidor todo se comporta como una página real (sobre todo el 08 y el 09).

## Cómo hacer cada ejercicio

1. Abrí `ejercicios/NN-....html` en tu editor y, al mismo tiempo, en el navegador.
2. Leé el comentario largo de arriba: explica el tema con ejemplos y tiene la lista de **TODO** (tu tarea).
3. Resolvé los TODO **de a uno**: guardás, recargás (F5), comprobás que anda y pasás al siguiente.
4. Tené siempre abierta la consola del navegador (**F12 → Consola**). Cuando algo no anda, Vue casi siempre te dice por qué ahí (los avisos amarillos `[Vue warn]`).
5. Si te trabás más de 15 minutos, mirá la solución en `soluciones/`. Después cerrala y hacelo de nuevo sin mirar.

Los **DESAFÍOS EXTRA** son opcionales, pero son donde más se aprende.

## Los ejercicios

| #  | Archivo                       | De qué se trata               | Lo nuevo                                  |
|----|-------------------------------|-------------------------------|-------------------------------------------|
| 01 | `01-hola-vue.html`            | Hola Vue                      | `createApp`, `ref()`, `{{ }}`             |
| 02 | `02-contador.html`            | Contador                      | `@click`, funciones, la regla del `.value` |
| 03 | `03-formulario.html`          | Perfil con vista previa       | `v-model`                                 |
| 04 | `04-condicionales.html`       | Mostrar y ocultar cosas       | `v-if`, `v-else`, `v-show`                |
| 05 | `05-listas.html`              | Lista del súper               | `v-for`, `:key`, `@keyup.enter`           |
| 06 | `06-clases-y-atributos.html`  | Modo oscuro, barra de progreso | `:class`, `:style`, `:disabled`          |
| 07 | `07-computed.html`            | Carrito de compras            | `computed()`                              |
| 08 | `08-watch.html`               | Bloc de notas que no se borra | `watch()`, `localStorage`                 |
| 09 | `09-fetch.html`               | Datos de internet             | `onMounted()`, `fetch`, estados de carga  |
| 10 | `10-componentes-props.html`   | Tarjetas del equipo           | componentes, `props`                      |
| 11 | `11-eventos-emit.html`        | Votación de helados           | `emit`: el hijo le avisa al padre         |
| 12 | `12-proyecto-final.html`      | **App de tareas**             | todo junto, sin código de ayuda           |

## Machete

| Quiero...                          | Escribo                                                |
| ---------------------------------- | ------------------------------------------------------ |
| Crear un dato reactivo             | `const x = ref(0)`                                     |
| Leerlo o cambiarlo en el JS        | `x.value` / `x.value = 5`                              |
| Mostrarlo en el HTML               | `{{ x }}` (sin `.value`)                               |
| Reaccionar a un click              | `@click="miFuncion"`                                   |
| Conectar un input con un dato      | `v-model="x"`                                          |
| Mostrar algo solo si...            | `v-if="condicion"` / `v-else`                          |
| Repetir algo por cada ítem         | `v-for="item in lista" :key="item.id"`                 |
| Poner un dato en un atributo       | `:src="url"`, `:disabled="condicion"`                  |
| Clase CSS condicional              | `:class="{ activo: condicion }"`                       |
| Valor calculado a partir de otros  | `const total = computed(() => ...)`                    |
| Hacer algo cuando cambia un dato   | `watch(x, (nuevo, viejo) => { ... })`                  |
| Hacer algo cuando carga la página  | `onMounted(() => { ... })`                             |
| Pasarle datos a un componente hijo | `<hijo :dato="x"></hijo>` + `props: { dato: String }`  |
| Que el hijo le avise algo al padre | `emit('evento', datos)` + `<hijo @evento="hacerAlgo">` |

## ¿Y después?

Cuando termines el proyecto final, el paso siguiente es armar un proyecto "de verdad" con **Vite** y archivos `.vue`
(componentes de un solo archivo con `<script setup>`). Es exactamente lo que aprendiste acá, pero más ordenado.

### Crear proyectos con Docker (sin instalar npm)

Esta carpeta trae un `Dockerfile` con Node adentro y un atajo, `vue.sh`, para usarlo.
Los proyectos se guardan en `proyectos/` y los editás con tu editor de siempre.

Crear un proyecto (te va a hacer unas preguntas; para empezar, contestá que no a todo):

```bash
./vue.sh crear mi-app
```

Levantarlo (la primera vez instala las dependencias, tarda un poco):

```bash
./vue.sh dev mi-app
```

Y abrí <http://localhost:5173>. Cada vez que guardás un archivo en `proyectos/mi-app/src/`, el navegador se actualiza solo.
Para frenarlo: `Ctrl+C`.

Otros atajos:

| Comando                                   | Qué hace                                         |
|-------------------------------------------|--------------------------------------------------|
| `./vue.sh npm mi-app install vue-router`  | corre cualquier comando `npm` adentro del proyecto |
| `./vue.sh npm mi-app run build`           | genera la versión final en `proyectos/mi-app/dist/` |
| `./vue.sh shell`                          | abre una terminal adentro del contenedor          |

> La primera vez Docker construye la imagen (baja Node, un par de minutos). Si cambiás el `Dockerfile`, reconstruila con `docker compose build`.

En un proyecto nuevo, lo primero para mirar es `src/App.vue`: vas a reconocer el template, los `ref` y todo lo demás.

### Después

**Vue Router** (varias páginas) y **Pinia** (datos compartidos entre componentes). Se agregan al crear el proyecto (contestando que sí en las preguntas) o después con `./vue.sh npm mi-app install ...`.

- Tutorial oficial interactivo: <https://vuejs.org/tutorial/>
- Guía oficial: <https://vuejs.org/guide/introduction.html>
- Extensión de navegador **Vue DevTools**: te deja ver los datos de tu app en vivo (funciona con estos ejercicios).
- Extensión de VS Code **Vue - Official**: para cuando uses archivos `.vue`.
