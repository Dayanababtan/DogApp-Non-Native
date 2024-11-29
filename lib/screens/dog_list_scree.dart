import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../widgets/dog_card.dart';

class DogListScreen extends StatefulWidget {
  const DogListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DogListScreenState createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {
  final List<Dog> dogs = [
    Dog(
      name: 'Buddy',
      breed: 'Golden Retriever',
      age: '5 years',
      activity: 'Running',
      weight: '30 kg',
    ),
    Dog(
      name: 'Max',
      breed: 'German Shepherd',
      age: '3 years',
      activity: 'Playing fetch',
      weight: '35 kg',
    ),
    Dog(
      name: 'Bella',
      breed: 'Labrador Retriever',
      age: '4 years',
      activity: 'Swimming',
      weight: '32 kg',
    ),
    Dog(
      name: 'Lucy',
      breed: 'Beagle',
      age: '2 years',
      activity: 'Digging',
      weight: '20 kg',
    ),
  ];

  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _activityController = TextEditingController();
  final _weightController = TextEditingController();

  // Add a new dog
  void _showAddDogDialog() {
    _clearControllers();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a New Dog'),
          content: _buildDogInputFields(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addNewDog();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addNewDog() {
    setState(() {
      dogs.add(
        Dog(
          name: _nameController.text,
          breed: _breedController.text,
          age: _ageController.text,
          activity: _activityController.text,
          weight: _weightController.text,
        ),
      );
    });

    _showSnackBar('New dog added');
    _clearControllers();
  }

  // Update existing dog
  void _showUpdateDialog(int index) {
    final dog = dogs[index];
    _nameController.text = dog.name;
    _breedController.text = dog.breed;
    _ageController.text = dog.age;
    _activityController.text = dog.activity;
    _weightController.text = dog.weight;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Dog Details'),
          content: _buildDogInputFields(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateDog(index);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _updateDog(int index) {
    setState(() {
      dogs[index] = Dog(
        name: _nameController.text,
        breed: _breedController.text,
        age: _ageController.text,
        activity: _activityController.text,
        weight: _weightController.text,
      );
    });

    _showSnackBar('Dog details updated');
    _clearControllers();
  }

  // Delete a dog
  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: Text('Do you really want to delete ${dogs[index].name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteDog(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _deleteDog(int index) {
    setState(() {
      dogs.removeAt(index);
    });

    _showSnackBar('Dog deleted');
  }

  // Helper methods
  Widget _buildDogInputFields() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _breedController,
            decoration: const InputDecoration(labelText: 'Breed'),
          ),
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Age'),
          ),
          TextField(
            controller: _activityController,
            decoration: const InputDecoration(labelText: 'Favorite Activity'),
          ),
          TextField(
            controller: _weightController,
            decoration: const InputDecoration(labelText: 'Weight'),
          ),
        ],
      ),
    );
  }

  void _clearControllers() {
    _nameController.clear();
    _breedController.clear();
    _ageController.clear();
    _activityController.clear();
    _weightController.clear();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog List'),
      ),
      body: ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return DogCard(
            dog: dogs[index],
            onDelete: () => _showDeleteConfirmationDialog(index),
            onEdit: () => _showUpdateDialog(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDogDialog,
        tooltip: 'Add Dog',
        child: const Icon(Icons.add),
      ),
    );
  }
}
