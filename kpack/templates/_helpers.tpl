{{- define "kpack-installer.fullname" -}}
{{- if .Values.nameOverride -}}
{{ .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}
