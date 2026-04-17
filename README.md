# varosa-ov-pendientes-widget

Widget HTML para el seguimiento de líneas de Sales Orders con facturación parcial (`partially_invoiced`) en VAROSA.

## Stack

- Single-file `index.html` (HTML + CSS + JS embebidos, sin frameworks)
- Conecta a 2 webhooks de n8n:
  - **GET** `/webhook/ov-pendientes-listar` → lista pendientes desde Zoho Creator
  - **PATCH** `/webhook/ov-pendientes-actualizar` → guarda Comentario, ETA, Estado

## Características

- **Vista híbrida**: agrupada por producto (colapsable) + expandible por OV
- **KPIs en tiempo real**: total líneas, monto pendiente, en proceso, productos únicos
- **Filtros**: búsqueda libre + Ruta + Vendedor + Estado
- **Edición inline**: Comentario (textarea), ETA (date picker), Estado (dropdown)
- **Botón Guardar por fila**: el cambio no se envía hasta confirmación explícita
- **Auto-ocultado de Resueltos**: cuando se marca "Resuelto" desaparece de la lista
- **Toasts** de éxito/error
- **Modo debug**: con `CONFIG.DEBUG = true` se loguea la respuesta cruda del webhook en consola del navegador

## Branding

- Colores VAROSA: #15C9E4 (cyan), #4672B1 (azul medio), #FFAD00 (dorado), #325895 (azul oscuro)
- Fuentes: Inter (display) + Montserrat (body) — Bw Mitga no está disponible vía Google Fonts, se usa Inter como sustituto cercano

## Deploy

Este widget se despliega en Easypanel como servicio estático (similar a `varosa-oc-widget`).

URL esperada: `https://varosa-ov-pendientes-widget.1efluw.easypanel.host/`

## Integración con Zoho Creator

Se registra como widget tipo Page en Portal OPERACIONES (app `varosa`):

```
<iframe src="https://varosa-ov-pendientes-widget.1efluw.easypanel.host/?usuario=<%= zoho.loginuser %>"
        style="width:100%; height:90vh; border:0;"></iframe>
```

## Backend relacionado

- Workflow Sync: `varosa_sync_ov_pendientes` (n8n) — corre cada 2h L-V 8AM-4PM
- Workflow Webhooks: `varosa_ov_pendientes_webhooks` (n8n)
- Form Creator: `Seguimiento_OV_Pendientes` (Portal OPERACIONES)
- Vista Analytics: ID `3025462000002024003`

## Roadmap

- [ ] Trazabilidad de editor (Ultimo_Editor + Fecha_Edicion)
- [ ] CORS restringido a dominio Creator (actualmente abierto `*`)
- [ ] Vista alternativa "tabla plana" sin agrupar
