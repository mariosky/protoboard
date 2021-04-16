from django import forms

class CourseForm(forms.Form):
    LEVEL_CHOICES = [
        ('principiante','Principiante'),
        ('intermedio', 'Intermedio'),
        ('avanzado', 'Avanzado'),
    ]
    DATE_FORMATS = ['%d-%m-%Y',
                    '%d/%m/%Y',
                    '%d/%m/%y']
    TAGS = [
        ('#tutorial', 'tutorial'),
        ('#curso', 'curso'),
        ('#frontpage', 'front page'),
        ('#reto', 'reto'),
        ('#csharp','csharp'),
        ('#python', 'python'),
        ('#jave', 'java'),
    ]

    STATUS = [
        ('in_revision', 'En revisión'),
        ('published', 'Publicado'),
        ('not_listed', 'No listado'),
        ('in_production', 'En producción'),
        ('comming_soon', 'Próximamente'),
        ('in_promotion', 'En Promoción'),
    ]

    title = forms.CharField(label="Titulo")
    uri = forms.SlugField(label="Identificador", max_length=100, required=True,help_text="Escribe un identificador para el curso tipo slug (por-ejemplo-el-titulo) esté será utilizado para el URL y debe ser único" )
    description = forms.CharField(label="Descripción",  widget=forms.Textarea)
    author = forms.CharField(label="Nombre del autor", required=False, help_text="En caso de ser externo, de lo contrario se asume que es el usuario actual.")
    author_image = forms.URLField(label="URL de la imágen del autor", required=False, help_text="URL de la imágen del autor.")
    rights = forms.CharField(label="Licencia", required=False)
    is_private = forms.BooleanField(label="¿Es privado?", required=False, initial=False)
    rights_url = forms.URLField(label="URL de la licencia" , required=False)
    level =  forms.ChoiceField(label='Nivel de dificultad', choices=LEVEL_CHOICES)
    external_url = forms.URLField( label = "URL del responable", required=False, help_text="URL del responsable de la publicación (ej. Universidad, Publisher, Página).")
    current_price = forms.IntegerField(label = "Precio actual", help_text="Sin centavos", initial=0)
    image_url = forms.URLField( label = "URL de la imágen promocional", required=False, help_text="URL del responsable")
    video_url = forms.URLField(label="URL del video promocional",required=False, help_text="URL del responsable")
    duration = forms.DurationField(label="Duración aproximada", required=False, help_text="HH:MM")
    html_description = forms.CharField(label="HTML Descriptivo", required=False, widget=forms.Textarea)
    tags = forms.MultipleChoiceField(label="Tags", choices= TAGS, help_text="Elige los tags apropiados, presiona Ctrl en Linux o Windows, en en macOS presiona ⌘ Command")
    status = forms.ChoiceField(label='Status', choices=STATUS, help_text="Estatus actual del recurso")
    start_date = forms.DateField(label="Fecha en la que estará disponible",required=False, help_text="d-m-Y")
