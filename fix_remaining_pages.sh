#!/bin/bash

# 此脚本将所有剩余的"Coming Soon"页面更改为"In Progress"页面
# 适用于未完全开发的页面

# 查找所有HTML文件
find ./docs -type f -name "*.html" | while read file; do
    # 检查文件是否包含"Coming Soon"标记
    if grep -q "Coming Soon" "$file"; then
        echo "处理文件: $file"
        
        # 替换"Coming Soon"为"In Progress"
        sed -i '' 's/<h2 style="margin-top: 20px;">Coming Soon<\/h2>/<h2 style="margin-top: 20px;">In Progress<\/h2>/g' "$file"
        sed -i '' 's/<p>This page is currently under development. Please check back later for updates.<\/p>/<p>This page is currently being developed and will be available soon. The content is being prepared by our team.<\/p>/g' "$file"
        
        # 添加预计完成日期
        sed -i '' 's/<p>In the meantime, you can explore the available documentation from the sidebar navigation.<\/p>/<p>In the meantime, you can explore the available documentation from the sidebar navigation.<\/p><p style="margin-top: 15px;"><strong>Expected completion:<\/strong> Q4 2023<\/p>/g' "$file"
        
        # 将蓝色修改为绿色
        sed -i '' 's/stroke="#0052cc"/stroke="#2e7d32"/g' "$file"
        sed -i '' 's/background-color: #0052cc;/background-color: #2e7d32;/g' "$file"
        
        echo "文件已更新: $file"
    fi
done

echo "所有'Coming Soon'页面已更新为'In Progress'" 