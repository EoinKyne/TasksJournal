from django.urls import reverse
from rest_framework.test import APITestCase

from tasks.models import JournalEntry


class JournalEntryAPITest(APITestCase):

    def test_create_entry(self):
        url = reverse('journalentry-list')
        data = {
            "title": 'Test Case entry',
            "description": 'Test Case description'
        }

        response = self.client.post(url, data, format='json')

        self.assertEqual(response.status_code, 201)
        self.assertEqual(JournalEntry.objects.first().title,
                         'Test Case entry')

    def test_get_entries(self):
        JournalEntry.objects.create(
            title='Test', description='Description')
        url = reverse('journalentry-list')
        response = self.client.get(url)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(response.data), 1)

    def test_get_entry_by_id(self):
        entry = JournalEntry.objects.create(
            title='Test', description='Description')

        response = self.client.get(
            reverse('journalentry-detail', args=[entry.id]))
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data["id"], entry.id)

    def test_update_entry(self):
        entry = JournalEntry.objects.create(
            title='Test', description='Description')

        url = reverse('journalentry-detail', args=[entry.id])

        data = {
            "title": 'Update test title',
            "description": 'Update test description',
        }

        response = self.client.patch(url, data, format='json')
        entry.refresh_from_db()
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data["title"], "Update test title")
        self.assertEqual(entry.title, "Update test title")

    def test_delete_entry(self):
        entry = JournalEntry.objects.create(
            title='Test', description='Description')

        response = self.client.delete(
            reverse('journalentry-detail', args=[entry.id]))

        self.assertEqual(response.status_code, 204)
        self.assertEqual(JournalEntry.objects.count(), 0)

    def test_journal_entry_not_found(self):
        url = reverse('journalentry-detail', args=[99999])

        response = self.client.get(url)

        self.assertEqual(response.status_code, 404)
