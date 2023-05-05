# Generated by Django 4.2 on 2023-05-05 23:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_alter_account_account_number'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='display_image',
            field=models.URLField(blank=True),
        ),
        migrations.AddField(
            model_name='account',
            name='display_name',
            field=models.CharField(blank=True, max_length=50),
        ),
    ]