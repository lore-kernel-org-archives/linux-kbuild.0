Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:31817 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752142AbdBHDMi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Feb 2017 22:12:38 -0500
From: changbin.du@intel.com
Subject: [PATCH v2 2/2] Documentation/kconfig: add search jump feature description
Date: Wed,  8 Feb 2017 11:09:39 +0800
Message-Id: <20170208030939.10146-3-changbin.du@intel.com>
In-Reply-To: <20170208030939.10146-1-changbin.du@intel.com>
References: <20170208030939.10146-1-changbin.du@intel.com>
In-Reply-To: <20170206074648.23896-1-changbin.du@intel.com>
References: <20170206074648.23896-1-changbin.du@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, corbet@lwn.net
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jim.epost@gmail.com, jani.nikula@linux.intel.com, Changbin Du <changbin.du@intel.com>

From: Changbin Du <changbin.du@intel.com>

Kernel menuconfig support direct jumping function from the search
result. This is a very convenient feature but not documented. So
add a short description to the kconfig documentation to let more
developers know it.

v2: correct spell (Jim)

Signed-off-by: Changbin Du <changbin.du@intel.com>
Reviewed-by: Jim Davis <jim.epost@gmail.com>
---
 Documentation/kbuild/kconfig.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
index bbc99c0..fdac2cd 100644
--- a/Documentation/kbuild/kconfig.txt
+++ b/Documentation/kbuild/kconfig.txt
@@ -178,6 +178,10 @@ Searching in menuconfig:
 	first (and in alphabetical order), then come all other symbols,
 	sorted in alphabetical order.
 
+	In the search result textbox, each symbol has a jump number on
+	left side if the symbol is visible. You can type the number
+	to jump to target menu to configure that symbol.
+
 ______________________________________________________________________
 User interface options for 'menuconfig'
 
-- 
2.7.4

