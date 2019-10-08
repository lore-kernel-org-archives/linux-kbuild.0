Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:31574 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729536AbfJHDLs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 23:11:48 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Date: Tue,  8 Oct 2019 12:10:09 +0900
Message-Id: <20191008031009.17364-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Matthias Maennich <maennich@google.com>, Adam Zerella <adam.zerella@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

We discussed a better location for this file, and agreed that
core-api/ is a good fit. Rename it to symbol-namespaces.rst
for disambiguation, and also add it to index.rst and MAINTAINERS.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/core-api/index.rst                                 | 1 +
 .../{kbuild/namespaces.rst => core-api/symbol-namespaces.rst}    | 0
 MAINTAINERS                                                      | 1 +
 3 files changed, 2 insertions(+)
 rename Documentation/{kbuild/namespaces.rst => core-api/symbol-namespaces.rst} (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index fa16a0538dcb..ab0eae1c153a 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -38,6 +38,7 @@ Core utilities
    protection-keys
    ../RCU/index
    gcc-plugins
+   symbol-namespaces
 
 
 Interfaces for kernel debugging
diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
similarity index 100%
rename from Documentation/kbuild/namespaces.rst
rename to Documentation/core-api/symbol-namespaces.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..a0ca64057b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11547,6 +11547,7 @@ NSDEPS
 M:	Matthias Maennich <maennich@google.com>
 S:	Maintained
 F:	scripts/nsdeps
+F:	Documentation/core-api/symbol-namespaces.rst
 
 NTB AMD DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
-- 
2.17.1
