import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petproject/bloc/registration_bloc.dart';
import 'package:petproject/user_bloc/bloc/user_bloc_bloc.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController useraName = TextEditingController();
  final TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: BlocBuilder<RegistrationBloc, RegistrationBlocState>(
        builder: (context, registrationState) {
          final provider = BlocProvider.of<RegistrationBloc>(context).add;

          // Получение текста для счетчика
          String countText = 'N/A';
          if (registrationState is CountInitial) {
            countText = registrationState.count.toString();
          }

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Registration Page'),
                centerTitle: true,
                backgroundColor: Colors.teal,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Блок управления счетчиком
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                provider(Increment());
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              child: const Icon(Icons.add),
                            ),
                            Text(
                              countText,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                provider(Decrement());
                                 
                                
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            TextButton(
                              onPressed: () {
                                 int? countValue = int.tryParse(countText);
                                
                                // Преобразуем countText в число
                              
                                if (countValue != null) {
                                  BlocProvider.of<UserBloc>(context)
                                      .add(JobGetBlocEvent(count: countValue));
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              child: const Icon(Icons.import_contacts_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Список работ
                    BlocBuilder<UserBloc, UserBlocState>(
                      builder: (context, userState) {
                        if (userState.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (userState.job.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: userState.job.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(userState.job[index].job),
                                );
                              },
                            ),
                          );
                        } else {
                          return const Text('No jobs available');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
