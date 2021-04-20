




print(course_list)



#
# print(node_tree)
#
# keys = list(node_tree.keys())
# intkeys = [ tuple(map(int,k.split('|'))) for k in keys]
# print(intkeys)
#
# intkeys.sort()
# print(intkeys)
#
# keys = [ '|'.join(map(str, k)) for k in intkeys]
#
# print(keys)
# for key in keys:
#     if len(key.split('|')) == 1:
#         print('Course: ', node_tree[key]['name'])
#     elif len(key.split('|')) == 2:
#         print('    Seccion: ', node_tree[key]['name'],  node_tree[key]['order_in_container'])
#     else:
#         print('        ' + node_tree[key]['name'], node_tree[key]['order_in_container'])
#
# for section_key in [key for key in keys if len(key.split('|')) == 2]:
#     print('    Seccion: ',section_key, node_tree[section_key]['name'], node_tree[section_key]['order_in_container'])
#     for key in [key for key in keys if len(key.split('|')) >= 3 and section_key.split('|')[:2] == key.split('|')[:2] ]:
#         print('  ' + key + ' '+ node_tree[key]['name'],node_tree[section_key]['order_in_container'])


