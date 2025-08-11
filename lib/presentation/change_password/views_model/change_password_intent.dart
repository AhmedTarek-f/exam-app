sealed class ChangePasswordIntent {}

class InitializeChangePasswordIntent extends ChangePasswordIntent {}

class ToggleCurrentPasswordObscureIntent extends ChangePasswordIntent {}

class ToggleNewPasswordObscureIntent extends ChangePasswordIntent {}

class ToggleConfirmNewPasswordObscureIntent extends ChangePasswordIntent {}

class ChangePasswordPressedIntent extends ChangePasswordIntent {}
