import json
import sys

def get_node_id(node):
    """获取节点的唯一ID"""
    return node.get('id', 'unidentified_node') # Use a default for safety

def get_node_label(node):
    """创建节点在图中的标签，使其更具可读性"""
    label_parts = []
    
    # Kind is the most important part (e.g., FunctionDecl, VarDecl)
    kind = node.get('kind', 'UnknownKind')
    label_parts.append(kind)
    
    # Add the name if it exists (e.g., function name, variable name)
    name = node.get('name', '')
    if name:
        label_parts.append(f"({name})")
        
    # Add type information if it exists
    type_info = node.get('type', {}).get('qualType', '')
    if type_info:
        label_parts.append(f"<{type_info}>")

    # Add value for literals (e.g., numbers, strings)
    value = node.get('value', '')
    if value:
        label_parts.append(f'[{value}]')
            
    # Join all parts with a newline and escape special characters for DOT
    return "\\n".join(label_parts).replace('"', '\\"').replace('{', '\\{').replace('}', '\\}')

def traverse_and_build(node, dot_file, visited_ids):
    """
    递归遍历JSON树，先定义所有节点和边，避免重复定义。
    """
    node_id = get_node_id(node)
    
    # 如果节点已经处理过，就直接返回
    if node_id in visited_ids:
        return
    
    # 标记为已处理
    visited_ids.add(node_id)
    
    # 定义当前节点
    node_label = get_node_label(node)
    dot_file.write(f'  "{node_id}" [label="{node_label}"];\n')
    
    # 遍历'inner'数组寻找子节点
    if 'inner' in node:
        for child in node['inner']:
            # *** 关键修正 ***
            # 检查'child'是否是一个有效的节点（是字典类型且包含'id'键）
            if isinstance(child, dict) and 'id' in child:
                child_id = get_node_id(child)
                # 定义一条从父节点到子节点的边
                dot_file.write(f'  "{node_id}" -> "{child_id}";\n')
                # 递归处理子节点
                traverse_and_build(child, dot_file, visited_ids)

def main():
    if len(sys.argv) != 2:
        print("用法: python3 json_to_dot.py <ast.json文件路径>")
        sys.exit(1)
        
    json_file_path = sys.argv[1]
    try:
        with open(json_file_path, 'r') as f:
            root_node = json.load(f)
    except FileNotFoundError:
        print(f"错误: 文件 '{json_file_path}' 未找到。")
        sys.exit(1)
    except json.JSONDecodeError as e:
        print(f"错误: '{json_file_path}' 不是一个有效的JSON文件。错误信息: {e}")
        sys.exit(1)

    with open("ast.dot", "w") as f:
        f.write("digraph AST {\n")
        f.write('  graph [rankdir="TB", layout=dot, splines=ortho];\n')
        f.write('  node [shape=box, style="rounded,filled", fillcolor="lightblue"];\n')
        f.write('  edge [color="darkgrey"];\n')
        
        # 使用一个集合来跟踪已经访问过的节点，防止因AST复杂性导致的重复处理
        visited_ids = set()
        
        # 从根节点开始遍历
        if isinstance(root_node, dict) and 'id' in root_node:
            traverse_and_build(root_node, f, visited_ids)
        else:
            print("错误: JSON文件的根对象不是一个有效的AST节点。")

        f.write("}\n")
        
    print("\n成功生成 ast.dot 文件! 🚀")
    print("现在可以使用Graphviz来渲染它:")
    print("dot -Tpng ast.dot -o ast.png")

if __name__ == "__main__":
    main()