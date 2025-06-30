import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'System',
      ),
      home: CreateAccountPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage>
    with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    _buildLogo(),
                    SizedBox(height: 40),
                    _buildTitle(),
                    SizedBox(height: 8),
                    _buildSubtitle(),
                    SizedBox(height: 50),
                    _buildForm(),
                    SizedBox(height: 30),
                    _buildCreateAccountButton(),
                    SizedBox(height: 30),
                    _buildDivider(),
                    SizedBox(height: 20),
                    _buildSocialButtons(),
                    SizedBox(height: 40),
                    _buildLoginLink(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 1200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE67E22),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE67E22).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.circle_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Text(
      'Create Account',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Join our community today',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          _buildTextField(
            controller: _emailController,
            hintText: 'Email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          _buildTextField(
            controller: _passwordController,
            hintText: 'Password',
            icon: Icons.lock_outline,
            isPassword: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54, fontSize: 16),
          prefixIcon: Icon(icon, color: Colors.white54),
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Color(0xFFE67E22), width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                _showSuccessDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE67E22),
                foregroundColor: Colors.white,
                elevation: 8,
                shadowColor: Color(0xFFE67E22).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR CONTINUE WITH',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        _buildSocialButton(
          text: 'Continue with Google',
          icon: Icons.g_mobiledata,
          onPressed: () {
            _showComingSoonDialog('Google Sign-In');
          },
        ),
        SizedBox(height: 15),
        _buildSocialButton(
          text: 'Continue with Facebook',
          icon: Icons.facebook,
          onPressed: () {
            _showComingSoonDialog('Facebook Sign-In');
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white.withOpacity(0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white.withOpacity(0.05),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SignInPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text(
            'Log in',
            style: TextStyle(
              color: Color(0xFFE67E22),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1a1a2e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Icon(
            Icons.check_circle,
            color: Color(0xFFE67E22),
            size: 50,
          ),
          content: Text(
            'Account created successfully!\nWelcome to our community!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFFE67E22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
} {
Navigator.of(context).pop();
},
child: Text(
'Continue',
style: TextStyle(
color: Color(0xFFE67E22),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}

void _showComingSoonDialog(String service) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
backgroundColor: Color(0xFF1a1a2e),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
title: Icon(
Icons.info_outline,
color: Color(0xFFE67E22),
size: 50,
),
content: Text(
'$service integration\ncoming soon!',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.white, fontSize: 16),
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text(
'OK',
style: TextStyle(
color: Color(0xFFE67E22),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}
}

class SignInPage extends StatefulWidget {
@override
_SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
with TickerProviderStateMixin {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
late AnimationController _fadeController;
late AnimationController _slideController;
late Animation<double> _fadeAnimation;
late Animation<Offset> _slideAnimation;

@override
void initState() {
super.initState();
_fadeController = AnimationController(
duration: Duration(milliseconds: 1000),
vsync: this,
);
_slideController = AnimationController(
duration: Duration(milliseconds: 800),
vsync: this,
);

_fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
);

_slideAnimation = Tween<Offset>(
begin: Offset(0, 0.3),
end: Offset.zero,
).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack));

_fadeController.forward();
_slideController.forward();
}

@override
void dispose() {
_fadeController.dispose();
_slideController.dispose();
_emailController.dispose();
_passwordController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
Color(0xFF1a1a2e),
Color(0xFF16213e),
Color(0xFF0f3460),
],
),
),
child: SafeArea(
child: FadeTransition(
opacity: _fadeAnimation,
child: SlideTransition(
position: _slideAnimation,
child: SingleChildScrollView(
padding: EdgeInsets.symmetric(horizontal: 24.0),
child: Column(
children: [
SizedBox(height: 40),
_buildBackButton(),
SizedBox(height: 40),
_buildLogo(),
SizedBox(height: 40),
_buildTitle(),
SizedBox(height: 8),
_buildSubtitle(),
SizedBox(height: 50),
_buildForm(),
SizedBox(height: 20),
_buildForgotPassword(),
SizedBox(height: 30),
_buildSignInButton(),
SizedBox(height: 30),
_buildDivider(),
SizedBox(height: 20),
_buildSocialButtons(),
SizedBox(height: 40),
_buildCreateAccountLink(),
SizedBox(height: 30),
],
),
),
),
),
),
),
);
}

Widget _buildBackButton() {
return Align(
alignment: Alignment.centerLeft,
child: IconButton(
onPressed: () {
Navigator.pop(context);
},
icon: Icon(
Icons.arrow_back_ios,
color: Colors.white,
size: 24,
),
),
);
}

Widget _buildLogo() {
return TweenAnimationBuilder<double>(
tween: Tween(begin: 0, end: 1),
duration: Duration(milliseconds: 1200),
builder: (context, value, child) {
return Transform.scale(
scale: value,
child: Container(
width: 80,
height: 80,
decoration: BoxDecoration(
shape: BoxShape.circle,
color: Color(0xFFE67E22),
boxShadow: [
BoxShadow(
color: Color(0xFFE67E22).withOpacity(0.3),
blurRadius: 20,
spreadRadius: 5,
),
],
),
child: Icon(
Icons.circle_outlined,
color: Colors.white,
size: 40,
),
),
);
},
);
}

Widget _buildTitle() {
return Text(
'Welcome Back',
style: TextStyle(
fontSize: 32,
fontWeight: FontWeight.bold,
color: Colors.white,
letterSpacing: -0.5,
),
);
}

Widget _buildSubtitle() {
return Text(
'Sign in to your account',
style: TextStyle(
fontSize: 16,
color: Colors.white70,
fontWeight: FontWeight.w400,
),
);
}

Widget _buildForm() {
return Container(
padding: EdgeInsets.all(24),
decoration: BoxDecoration(
color: Colors.black.withOpacity(0.2),
borderRadius: BorderRadius.circular(20),
border: Border.all(
color: Colors.white.withOpacity(0.1),
width: 1,
),
),
child: Column(
children: [
_buildTextField(
controller: _emailController,
hintText: 'Email address',
icon: Icons.email_outlined,
keyboardType: TextInputType.emailAddress,
),
SizedBox(height: 20),
_buildTextField(
controller: _passwordController,
hintText: 'Password',
icon: Icons.lock_outline,
isPassword: true,
),
],
),
);
}

Widget _buildTextField({
required TextEditingController controller,
required String hintText,
required IconData icon,
bool isPassword = false,
TextInputType keyboardType = TextInputType.text,
}) {
return AnimatedContainer(
duration: Duration(milliseconds: 300),
child: TextField(
controller: controller,
obscureText: isPassword,
keyboardType: keyboardType,
style: TextStyle(color: Colors.white, fontSize: 16),
decoration: InputDecoration(
hintText: hintText,
hintStyle: TextStyle(color: Colors.white54, fontSize: 16),
prefixIcon: Icon(icon, color: Colors.white54),
filled: true,
fillColor: Colors.white.withOpacity(0.05),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(15),
borderSide: BorderSide(color: Color(0xFFE67E22), width: 2),
),
contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
),
),
);
}

Widget _buildForgotPassword() {
return Align(
alignment: Alignment.centerRight,
child: GestureDetector(
onTap: () {
_showForgotPasswordDialog();
},
child: Text(
'Forgot Password?',
style: TextStyle(
color: Color(0xFFE67E22),
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
),
);
}

Widget _buildSignInButton() {
return TweenAnimationBuilder<double>(
tween: Tween(begin: 0, end: 1),
duration: Duration(milliseconds: 600),
builder: (context, value, child) {
return Transform.scale(
scale: value,
child: Container(
width: double.infinity,
height: 56,
child: ElevatedButton(
onPressed: () {
_showSuccessDialog();
},
style: ElevatedButton.styleFrom(
backgroundColor: Color(0xFFE67E22),
foregroundColor: Colors.white,
elevation: 8,
shadowColor: Color(0xFFE67E22).withOpacity(0.4),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),
),
child: Text(
'SIGN IN',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
),
),
);
},
);
}

Widget _buildDivider() {
return Row(
children: [
Expanded(
child: Divider(
color: Colors.white.withOpacity(0.3),
thickness: 1,
),
),
Padding(
padding: EdgeInsets.symmetric(horizontal: 16),
child: Text(
'OR CONTINUE WITH',
style: TextStyle(
color: Colors.white54,
fontSize: 12,
fontWeight: FontWeight.w500,
letterSpacing: 1,
),
),
),
Expanded(
child: Divider(
color: Colors.white.withOpacity(0.3),
thickness: 1,
),
),
],
);
}

Widget _buildSocialButtons() {
return Column(
children: [
_buildSocialButton(
text: 'Continue with Google',
icon: Icons.g_mobiledata,
onPressed: () {
_showComingSoonDialog('Google Sign-In');
},
),
SizedBox(height: 15),
_buildSocialButton(
text: 'Continue with Facebook',
icon: Icons.facebook,
onPressed: () {
_showComingSoonDialog('Facebook Sign-In');
},
),
],
);
}

Widget _buildSocialButton({
required String text,
required IconData icon,
required VoidCallback onPressed,
}) {
return Container(
width: double.infinity,
height: 56,
child: OutlinedButton(
onPressed: onPressed,
style: OutlinedButton.styleFrom(
foregroundColor: Colors.white,
side: BorderSide(color: Colors.white.withOpacity(0.3)),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),
backgroundColor: Colors.white.withOpacity(0.05),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(icon, size: 20),
SizedBox(width: 12),
Text(
text,
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.w500,
),
),
],
),
),
);
}

Widget _buildCreateAccountLink() {
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
"Don't have an account? ",
style: TextStyle(
color: Colors.white70,
fontSize: 16,
),
),
GestureDetector(
onTap: () {
Navigator.pop(context);
},
child: Text(
'Create Account',
style: TextStyle(
color: Color(0xFFE67E22),
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),
],
);
}

void _showSuccessDialog() {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
backgroundColor: Color(0xFF1a1a2e),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
title: Icon(
Icons.check_circle,
color: Color(0xFFE67E22),
size: 50,
),
content: Text(
'Successfully signed in!\nWelcome back!',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.white, fontSize: 16),
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text(
'Continue',
style: TextStyle(
color: Color(0xFFE67E22),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}

void _showComingSoonDialog(String service) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
backgroundColor: Color(0xFF1a1a2e),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
title: Icon(
Icons.info_outline,
color: Color(0xFFE67E22),
size: 50,
),
content: Text(
'$service integration\ncoming soon!',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.white, fontSize: 16),
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text(
'OK',
style: TextStyle(
color: Color(0xFFE67E22),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}

void _showForgotPasswordDialog() {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
backgroundColor: Color(0xFF1a1a2e),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
title: Text(
'Reset Password',
style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
),
content: Column(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'Enter your email address and we\'ll send you a link to reset your password.',
style: TextStyle(color: Colors.white70),
),
SizedBox(height: 20),
TextField(
style: TextStyle(color: Colors.white),
decoration: InputDecoration(
hintText: 'Email address',
hintStyle: TextStyle(color: Colors.white54),
filled: true,
fillColor: Colors.white.withOpacity(0.1),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
),
),
],
),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text(
'Cancel',
style: TextStyle(color: Colors.white54),
),
),
TextButton(
onPressed: () {
Navigator.of(context).pop();
_showResetEmailSentDialog();
},
child: Text(
'Send Reset Link',
style: TextStyle(
color: Color(0xFFE67E22),
fontWeight: FontWeight.bold,
),
),
),
],
);
},
);
}

void _showResetEmailSentDialog() {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
backgroundColor: Color(0xFF1a1a2e),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20),
),
title: Icon(
Icons.email_outlined,
color: Color(0xFFE67E22),
size: 50,
),
content: Text(
'Password reset link sent!\nCheck your email inbox.',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.white, fontSize: 16),
),
actions: [
TextButton(
onPressed: ()