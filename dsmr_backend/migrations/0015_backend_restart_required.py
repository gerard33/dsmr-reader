# Generated by Django 3.0.8 on 2020-07-16 17:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dsmr_backend', '0014_verbose_field_translations'),
    ]

    operations = [
        migrations.AddField(
            model_name='backendsettings',
            name='restart_required',
            field=models.BooleanField(default=False, help_text='Whether the process requires a restart.', verbose_name='Restart required'),
        ),
    ]
