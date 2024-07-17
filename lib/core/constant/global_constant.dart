final $globalConstant = GlobalConstant();

class GlobalConstant {
  get colorRole => _ColorRole();
}

class _ColorRole {
  final data = {
    'Primary': _ColorRoleData(name: 'Primary', desriptionl: 'High-emphasis fills, texts, and icons against surface'),
    'On Primary': _ColorRoleData(name: 'On primary', desriptionl: 'Text and icons against primary'),
    'Primary container': _ColorRoleData(
        name: 'Primary container', desriptionl: 'Standout fill color against surface, for key components like FAB'),
    'On Primary Container':
        _ColorRoleData(name: 'On primary container', desriptionl: 'Text and icons against primary container'),
    'Secondary':
        _ColorRoleData(name: 'Secondary', desriptionl: 'Less prominent fills, text, and icons against surface'),
    'On Secondary': _ColorRoleData(name: 'On Secondary', desriptionl: 'Text and icons against secondary'),
    'Secondary Container': _ColorRoleData(
        name: 'Secondary Container',
        desriptionl: 'Less prominent fill color against surface, for recessive components like tonal buttons'),
    'On Secondary Container':
        _ColorRoleData(name: 'On Secondary Container', desriptionl: 'Text and icons against secondary container'),
    'Tertiary': _ColorRoleData(name: 'Tertiary', desriptionl: 'Complementary fills, text, and icons against surface'),
    'On Tertiary': _ColorRoleData(name: 'On Tertiary', desriptionl: 'Text and icons against tertiary'),
    'Tertiary Container': _ColorRoleData(
        name: 'Tertiary Container',
        desriptionl: 'Complementary container color against surface, for components like input fields'),
    'On Tertiary Container':
        _ColorRoleData(name: 'On Tertiary Container', desriptionl: 'Text and icons against tertiary container'),
    'Error': _ColorRoleData(
        name: 'Error',
        desriptionl: 'Attention-grabbing color against surface for fills, icons, and text, indicating urgency'),
    'On Error': _ColorRoleData(name: 'On Error', desriptionl: 'Text and icons against error'),
    'Error Container':
        _ColorRoleData(name: 'Error Container', desriptionl: 'Attention-grabbing fill color against surface'),
    'On Error Container':
        _ColorRoleData(name: 'On Error Container', desriptionl: 'Text and icons against error container'),
    'Surface': _ColorRoleData(name: 'Surface', desriptionl: 'Default color for backgrounds'),
    'On Surface': _ColorRoleData(name: 'On Surface', desriptionl: 'Text and icons against any surface color'),
    'On Surface Variant': _ColorRoleData(
        name: 'On Surface Variant', desriptionl: 'Lower-emphasis color for text and icons against any surface color'),
    'Surface Container Lowest':
        _ColorRoleData(name: 'Surface Container Lowest', desriptionl: 'Lowest-emphasis container color'),
    'Surface Container Low': _ColorRoleData(name: 'Surface Container Low', desriptionl: 'Low-emphasis container color'),
    'Surface Container': _ColorRoleData(name: 'Surface Container', desriptionl: 'Default container color'),
    'Surface Container High':
        _ColorRoleData(name: 'Surface Container High', desriptionl: 'High-emphasis container color'),
    'Surface Container Highest':
        _ColorRoleData(name: 'Surface Container Highest', desriptionl: 'Highest-emphasis container color'),
    'Inverse Surface': _ColorRoleData(
        name: 'Inverse Surface', desriptionl: 'Background fills for elements which contrast against surface'),
    'Inverse On Surface':
        _ColorRoleData(name: 'Inverse On urface', desriptionl: 'Text and icons against inverse surface'),
    'Inverse Primary': _ColorRoleData(
        name: 'Inverse Primary', desriptionl: 'Actionable elements, such as text buttons, against inverse surface'),
    'Outline': _ColorRoleData(name: 'Outline', desriptionl: 'Important boundaries, such as a text field outline'),
    'Outline Variant': _ColorRoleData(name: 'Outline Variant', desriptionl: 'Decorative elements, such as dividers'),
    'Primary Fixed': _ColorRoleData(
        name: 'Primary Fixed',
        desriptionl:
            'Primary fixed, secondary fixed, and tertiary fixed are fill colors used against surface. These colors maintain the same tone in light and dark themes, as opposed to regular container colors, which change in tone between these themes. The fixed color role may be used instead of the equivalent container role in situations where such fixed behavior is desired.'),
    'Secondary Fixed': _ColorRoleData(
        name: 'Secondary Fixed',
        desriptionl:
            'Primary fixed, secondary fixed, and tertiary fixed are fill colors used against surface. These colors maintain the same tone in light and dark themes, as opposed to regular container colors, which change in tone between these themes. The fixed color role may be used instead of the equivalent container role in situations where such fixed behavior is desired.'),
    'Tertiary Fixed': _ColorRoleData(
        name: 'Tertiary Fixed',
        desriptionl:
            'Primary fixed, secondary fixed, and tertiary fixed are fill colors used against surface. These colors maintain the same tone in light and dark themes, as opposed to regular container colors, which change in tone between these themes. The fixed color role may be used instead of the equivalent container role in situations where such fixed behavior is desired.'),
    'Primary Fixed Dim': _ColorRoleData(
        name: 'Primary Fixed Dim',
        desriptionl:
            'The primary fixed dim, secondary fixed dim, and tertiary fixed dim roles provide a stronger, more emphasized tone relative to the equivalent fixed color. They may be used where a deeper color but the same fixed behavior is desired.'),
    'Secondary Fixed Dim': _ColorRoleData(
        name: 'Secondary Fixed Dim',
        desriptionl:
            'The primary fixed dim, secondary fixed dim, and tertiary fixed dim roles provide a stronger, more emphasized tone relative to the equivalent fixed color. They may be used where a deeper color but the same fixed behavior is desired.'),
    'Tertiary Fixed Dim': _ColorRoleData(
        name: 'Tertiary Fixed Dim',
        desriptionl:
            'The primary fixed dim, secondary fixed dim, and tertiary fixed dim roles provide a stronger, more emphasized tone relative to the equivalent fixed color. They may be used where a deeper color but the same fixed behavior is desired.'),
    'On Primary Fixed': _ColorRoleData(
        name: 'On Primary Fixed',
        desriptionl:
            'On fixed colors are used for text and icons which sit on top of the corresponding Fixed color. For example, on primary fixed is used for text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'On Secondary Fixed': _ColorRoleData(
        name: 'On Secondary Fixed',
        desriptionl:
            'On fixed colors are used for text and icons which sit on top of the corresponding Fixed color. For example, on primary fixed is used for text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'On Tertiary Fixed': _ColorRoleData(
        name: 'On Tertiary Fixed',
        desriptionl:
            'On fixed colors are used for text and icons which sit on top of the corresponding Fixed color. For example, on primary fixed is used for text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'On Primary Fixed Variant': _ColorRoleData(
        name: 'On Primary Fixed Variant',
        desriptionl:
            'On fixed variant colors are used for text and icons needing lower emphasis against the corresponding fixed color. For example, on primary fixed variant is used for low emphasis text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'On Secondary Fixed Variant': _ColorRoleData(
        name: 'On Secondary Fixed Variant',
        desriptionl:
            'On fixed variant colors are used for text and icons needing lower emphasis against the corresponding fixed color. For example, on primary fixed variant is used for low emphasis text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'On Tertiary Fixed Variant': _ColorRoleData(
        name: 'On Tertiary Fixed Variant',
        desriptionl:
            'On fixed variant colors are used for text and icons needing lower emphasis against the corresponding fixed color. For example, on primary fixed variant is used for low emphasis text and icons against the primary fixed color. The same usage applies for the equivalent secondary and tertiary colors.'),
    'Surface Dim': _ColorRoleData(name: 'Surface Dim', desriptionl: 'Dimmest surface color in light and dark themes'),
    'Surface Bright':
        _ColorRoleData(name: 'Surface Bright', desriptionl: 'Brightest surface color in light and dark themes'),
  };

  _ColorRoleData? filter(String colorRole) => data[colorRole];
}

class _ColorRoleData {
  final String name;
  final String desriptionl;

  _ColorRoleData({required this.name, required this.desriptionl});
}
