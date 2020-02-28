Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f74.google.com ([209.85.221.74]:34088 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgB1RUY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 12:20:24 -0500
Received: by mail-wr1-f74.google.com with SMTP id f10so1626666wrv.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 09:20:21 -0800 (PST)
Date: Fri, 28 Feb 2020 17:20:13 +0000
In-Reply-To: <20200228172015.44369-1-qperret@google.com>
Message-Id: <20200228172015.44369-2-qperret@google.com>
Mime-Version: 1.0
References: <20200228172015.44369-1-qperret@google.com>
Subject: [PATCH v6 1/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
From: Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, nico@fluxnic.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org, qperret@google.com

CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
from ksymtab. This works really well when using in-tree drivers, but
cannot be used in its current form if some of them are out-of-tree.

Indeed, even if the list of symbols required by out-of-tree drivers is
known at compile time, the only solution today to guarantee these don't
get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
space, but also makes it difficult to control the ABI usable by vendor
modules in distribution kernels such as Android. Being able to control
the kernel ABI surface is particularly useful to ship a unique Generic
Kernel Image (GKI) for all vendors, which is a first step in the
direction of getting all vendors to contribute their code upstream.

As such, attempt to improve the situation by enabling users to specify a
symbol 'whitelist' at compile time. Any symbol specified in this
whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
even if it has no in-tree user. The whitelist is defined as a simple
text file, listing symbols, one per line.

Acked-by: Jessica Yu <jeyu@kernel.org>
Acked-by: Nicolas Pitre <nico@fluxnic.net>
Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 init/Kconfig                | 13 +++++++++++++
 scripts/adjust_autoksyms.sh | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 20a6ac33761c..873256bdbea5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2208,6 +2208,19 @@ config TRIM_UNUSED_KSYMS
 
 	  If unsure, or if you need to build out-of-tree modules, say N.
 
+config UNUSED_KSYMS_WHITELIST
+	string "Whitelist of symbols to keep in ksymtab"
+	depends on TRIM_UNUSED_KSYMS
+	help
+	  By default, all unused exported symbols will be un-exported from the
+	  build when TRIM_UNUSED_KSYMS is selected.
+
+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
+	  exported at all times, even in absence of in-tree users. The value to
+	  set here is the path to a text file containing the list of symbols,
+	  one per line. The path can be absolute, or relative to the kernel
+	  source tree.
+
 endif # MODULES
 
 config MODULES_TREE_LOOKUP
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index a904bf1f5e67..212ba45595d3 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -38,6 +38,17 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
+ksym_wl=/dev/null
+if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
+	# Use 'eval' to expand the whitelist path and check if it is relative
+	eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
+	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
+	if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
+		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
+		exit 1
+	fi
+fi
+
 # Generate a new ksym list file with symbols needed by the current
 # set of modules.
 cat > "$new_ksyms_file" << EOT
@@ -48,6 +59,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - "$ksym_wl" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
-- 
2.25.1.481.gfbce0eb801-goog
