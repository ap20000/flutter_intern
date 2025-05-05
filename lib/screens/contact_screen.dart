import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/contact_bloc.dart';
import '../blocs/contact_event.dart';
import '../blocs/contact_state.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Finder")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ContactBloc>().add(FindDuplicates());
            },
            child: const Text("Find Duplicates"),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state is ContactLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DuplicatesFound) {
                  return ListView.builder(
                    itemCount: state.duplicates.length,
                    itemBuilder: (_, i) {
                      final c = state.duplicates[i];
                      return ListTile(
                        title: Text(c.name),
                        subtitle: Text(c.phone),
                      );
                    },
                  );
                } else if (state is ContactLoaded) {
                  return const Center(
                    child: Text("Press button to find duplicates"),
                  );
                }
                return const Center(child: Text("No data"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
