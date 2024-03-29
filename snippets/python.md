# Python

## Oracle DB Connection

Oracle makes distinction between service name (abstraction) and SID (specific server), with some preferences for one vs the other.
Constructing through the DSN style always works.

```python
import cx_Oracle

def build_oracle_connection(username: str, password: str, hostname: str, port: int, database: str) -> cx_Oracle.Connection:
    """
    Return Oracle Database connection from the provided components.
    Some run-around because Oracle makes a distinction between SID and service name. Constructing a dsn_string always works.
    """
    dsn_string = cx_Oracle.makedsn(hostname, port, database)
    connection = cx_Oracle.connect(username, password, dsn_string)
    return connection
```

## Local Datetime Timezone

Generate local timezone aware datetime and extract the timezone.

```python
import datetime

local_dt = datetime.datetime.now(tz=datetime.timezone.utc).astimezone()
local_timezone = local_dt.tzinfo
```


## Django form

```html
<form action="{% url 'formurlname' %}" method="post">
    {% csrf_token %}
    {{ form }}
    <input type="submit" value="Submit">
</form>
```

```python
from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import MyForm

def view_form(request):
    if request.method == 'POST':
        form = MyForm(request.POST)
        if form.is_valid():
            datum = form.cleaned_data["datum"]
            return HttpResponseRedirect('/done/')
    form = myForm()
    context = {"form":form}

    return render(request, 'form.html', context)
```

## Django Oracle Legacy DB Schema

If needing to specify the schema, table connection has specific formatting requirements:

```python
class Foo(models.Model):
	foo_pk = models.IntegerField(primary_key=True, null=False, db_column="ridiculous_legacy_name)
	
	class Meta:
		managed = False
		# note the formatting
		db_table = '"SCHEMA"."TABLE"'
```

## Matplotlib Font Size

https://stackoverflow.com/questions/3899980/how-to-change-the-font-size-on-a-matplotlib-plot

```python
import matplotlib.pyplot as plt

SMALL_SIZE = 16
MEDIUM_SIZE = 18
BIGGER_SIZE = 24

plt.rc('font', size=SMALL_SIZE)          # default text sizes
plt.rc('axes', titlesize=SMALL_SIZE)     # axes title
plt.rc('xtick', labelsize=SMALL_SIZE)    # tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)    # tick labels
plt.rc('legend', fontsize=SMALL_SIZE)    # legend
plt.rc('axes', labelsize=MEDIUM_SIZE)    # x and y labels
plt.rc('figure', titlesize=BIGGER_SIZE)  # figure title
```

## Matplotlib Histogram

Histogram with the text in the center of the bar without oddball bin sizes.

```
import matplotlib.pyplot as plt
import numpy as np

x = np.array([0, 2, 1, 1, 1, 0, 2, 2, 1, 2])

items, frequency = np.unique(x, return_counts=True)
plt.bar(items, frequency, align="center")
```


## Matplotlib integer axis ticks

Long way
```python
from matplotlib.ticker import MaxNLocator

ax = plt.figure().gca()
ax.yaxis.set_major_locator(MaxNLocator(integer=True))
```

One-liner
```python
ax.yaxis.get_major_locator().set_params(integer=True)
```

## General logging

```python
import logging

logger = logging.getLogger(__name__)

handler = logging.StreamHandler()
formatter = logging.Formatter("%(asctime)s %(name)-12s %(levelname)-7s %(message)s")
handler.setFormatter(formatter)
logger.addHandler(handler)
logger.setLevel(logging.INFO)
```

## Anaconda

### Disable launching into the base conda environment

https://stackoverflow.com/a/54560785

`conda config --set auto_activate_base false`

### Specify Python Version

Python is a package not an argument.

`conda create --name=foo python=3.9`
