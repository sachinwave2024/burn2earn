import os
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
def RELATIVE_PATH(*args):
    return os.path.join(BASE_DIR, *args)




DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'Kiueayfafyawhfayrfhafahfea',
        'USER': 'Lqwuuafjaifapoeruugaads',
        'PASSWORD': 'diaekfaierka4eajgjuawajfz',
        'HOST': '54.254.176.176',
        'PORT': '3306',
        'OPTIONS': {
                'charset': 'utf8mb4',
        },
    },

    'second_db': {
         'ENGINE': 'django.db.backends.mysql',
         'NAME': 'Wdiadkfaufdkaefadvd',
         'USER': 'Swuejdafuajfdawefaef',
         'PASSWORD': 'Azefuafawefawefage',
         'HOST': '3.0.28.172',
         'PORT': '3306',
         'OPTIONS': {
                'charset': 'utf8mb4',
          },
     }
}
