import 'package:flutter/material.dart';
import '../models/dog.dart';

class DogCard extends StatelessWidget {
  final Dog dog;
  final VoidCallback onDelete; // Callback for delete functionality
  final VoidCallback onEdit;   // Callback for edit functionality

  const DogCard({
    Key? key,
    required this.dog,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dog details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Breed: ${dog.breed}"),
                  Text("Age: ${dog.age}"),
                  Text("Favorite Activity: ${dog.activity}"),
                  Text("Weight: ${dog.weight}"),
                ],
              ),
            ),
            // Edit button
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit, // Trigger the edit callback
              tooltip: 'Edit',
            ),
            // Delete button
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete, // Trigger the delete callback
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
