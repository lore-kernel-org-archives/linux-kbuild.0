Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16728 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751164AbdBFHs5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 02:48:57 -0500
From: changbin.du@intel.com
Subject: [PATCH 2/2] Documentation/kconfig: add search jump feature description
Date: Mon,  6 Feb 2017 15:46:48 +0800
Message-Id: <20170206074648.23896-3-changbin.du@intel.com>
In-Reply-To: <20170206074648.23896-1-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du <changbin.du@intel.com>

From: Changbin Du <changbin.du@intel.com>

Kernel menuconfig support direct jumping function from the search
result. This is a very convenient feature but not documented. So
add a short description to the kconfig documentation to let more
developer know it.

Signed-off-by: Changbin Du <changbin.du@intel.com>
---
 Documentation/kbuild/kconfig.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index bbc99c0..9916318 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -178,6 +178,10 @@ Searching in menuconfig:
 	first (and in alphabetical order), then come all other symbols,
 	sorted in alphabetical order.
 
+	In the search result textbox, each symbol has a jump number on
+	left side if the symbol is jumpable. You can type the nubmer
+	to jump to target menu to configurate that symbol.
+
 ______________________________________________________________________
 User interface options for 'menuconfig'
 
-- 
2.7.4

