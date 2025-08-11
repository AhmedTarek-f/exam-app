sealed class ProfileIntent {}

final class ProfileInitializeDataIntent extends ProfileIntent {}

final class UpdateProfileDataIntent extends ProfileIntent {}

final class NavigateToChangePasswordIntent extends ProfileIntent {}

final class LogoutIntent extends ProfileIntent {}
