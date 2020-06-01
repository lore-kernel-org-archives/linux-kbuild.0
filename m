Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:54644 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAREc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 13:04:32 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: doc: rename LDFLAGS to KBUILD_LDFLAGS
Date: Tue,  2 Jun 2020 02:03:28 +0900
Message-Id: <20200601170328.3053311-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Commit d503ac531a52 ("kbuild: rename LDFLAGS to KBUILD_LDFLAGS") missed
to update the documentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 2a18aea7c043..6515ebc12b6f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -910,7 +910,7 @@ When kbuild executes, the following steps are followed (roughly):
 7.1 Set variables to tweak the build to the architecture
 --------------------------------------------------------
 
-    LDFLAGS
+    KBUILD_LDFLAGS
 	Generic $(LD) options
 
 	Flags used for all invocations of the linker.
@@ -919,7 +919,7 @@ When kbuild executes, the following steps are followed (roughly):
 	Example::
 
 		#arch/s390/Makefile
-		LDFLAGS         := -m elf_s390
+		KBUILD_LDFLAGS         := -m elf_s390
 
 	Note: ldflags-y can be used to further customise
 	the flags used. See chapter 3.7.
-- 
2.25.1
