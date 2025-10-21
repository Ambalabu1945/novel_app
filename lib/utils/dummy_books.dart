import 'package:novel_app/models/novel_model.dart';

// Ini adalah list data dummy, berisi objek-objek dari class Novel
final List<Novel> dummyNovels = [
  Novel(
    id: 'novel-001',
    title: 'The Shadow Assassin',
    author: 'J. K. Rowling palsu',
    coverImageUrl: 'assets/images/assassin.jpg',
    description: 'Sebuah kisah tentang pembunuh bayaran legendaris...',
    rating: 4.8,
    genres: ['Action', 'Fantasy', 'Adventure'],
  ),
  Novel(
    id: 'novel-002',
    title: 'The Last Healer',
    author: 'George R. R. Martin palsu',
    coverImageUrl: 'assets/images/healer.jpg',
    description: 'Di dunia yang dilanda perang, hanya satu penyembuh tersisa...',
    rating: 4.5,
    genres: ['Fantasy', 'Drama', 'Magic'],
  ),
  Novel(
    id: 'novel-003',
    title: 'Knight of the Void',
    author: 'Brandon Sanderson palsu',
    coverImageUrl: 'assets/images/knight.jpg',
    description: 'Ksatria yang dikutuk untuk menjaga kehampaan...',
    rating: 4.7,
    genres: ['Dark Fantasy', 'Action'],
  ),
  // Tambahkan data untuk 'tank.jpg' dan 'wizard.jpg' juga...
];