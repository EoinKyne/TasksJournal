from django.shortcuts import render
from django.http.response import JsonResponse
from django.db import connections
from django.db.utils import OperationalError
from rest_framework import viewsets
from rest_framework.permissions import AllowAny

from tasks.models import JournalEntry
from tasks.serializers import JournalEntrySerializer


class JournalEntryViewSet(viewsets.ModelViewSet):
    queryset = JournalEntry.objects.all().order_by('-created_at')
    serializer_class = JournalEntrySerializer
    permission_classes = [AllowAny]


def home(request):
    return render(request, 'tasks/index.html')


def health(request):
    return JsonResponse({"status": "ok"})


def ready(request):
    try:
        connections['default'].cursor()
    except OperationalError:
        return JsonResponse({"status": "not ready"}, status=503)
    return JsonResponse({"status": "ready"})
