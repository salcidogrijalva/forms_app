import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: const _SignUpView(),
    );
  }
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
               FlutterLogo(size: 100,),
              _SignUpForm(),
               SizedBox(height: 20,),
              
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';
              if (value.length <= 6) return 'Field must be more than 6 characters long';

              return null;
            },
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';

              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if (!emailRegExp.hasMatch(value)) return 'Email is not in a valid format';

              return null;
            },
          ),
          const SizedBox(height: 20,),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field is required';
              if (value.trim().isEmpty) return 'Field is required';
              if (value.length <= 6) return 'Field must be more than 6 characters long';

              return null;
            },
          ),
          const SizedBox(height: 20,),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();

              if (!isValid) return ;

              print('$username, $email, $password');
            }, 
            icon: const Icon(Icons.save), 
            label: const Text('Sign up')
          )
        ],
      )
    );
  }
}