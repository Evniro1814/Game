extends Resource
class_name ItemReferenceBase

export(String) var item_id
export(String) var item_name
export(String) var item_description

export(float) var item_weight

#Item on the ground
export(String,FILE) var item_prefab_path

export(ImageTexture) var item_icon

enum ArmorType{CLOTH,ARMOR_LIGHT,ARMOR_MEDIUM,ARMOR_HEAVY}
enum ArmorSlot{SLOT1, SLOT2, SLOT3}#Think about armor slots
enum WeaponGrip{ONE_HANDED,TWO_HANDED,BOTH}#Both means that it is possible to switch the grip
enum ConsumableType{POTION,FOOD,SCROLL,POISON}
enum WeaponType{RANGED,MELEE}
enum WeaponDamageType{PIERCING,BLUNT,CUT}
