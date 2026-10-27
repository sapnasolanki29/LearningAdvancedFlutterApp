import 'package:flutter/material.dart';
import 'package:flutterprojects/Providers/user_provider.dart';
import 'package:flutterprojects/routes/routes.dart';
import 'package:provider/provider.dart';

import 'Models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool buttonChanged = false;
  String name = "";
  final _formKey = GlobalKey<FormState>();

  void _moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChanged = true;
      });
      context.read<UserProvider>().setUser(
            User(id: 1, name: name),
          );
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
          setState(() {
            buttonChanged = false;
          });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Modern Header Image (New Custom Theme-Matched Asset)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/login.png",
                        fit: BoxFit.contain,
                        height: 180,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Welcome Header & Subtitle
                    Text(
                      "Welcome $name",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ) ??
                          TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Please sign in to continue",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // UserName TextFormField
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter UserName";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                        prefixIcon: Icon(Icons.person_outline, color: primaryColor),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password TextFormField
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Animated Login Button
                    Center(
                      child: AnimatedPhysicalModel(
                        duration: const Duration(milliseconds: 300),
                        shape: BoxShape.rectangle,
                        elevation: buttonChanged ? 0 : 3,
                        color: primaryColor,
                        shadowColor: primaryColor.withValues(alpha: 0.4),
                        borderRadius: buttonChanged
                            ? BorderRadius.circular(30)
                            : BorderRadius.circular(12),
                        child: InkWell(
                          onTap: _moveToHome,
                          borderRadius: buttonChanged
                              ? BorderRadius.circular(30)
                              : BorderRadius.circular(12),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: buttonChanged ? 50 : 200,
                            height: 50,
                            alignment: Alignment.center,
                            child: buttonChanged
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
