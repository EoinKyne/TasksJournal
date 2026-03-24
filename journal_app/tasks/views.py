from django.shortcuts import render
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