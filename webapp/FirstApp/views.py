from django.shortcuts import render
import joblib
import os
import json
import pandas as pd
from .models import airfoil_exp
import psycopg2

# Create your views here.
def index(request):
    return render(request, "index.html")

def result(request):
    model = joblib.load("/webapp/FirstApp/model.joblib")
    list = []
    list.append(float(request.GET['f']))
    list.append(float(request.GET['alpha']))
    list.append(float(request.GET['c']))
    list.append(float(request.GET['U_infinity']))
    list.append(float(request.GET['delta']))

    answer = model.predict([list]).tolist()[0]

    b = airfoil_exp(f = request.GET['f'], 
                   alpha = request.GET['alpha'],
                   c = request.GET['c'],
                   U_infinity = request.GET['U_infinity'],
                   delta = request.GET['delta'], SSPL = answer)
    b.save()
    return render(request, "index.html", {"answer": answer})
