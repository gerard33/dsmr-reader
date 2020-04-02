# Generated by Django 3.0.5 on 2020-04-02 18:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dsmr_datalogger', '0021_schedule_retention_data_rotation'),
    ]

    operations = [
        migrations.AlterField(
            model_name='retentionsettings',
            name='data_retention_in_hours',
            field=models.IntegerField(blank=True, choices=[(None, 'None (keep all readings)'), (168, 'Discard most readings after one week'), (672, 'Discard most readings after one month'), (2016, 'Discard most readings after three months'), (4032, 'Discard most readings after six months'), (8064, 'Discard most readings after one year')], default=None, help_text='The lifetime of readings and other data, before discarding them. Some readings will be preserved forever.', null=True, verbose_name='Data retention'),
        ),
    ]
