
{{- define "fullname" -}}
{{- printf .Release.Name | trunc 63 -}}
{{- end -}}

{{- define "chartref" -}}
  {{- replace "+" "_" .Chart.Version | printf "%s-%s" .Chart.Name -}}
{{- end -}}

{{- /*
labels.standard prints the standard Helm labels.
The standard labels are frequently used in metadata.
*/ -}}
{{- define "labels.standard" }}
app: {{ template "fullname" . }}
chart: {{ template "chartref" . }}
heritage: {{ .Release.Service | quote }}
release: {{ .Release.Name | quote }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}

{{- define "labels.selector" }}
app: {{ template "fullname" . }}
{{- end }}
