Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:35168 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947Ab2LWP3h (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Dec 2012 10:29:37 -0500
Received: by mail-oa0-f50.google.com with SMTP id n16so6085430oag.23
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Dec 2012 07:29:35 -0800 (PST)
MIME-Version: 1.0
From: Sunil Beta Baskar <betasam@gmail.com>
Date: Sun, 23 Dec 2012 20:59:20 +0530
Message-ID: <CAK2BWArN+HmtQMYJ8R_sBMQsahrR8TYeTTsyLUU9AvvFJFD=dQ@mail.gmail.com>
Subject: [PATCH] fix: spaces in srctree and objtree paths no longer break builds.
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Signed-off-by: Sunil Beta <betasam@gmail.com>
---
 Makefile |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07bc925..c2ae267 100644
--- a/Makefile
+++ b/Makefile
@@ -149,8 +149,13 @@ else
 _all: modules
 endif

-srctree        := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
+srctree            := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
 objtree        := $(CURDIR)
+
+# FIX! spaces in path can break build
+srctree         := $(shell echo $(srctree) | sed "s/ /\\\ /g" )
+objtree         := $(shell echo $(objtree) | sed "s/ /\\\ /g" )
+
 src        := $(srctree)
 obj        := $(objtree)

--
1.7.10.4
