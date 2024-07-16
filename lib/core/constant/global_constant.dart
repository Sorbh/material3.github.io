final $globalConstant = GlobalConstant();

class GlobalConstant {
  get colorRole => _ColorRole();
}

class _ColorRole {
  final data = {
    'Primary': _ColorRoleData(name: 'Primary', desriptionl: 'High-emphasis fills, texts, and icons against surface'),
    'On primary': _ColorRoleData(name: 'On primary', desriptionl: 'Text and icons against primary'),
    'Primary container': _ColorRoleData(
        name: 'Primary container', desriptionl: 'Standout fill color against surface, for key components like FAB'),
    'On primary container':
        _ColorRoleData(name: 'On primary container', desriptionl: 'Text and icons against primary container'),
  };

  _ColorRoleData? filter(String colorRole) => data[colorRole];
}

class _ColorRoleData {
  final String name;
  final String desriptionl;

  _ColorRoleData({required this.name, required this.desriptionl});
}
