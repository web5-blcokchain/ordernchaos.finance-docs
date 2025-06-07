#!/bin/bash

# 修复所有页面的CSS路径和链接问题

# 机制(Mechanics)部分
for file in docs/mechanics/*.html; do
  if [ "$file" != "docs/mechanics/pricing-curve.html" ]; then
    echo "Fixing $file..."
    # 修复CSS路径
    sed -i '' 's|<link rel="stylesheet" href="../styles.css">|<link rel="stylesheet" href="../../styles.css">|g' "$file"
    
    # 修复导航链接
    sed -i '' 's|<a href="../docs/|<a href="../../docs/|g' "$file"
    
    # 修复返回首页链接
    sed -i '' 's|<a href="../index.html"|<a href="../../index.html"|g' "$file"
    
    # 根据文件名添加特定标题和导航
    filename=$(basename "$file" .html)
    case "$filename" in
      "staking-rewards")
        title="Staking Rewards (\$prCHAOS)"
        desc="Understanding the staking rewards mechanism"
        prev="../../docs/mechanics/pricing-curve.html"
        prev_title="Pricing Curve(vAMM)"
        next="../../docs/mechanics/zero-risk-loans.html" 
        next_title="Zero Risk Loans (\$ORDER)"
        ;;
      "zero-risk-loans")
        title="Zero Risk Loans (\$ORDER)"
        desc="How the zero liquidation-risk loans work"
        prev="../../docs/mechanics/staking-rewards.html"
        prev_title="Staking Rewards(\$prCHAOS)"
        next="../../docs/mechanics/stableswap.html" 
        next_title="Stableswap(Coming soon)"
        ;;
      "stableswap")
        title="Stableswap (Coming soon)"
        desc="Details about the upcoming stableswap feature"
        prev="../../docs/mechanics/zero-risk-loans.html"
        prev_title="Zero Risk Loans (\$ORDER)"
        next="../../docs/mechanics/nft-magic-power.html" 
        next_title="NFT Magic Power(Coming soon)"
        ;;
      "nft-magic-power")
        title="NFT Magic Power (Coming soon)"
        desc="Details about the upcoming NFT features"
        prev="../../docs/mechanics/stableswap.html"
        prev_title="Stableswap(Coming soon)"
        next="../../docs/tokens/order.html" 
        next_title="\$ORDER"
        ;;
    esac
    
    # 添加标题和导航
    sed -i '' "s|<title>OrderNChaos Documentation - Under Construction</title>|<title>OrderNChaos Documentation - $title</title>|g" "$file"
    sed -i '' "s|<h1>Page Under Construction</h1>|<h1>$title</h1>|g" "$file"
    sed -i '' "s|<p>This page is currently being developed</p>|<p>$desc</p><div class=\"page-nav\"><a href=\"$prev\" class=\"prev-link\">Previous: $prev_title</a><a href=\"$next\" class=\"next-link\">Next: $next_title</a></div><p class=\"last-updated\">Last updated 3 years ago</p>|g" "$file"
  fi
done

# 代币(Tokens)部分
for file in docs/tokens/*.html; do
  echo "Fixing $file..."
  # 修复CSS路径
  sed -i '' 's|<link rel="stylesheet" href="../styles.css">|<link rel="stylesheet" href="../../styles.css">|g' "$file"
  
  # 修复导航链接
  sed -i '' 's|<a href="../docs/|<a href="../../docs/|g' "$file"
  
  # 修复返回首页链接
  sed -i '' 's|<a href="../index.html"|<a href="../../index.html"|g' "$file"
  
  # 根据文件名添加特定标题和导航
  filename=$(basename "$file" .html)
  case "$filename" in
    "order")
      title="\$ORDER"
      desc="Details about the \$ORDER token"
      prev="../../docs/mechanics/nft-magic-power.html"
      prev_title="NFT Magic Power(Coming soon)"
      next="../../docs/tokens/chaos.html" 
      next_title="\$CHAOS"
      ;;
    "chaos")
      title="\$CHAOS"
      desc="Details about the \$CHAOS token"
      prev="../../docs/tokens/order.html"
      prev_title="\$ORDER"
      next="../../docs/tokens/prchaos.html" 
      next_title="\$prCHAOS"
      ;;
    "prchaos")
      title="\$prCHAOS"
      desc="Details about the \$prCHAOS token"
      prev="../../docs/tokens/chaos.html"
      prev_title="\$CHAOS"
      next="../../docs/more/addresses.html" 
      next_title="Addresses"
      ;;
  esac
  
  # 添加标题和导航
  sed -i '' "s|<title>OrderNChaos Documentation - Under Construction</title>|<title>OrderNChaos Documentation - $title</title>|g" "$file"
  sed -i '' "s|<h1>Page Under Construction</h1>|<h1>$title</h1>|g" "$file"
  sed -i '' "s|<p>This page is currently being developed</p>|<p>$desc</p><div class=\"page-nav\"><a href=\"$prev\" class=\"prev-link\">Previous: $prev_title</a><a href=\"$next\" class=\"next-link\">Next: $next_title</a></div><p class=\"last-updated\">Last updated 3 years ago</p>|g" "$file"
done

# 更多信息(More)部分
for file in docs/more/*.html; do
  if [ "$file" != "docs/more/token-allocation.html" ]; then
    echo "Fixing $file..."
    # 修复CSS路径
    sed -i '' 's|<link rel="stylesheet" href="../styles.css">|<link rel="stylesheet" href="../../styles.css">|g' "$file"
    
    # 修复导航链接
    sed -i '' 's|<a href="../docs/|<a href="../../docs/|g' "$file"
    
    # 修复返回首页链接
    sed -i '' 's|<a href="../index.html"|<a href="../../index.html"|g' "$file"
    
    # 根据文件名添加特定标题和导航
    filename=$(basename "$file" .html)
    case "$filename" in
      "addresses")
        title="Addresses"
        desc="Contract addresses for the OrderNChaos protocol"
        prev="../../docs/tokens/prchaos.html"
        prev_title="\$prCHAOS"
        next="../../docs/more/token-allocation.html" 
        next_title="Token allocation"
        ;;
      "fees")
        title="Fees"
        desc="Fee structure in the OrderNChaos protocol"
        prev="../../docs/more/token-allocation.html"
        prev_title="Token allocation"
        next="../../docs/more/risks.html" 
        next_title="Risks"
        ;;
      "risks")
        title="Risks"
        desc="Understanding the risks associated with the protocol"
        prev="../../docs/more/fees.html"
        prev_title="Fees"
        next="" 
        next_title=""
        
        # 特殊处理没有下一页的情况
        if [ -z "$next" ]; then
          sed -i '' "s|<p>This page is currently being developed</p>|<p>$desc</p><div class=\"page-nav\"><a href=\"$prev\" class=\"prev-link\">Previous: $prev_title</a></div><p class=\"last-updated\">Last updated 3 years ago</p>|g" "$file"
        else
          sed -i '' "s|<p>This page is currently being developed</p>|<p>$desc</p><div class=\"page-nav\"><a href=\"$prev\" class=\"prev-link\">Previous: $prev_title</a><a href=\"$next\" class=\"next-link\">Next: $next_title</a></div><p class=\"last-updated\">Last updated 3 years ago</p>|g" "$file"
        fi
        
        # 如果已经处理过标题，则跳过标题处理
        continue
        ;;
    esac
    
    # 添加标题和导航
    sed -i '' "s|<title>OrderNChaos Documentation - Under Construction</title>|<title>OrderNChaos Documentation - $title</title>|g" "$file"
    sed -i '' "s|<h1>Page Under Construction</h1>|<h1>$title</h1>|g" "$file"
    sed -i '' "s|<p>This page is currently being developed</p>|<p>$desc</p><div class=\"page-nav\"><a href=\"$prev\" class=\"prev-link\">Previous: $prev_title</a><a href=\"$next\" class=\"next-link\">Next: $next_title</a></div><p class=\"last-updated\">Last updated 3 years ago</p>|g" "$file"
  fi
done

echo "All pages have been fixed!" 