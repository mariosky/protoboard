# -*- coding: utf-8 -*-

##
##
##  Example of a Learning Activity Tree
##
##


if __name__ == "__main__":
    import os
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "protoboard.settings")
    import django
    from django.conf import settings
    django.setup()


from activitytree.models import LearningStyleInventory, LearningActivity, Course, UserLearningActivity



#LearningActivity.objects.all().delete()


PPP = LearningActivity( name = 'Python Básico', slug = 'PB',
    uri = "/activity/PB",
    heading="Python Básico",
    secondary_text = "Tutorial",
    description = "Tutorial del lenguaje Python, orientado a principiantes.",
    image = "https://s3.amazonaws.com/learning-python/python-logo.png",

    parent = None,
    root   = None,

    flow = True,
    forward_only = False,
    choice = True,
    choice_exit = False,

    rollup_rule  = "satisfied IF All satisfied",
    rollup_objective = True,
    rollup_progress = True,

    is_container = True,
    is_visible = True,
    order_in_container = 0
    )

PPP.save()
description= u"""
          <p> Curso de Python básico, ¡Aprende desde cero!</p>
            <p><code>print "hola mundo"</code></p>
          <p>  Python es utilizado por la  Nasa, Google, Instagram y por su puesto protoboard.org</p>
"""


cursoPPP = Course(short_description=description, root=PPP)
cursoPPP.save()



intro = LearningActivity( name = 'Introduccion', slug = 'Intro',
    uri = "/activity/introduccion",
#   lom =
    parent = PPP, root  = PPP,
    heading="Introducción al lenguaje",
    description = "Vemos las principales características del lenguaje y hacemos los primeros ejercicios.",
    image = "https://s3.amazonaws.com/learning-python/python-logo.png",
    secondary_text = "Lección 1",
#   pre_condition_rule = """self.recommendation_value = Text_Verbal.eval(self.user.learningstyleinventory.verbal,self.user.learningstyleinventory.visual)"""  ,
    pre_condition_rule = ""  ,
    post_condition_rule = "",

    flow = True,
    forward_only = False,
    choice = True,
    choice_exit = False,


    rollup_rule  = "satisfied IF All satisfied",
    rollup_objective = True,
    rollup_progress = True,

    is_container = True,
    is_visible = True,
    order_in_container = 1
    )
intro.save()

pretest = LearningActivity(
    name = 'Experiencia Programando', slug = 'Pretest',
    uri = '/test/poo',
    parent = intro, root  = PPP,
    secondary_text = "Unidad 1",
    heading="¿Que tanto sabes POO?",
    description = "Antes de empezar, dinos algo sobre tu experiencia en programación orientada a objetos.",
    image = "https://s3.amazonaws.com/learning-python/survey.jpg",

    choice_exit = False,

    pre_condition_rule = """
if int(activity['num_attempts']) == 0 :
    activity['pre_condition'] = ''
elif activity['objective_status'] == 'satisfied':
    activity['pre_condition'] = 'hidden'
""",

    post_condition_rule = "",

    rollup_objective = False,
    rollup_progress = False,
    attempt_limit=3,

    is_container = False,
    is_visible = True,
    order_in_container = 0
    )
pretest.save()

secuencias = LearningActivity( name = 'Secuencias', slug = 'Intro',
    uri = "/activity/introduccion",
#   lom =
    image = "https://s3.amazonaws.com/learning-python/sequence.jpg",
    heading="Objetos Tipo Secuencia",
    description = "Aprenderás a utilizar las Listas, Tuplas y Cadenas",
    secondary_text = "Lección",

    parent = PPP, root  = PPP,

#    pre_condition_rule = """self.recommendation_value = Text_Verbal.eval(self.user.learningstyleinventory.verbal,self.user.learningstyleinventory.visual)"""  ,
    pre_condition_rule = """
if get_attr('/activity/introduccion','objective_status') == 'satisfied':
    activity['pre_condition'] = ''
else:
    activity['pre_condition'] = ''
""",
    post_condition_rule = "",

    flow = True,
    forward_only = False,
    choice = True,
    choice_exit = False,


    rollup_rule  = "satisfied IF All satisfied",
    rollup_objective = True,
    rollup_progress = True,

    is_container = True,
    is_visible = False,
    order_in_container = 2
    )
secuencias.save()


tema_1 = LearningActivity( name = 'Video de Introduccion', slug = 'Intro',
    uri = '/activity/video/intro',

    heading="Introducción al Lenguaje Python",
    description = "Aprenderás cuales son las caracteristicas del lenguaje.",
    image = "https://s3.amazonaws.com/learning-python/IntroVideo.png",

    parent = intro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 0
    )
tema_1.save()

tema_2 = LearningActivity( name = 'Ejercicios Basados en Pruebas', slug = 'Ejercicios',
    uri = '/activity/video/ejercicios_basados_en_pruebas',

    heading="Ejercicios Basados en Pruebas",
    description = "Explicamos la técnica básica de pruebas unitarias y su uso para especificar ejercicios de programación",
    image = "https://s3.amazonaws.com/learning-python/pruebas.png",


    parent = intro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = False,
    order_in_container = 1
    )
tema_2.save()

tema_3 = LearningActivity( name = 'Como hacer los ejercicios', slug = 'Ejemplo',
    uri = '/activity/video/ejemplo_ejercicio',

    heading="Haciendo un Ejercicio",
    description = "Aprendemos la manera de programar los ejercicios en Protoboard",
    image = "https://s3.amazonaws.com/learning-python/ejercicioVideo.png",


    parent = intro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 2
    )
tema_3.save()


EjerciciosIntro = LearningActivity( name = 'Ejercicios', slug = 'Ejercicios',
    uri = "/activity/EjerciciosIntro",
    parent = intro,
    root   = PPP,

    heading="Ejercicios Básicos",
    description = "Algunos ejercicios para calentar morores",
    secondary_text = "Ejercicios",
    image = "https://s3.amazonaws.com/learning-python/cafe.png",



    flow = True,
    forward_only = False,
    choice = True,
    choice_exit = False,

    rollup_rule  = "satisfied IF All satisfied",
    rollup_objective = True,
    rollup_progress = True,

    is_container = True,
    is_visible = True,
    order_in_container = 3
    )
EjerciciosIntro.save()

program_1 = LearningActivity( name = 'Imprime Hola', slug = 'E1',
    uri = "/program/PPP/1",

    heading="Imprime Hola",
    description = "La versión básica del clásico Hola Mundo",
    image = "https://s3.amazonaws.com/learning-python/images.png",
 


    parent = EjerciciosIntro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    choice_exit = False,
    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 3
    )
program_1.save()


program_2 = LearningActivity( name = '¿Es par?', slug = 'E2',
    uri = "/program/PPP/2",
    parent = EjerciciosIntro, root  = PPP,
    pre_condition_rule = """
if get_attr('/program/PPP/1','objective_status') == 'satisfied':
    activity['pre_condition'] = ''
else:
    activity['pre_condition'] = 'disabled'
""",
    description = "Haz una función que te diga si es un número par. Necesario completar: Imprime Hola ",
    post_condition_rule = "",
    choice_exit = False,
    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 5
    )
program_2.save()

program_3 = LearningActivity( name = 'Suma dos números', slug = 'E3',
    uri = "/program/PPP/3",

    heading="Uno + Uno",
    description = "Escribe una función que sume dos números",
    image = "https://s3.amazonaws.com/learning-python/suma.png",
    attempt_limit=3,

    parent = EjerciciosIntro, root  = PPP,
    pre_condition_rule = """""",
    post_condition_rule = "",

    choice_exit = False,

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 7
    )
program_3.save()


program_4 = LearningActivity( name = 'distancia()', slug = 'E4',
    uri = "/program/PPP/4",
    parent = EjerciciosIntro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 9
    )
program_4.save()


program_5 = LearningActivity( name = 'mayor()', slug = 'E5',
    uri = "/program/PPP/5",
    parent = EjerciciosIntro, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 11
    )
program_5.save()

secuencias_1 = LearningActivity( name = 'Video', slug = 'Intro',
    uri = '/activity/video/secuencias',
    parent = secuencias, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,
    order_in_container = 0
    )
secuencias_1.save()

EjerciciosSec = LearningActivity( name = 'Ejercicios', slug = 'Ejercicios',
    uri = "/activity/EjerciciosSec",
    parent = secuencias,
    root   = PPP,

    flow = True,
    forward_only = False,
    choice = True,
    choice_exit = False,

    rollup_rule  = "satisfied IF All satisfied",
    rollup_objective = True,
    rollup_progress = True,

    is_container = True,
    is_visible = True,
    order_in_container = 3
    )
EjerciciosSec.save()


program_6 = LearningActivity( name = 'Dame una lista', slug = 'E6',
    uri = "/program/PPP/6",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 8
    )
program_6.save()


program_7 = LearningActivity( name = 'Dame una tupla', slug = 'E7',
    uri = "/program/PPP/7",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 10
    )
program_7.save()

program_8 = LearningActivity( name = 'Solo una tajada', slug = 'E8',
    uri = "/program/PPP/8",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 12
    )

program_8.save()

program_9 = LearningActivity( name = 'Solo una tajadita', slug = 'E9',
    uri = "/program/PPP/9",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 14
    )
program_9.save()

program_10 = LearningActivity( name = '¡Pura Acción!', slug = 'E10',
    uri = "/program/PPP/10",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 16
    )
program_10.save()

program_11 = LearningActivity( name = 'Mutantes', slug = 'E10',
    uri = "/program/PPP/11",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 18
    )
program_11.save()

program_12 = LearningActivity( name = 'Ordena la Lista', slug = 'E10',
    uri = "/program/PPP/12",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 20
    )
program_12.save()


program_13 = LearningActivity( name ='Producto punto' , slug = 'E10',
    uri = "/program/PPP/13",
    parent = EjerciciosSec, root  = PPP,
    pre_condition_rule = "",
    post_condition_rule = "",

    rollup_objective = True,
    rollup_progress = True,

    is_container = False,
    is_visible = True,    order_in_container = 22
    )
program_13.save()


from django.contrib.auth.models import User
from activitytree.interaction_handler import SimpleSequencing
estudiantes = [
('edgar',          '1234',17,13,16,12,14,16, 9),
('osuna',       '1234',15,12,14,18,14,19, 8),
('malu',         '1234', 7,10, 4, 8,17,14,16),
('jose',        '1234',17, 6,16,13,14,11, 8),
('david',         '1234',15,10,13,14,17,15,11),
('juan',    '1234',11,13,11,10,13,18, 8),
('cota',              '1234',13, 7,18,14,12,10,13),
('omar',            '1234', 7, 3, 7,12,16,17, 6),
('santana',           '1234',10, 9,13,13,13,14,13),
('hector',  '1234', 1,11,11,11,18,13,13),
('edie',           '1234',14, 6,16,12,12,13,12),
('baby',      '1234',15,18,20,17,13,18,17),
('saul',            '1234',13,11,14,11,14,14,13),
('brenda',             '1234',17,13,20,12,14,11,16),
('samara',         '1234',14,15,13,12,15,16,12),
('daniel',      '1234', 9, 8,15,11,13,14,13),
('jorge',           '1234',17,12,14,17,19,18,14),
('mike',             '1234',15,16,17,18,18,13,11),
('luis',            '1234',11, 7,11,10,11,12, 6),
('anguiano.ae22@hotmail.com',       '1234',12,10,12,13,10,18,10)]

for e in estudiantes:
    User.objects.filter(username=e[0]).delete()
    u = User.objects.create_user(e[0],e[0], e[1])
    u.is_active = True
    u.save()
    lsu=LearningStyleInventory(visual=e[2],verbal=e[3],aural=e[4],physical=e[5],logical=e[6],
                          social=e[7], solitary=e[8], user = u)
    lsu.save()
    ss = SimpleSequencing()
    ss.assignActivityTree(u,PPP)

import os

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "protoboard.settings")

