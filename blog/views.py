from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from .forms import PostForm, UserForm, UserEditForm
from django.shortcuts import redirect
from django.shortcuts import render
from .models import *
#from django.utils import simplejson
import json
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required

import time
from reportlab.lib.enums import TA_JUSTIFY, TA_CENTER
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch

from reportlab.pdfgen import canvas
from reportlab.lib import colors
import os
from textwrap import wrap

from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt

import xlwt

from django.contrib.auth.models import User
from django.core import serializers

def clean(val):
    if val == None:
        return ""
    else:
        return val

@login_required
def post_list(request):
    return render(request, 'blog/post_list.html', {})

@login_required
def post_remove(request, pk):
    post = get_object_or_404(FormAll, pk=pk)
    post.delete()
    return render(request, 'blog/post_list.html', {})

@login_required
def post_detail(request, pk):
    post = get_object_or_404(Form, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})

@login_required
@csrf_exempt
def ajaxPagination(request):
    order_cols = ['pk', 'date_ordered', 'address', 'ordered_from', 'ordered_by', 'date_deliveredby', 'file_no',
                    'project_no', 'date_pd', 'date_due', 'surveyor', 'field_crew', 'cancelled', 'aka', 'fee']

    start = int(request.POST.get("start"))
    length = int(request.POST.get("length"))
    draw = int(request.POST.get("draw"))
    search_key = request.POST.get('search[value]')

    order_col = request.POST.get('order[0][column]')
    order_type = request.POST.get('order[0][dir]')

    if order_col == 7 and order_type == "asc":
        order_key = "project_no"
    else:
        order_key = order_cols[int(order_col)] if order_type == "asc" else "-" + order_cols[int(order_col)]
        
    condition = None

    col_search_key = request.POST.get('columns[0][search][value]')
    if col_search_key != "":
        condition = condition & Q(pk__icontains=col_search_key) if condition != None else Q(pk__icontains=col_search_key)
    col_search_key = request.POST.get('columns[1][search][value]')
    if col_search_key != "":
        condition = condition & Q(date_ordered__icontains=col_search_key) if condition != None else Q(project_no__icontains=col_search_key)
    col_search_key = request.POST.get('columns[2][search][value]')
    if col_search_key != "":
        condition = condition & Q(address__icontains=col_search_key) if condition != None else Q(survey_type__icontains=col_search_key)
    col_search_key = request.POST.get('columns[3][search][value]')
    if col_search_key != "":
        condition = condition & Q(ordered_from__icontains=col_search_key) if condition != None else Q(ordered_from__icontains=col_search_key)
    col_search_key = request.POST.get('columns[4][search][value]')
    if col_search_key != "":
        condition = condition & Q(ordered_by__icontains=col_search_key) if condition != None else Q(ordered_by__icontains=col_search_key)
    col_search_key = request.POST.get('columns[5][search][value]')
    if col_search_key != "":
        condition = condition & Q(date_deliveredby__icontains=col_search_key) if condition != None else Q(date_deliveredby__icontains=col_search_key)
    col_search_key = request.POST.get('columns[6][search][value]')
    if col_search_key != "":
        condition = condition & Q(file_no__icontains=col_search_key) if condition != None else Q(file_no__icontains=col_search_key)
    col_search_key = request.POST.get('columns[7][search][value]')
    if col_search_key != "":
        condition = condition & Q(project_no__icontains=col_search_key) if condition != None else Q(project_no__icontains=col_search_key)
    col_search_key = request.POST.get('columns[8][search][value]')
    if col_search_key != "":
        condition = condition & Q(date_pd__icontains=col_search_key) if condition != None else Q(date_pd__icontains=col_search_key)
    col_search_key = request.POST.get('columns[9][search][value]')
    if col_search_key != "":
        condition = condition & Q(date_due__icontains=col_search_key) if condition != None else Q(date_pd__icontains=col_search_key)
    col_search_key = request.POST.get('columns[10][search][value]')
    if col_search_key != "":
        condition = condition & Q(surveyor__icontains=col_search_key) if condition != None else Q(surveyor__icontains=col_search_key)
    col_search_key = request.POST.get('columns[11][search][value]')
    if col_search_key != "":
        condition = condition & Q(field_crew__icontains=col_search_key) if condition != None else Q(field_crew__icontains=col_search_key)
    col_search_key = request.POST.get('columns[12][search][value]')
    if col_search_key != "":
        condition = condition & Q(cancelled__icontains=col_search_key) if condition != None else Q(cancelled__icontains=col_search_key)
    col_search_key = request.POST.get('columns[13][search][value]')
    if col_search_key != "":
        condition = condition & Q(aka__icontains=col_search_key) if condition != None else Q(aka__icontains=col_search_key)
    col_search_key = request.POST.get('columns[14][search][value]')
    if col_search_key != "":
        try:
            val = float(col_search_key)
            condition = condition & Q(fee=val) if condition != None else Q(fee=val)
        except:
            pass

    if condition == None and (search_key == None or search_key == ""):
        count = FormAll.objects.all().count()
        posts = FormAll.objects.all().order_by(order_key)[start:start+length]
    else:

        if search_key != None and search_key != "":
            condition_global = (Q(pk__icontains=search_key) | Q(date_ordered__icontains=search_key) | \
                Q(address__icontains=search_key) | Q(ordered_from__icontains=search_key) | \
                Q(ordered_by__icontains=search_key) | Q(date_deliveredby__icontains=search_key) | \
                Q(file_no__icontains=search_key) | Q(project_no__icontains=search_key) | \
                Q(date_pd__icontains=search_key) | Q(date_due__icontains=search_key) | \
                Q(surveyor__icontains=search_key) | Q(field_crew__icontains=search_key) | \
                Q(cancelled__icontains=search_key) | Q(aka__icontains=search_key))

            try:
                val = float(search_key)
                condition_global = condition_global | Q(fee=val)
            except:
                pass

            condition = condition & condition_global if condition != None else condition_global

        count = FormAll.objects.filter(condition).count()
        posts = FormAll.objects.filter(condition).order_by(order_key)[start:start+length]

    data = []
    for post in posts:
        if request.user.edit_auth:
            action_buttons = '<a class="btn btn-default" href="/post/'+str(post.pk)+'/edit/"> \
                        <span><i class="fa fa-pencil" style="font-size:24px"></i></span> \
                </a>' + \
                '<a class="btn btn-default" href="/post/'+str(post.pk)+'/remove/"> \
                        <span><i class="fa fa-remove" style="font-size:24px"></i></span> \
                </a>'
        else:
            action_buttons = ''

        # order_cols = ['pk', 'date_ordered', 'address', 'ordered_from', 'ordered_by', 'date_deliveredby', 'file_no',
        #             'project_no', 'date_pd', 'date_due', 'surveyor', 'field_crew', 'cancelled', 'aka']

        data.append([post.pk, str(clean(post.date_ordered)), clean(post.address), \
            clean(post.ordered_from), clean(post.ordered_by), str(clean(post.date_deliveredby)), clean(post.file_no), \
            clean(post.project_no), str(clean(post.date_pd)), str(clean(post.date_due)), \
            clean(post.surveyor), clean(post.field_crew), clean(post.cancelled), clean(post.aka), str(clean(post.fee)), \
            action_buttons])
    posts = {
            "draw": draw,
            "recordsTotal": count,
            "recordsFiltered": count,
            "data": data
        }
    return HttpResponse(json.dumps(posts), content_type='application/json')

@login_required
def ajaxClientData(request):
    clients = []
    temp = FormAll.objects.all().distinct('ordered_by')
    clients = [tp.ordered_by for tp in temp if tp.ordered_by != None]
    return HttpResponse(json.dumps(clients), content_type='application/json')

@login_required
def post_new(request):
    if request.user.edit_auth == False:
        get_object_or_404(FormAll, pk=None)
        
    posts = FormAll.objects.all()
    errors = ""
    if request.method == "POST":
        count = FormAll.objects.filter(project_no=request.POST.get('project_no')).count()
        if count == 0:
            form = PostForm(request.POST)
            if form.is_valid() and count == 0:
                post = form.save(commit=False)
                # post.date_entered = timezone.now()
                post.date_ordered = None if request.POST.get('date_ordered') == "" else request.POST.get('date_ordered')
                post.address = request.POST.get('address')
                post.ordered_from = request.POST.get('ordered_from')
                post.ordered_by = request.POST.get('ordered_by')
                post.date_deliveredby = None if request.POST.get('date_deliveredby') == "" else request.POST.get('date_deliveredby')
                post.file_no = request.POST.get('file_no')
                post.project_no = request.POST.get('project_no')
                post.date_pd = None if request.POST.get('date_pd') == "" else request.POST.get('date_pd')
                post.date_due = request.POST.get('date_due')
                post.surveyor = request.POST.get('surveyor')
                post.field_crew = request.POST.get('field_crew')

                cancelled = request.POST.get('cancelled')
                cancelled = "Yes" if cancelled != None and cancelled == 'on' else "No"
                post.cancelled = cancelled
                post.aka = request.POST.get('aka')
                post.fee = request.POST.get('fee')

                form.save()
                
                return redirect("/post/%d/edit/" % post.pk)
        else:
            errors = "The project number is already exited."

    form = PostForm()
    return render(request, 'blog/post_new.html', {'form': form, 'errors': errors})


@login_required
def post_edit(request, pk):
    if request.user.edit_auth == False:
        get_object_or_404(FormAll, pk=None)

    posts = FormAll.objects.all()
    post = get_object_or_404(FormAll, pk=pk)
    errors = ""

    if request.method == "POST":
        count = FormAll.objects.filter(Q(project_no=request.POST.get('project_no')) & ~Q(pk=request.POST.get('post_id'))).count()

        if count == 0:
            form = PostForm(request.POST, instance=post)
            if form.is_valid() and count == 0:
                post = form.save(commit=False)
                # post.date_entered = timezone.now()
                post.date_ordered = None if request.POST.get('date_ordered') == "" else request.POST.get('date_ordered')
                post.address = request.POST.get('address')
                post.ordered_from = request.POST.get('ordered_from')
                post.ordered_by = request.POST.get('ordered_by')
                post.date_deliveredby = None if request.POST.get('date_deliveredby') == "" else request.POST.get('date_deliveredby')
                post.file_no = request.POST.get('file_no')
                post.project_no = request.POST.get('project_no')
                post.date_pd = None if request.POST.get('date_pd') == "" else request.POST.get('date_pd')
                post.date_due = request.POST.get('date_due')
                post.surveyor = request.POST.get('surveyor')
                post.field_crew = request.POST.get('field_crew')

                cancelled = request.POST.get('cancelled')
                cancelled = "Yes" if cancelled != None and cancelled == 'on' else "No"
                post.cancelled = cancelled
                post.aka = request.POST.get('aka')
                post.fee = request.POST.get('fee')
                form.save()
                return redirect("/post/%d/edit/" % post.pk)
        else:
            errors = "The project number already exists. Please choose another."

    form = PostForm(instance=post)

    return render(request, 'blog/post_edit.html', {'form': form, 'pk': post.pk, "errors": errors, 'post': post})

@login_required
def user_list(request):

    if not request.user.is_superuser:
        return redirect('/')

    # filter(published_date__lte=timezone.now()).order_by('published_date')
    users = Users.objects.all().order_by('pk')
    return render(request, 'registration/user_list.html', {'users': users})

@login_required
def user_new(request):
    if not request.user.is_superuser:
        return redirect('/')

    if request.method == "POST":
        form = UserForm(request.POST)
        if form.is_valid():
            new_user = form.save(commit=False)
            new_user.set_password(
            form.cleaned_data['password'])
            new_user.save()

            return redirect('/user/')
    else:
        form = UserForm()
    return render(request, 'registration/user_new.html', {'user_form': form})

@login_required
def user_edit(request, pk):
    if not request.user.is_superuser:
        return redirect('/')

    users = Users.objects.all()
    user = get_object_or_404(Users, pk=pk)
    if request.method == "POST":
        form = UserEditForm(request.POST, instance=user)
        if form.is_valid():
            user = form.save(commit=False)
            if request.POST.get('new_password') != "":
                user.set_password(request.POST.get('new_password'))
            user.save()
            return redirect('/user/')
    else:
        form = UserEditForm(instance=user)
    return render(request, 'registration/user_edit.html', {'user_form': form})

@login_required
def update_profile(request, pk):
    if not request.user.pk != pk: 
        return redirect('/')
    
    users = Users.objects.all()
    user = get_object_or_404(Users, pk=pk)

    if request.method == "POST":
        form = UserEditForm(request.POST, instance=user)
        if form.is_valid():
            user = form.save(commit=False)
            if request.POST.get('new_password') != "":
                user.set_password(request.POST.get('new_password'))
            user.save()
            return redirect('/user/')
    else:
        form = UserEditForm(instance=user)
    return render(request, 'registration/update_profile.html', {'user_form': form})


@login_required
def user_remove(request, pk):
    if not request.user.is_superuser:
        return redirect('/')

    user = get_object_or_404(Users, pk=pk)
    if user:
        user.delete()

    return redirect('/user/')

def drawText(canvasObj, text, length, x, y, line_space=22):
    if text == "":
        return 1
    wraped_text = wrap(text, length)
    for index in range(0, len(wraped_text)):
        canvasObj.drawString(x, y-(index+1)*line_space, wraped_text[index])

    return len(wraped_text)

def clean(data):
    return "" if data == None else data
def cleanDate(data):
    try:
        return data.strftime('%m/%d/%Y')
    except:
        return ""


@login_required
def export_users_xls(request):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="blackbook-gdi.xls"'

    columns = ['pk', 'date_ordered', 'address', 'ordered_from', 'ordered_by', 'date_deliveredby', 'file_no', 'project_no', 'date_pd', 'date_due', 'surveyor', 'field_crew', 'cancelled', 'aka', 'fee']

    rows = FormAll.objects.all().order_by('project_no')

    wb = xlwt.Workbook(encoding='utf-8')
    font_style = xlwt.XFStyle()
    font_style.font.bold = True

    # Sheet header, first row
    row_num = 0

    ws = wb.add_sheet('blackbook-gdi', cell_overwrite_ok=True)

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    # Sheet body, remaining rows
    serialized_rows = serializers.serialize('json', rows)
    serialized_rows = json.loads(serialized_rows)
    font_style = xlwt.XFStyle()

    for row in serialized_rows:
        obj = row["fields"]

        row_num += 1
        col_num = 0
        ws.write(row_num, col_num, row['pk'], font_style)

        for col_key in columns[1:]:
            col_num += 1
            ws.write(row_num, col_num, obj[col_key], font_style)

    wb.save(response)
    return response


class AuthenticationEmailBackend(object):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = Users.objects.get(email=username)
        except Users.DoesNotExist:
            return None
        else:
            if getattr(user, 'is_active', False) and user.check_password(password):
                return user
        return None

    def get_user(self, user_id):
        try:
            return Users.objects.get(pk=user_id)
        except Users.DoesNotExist:
            return None