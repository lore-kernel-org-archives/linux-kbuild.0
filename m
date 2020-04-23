Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31862 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgDWHkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:35 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/16] Revert "objtool: Skip samples subdirectory"
Date: Thu, 23 Apr 2020 16:39:15 +0900
Message-Id: <20200423073929.127521-3-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org

This reverts commit 8728497895794d1f207a836e02dae762ad175d56.

This directory contains no object.

Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/samples/Makefile b/samples/Makefile
index f8f847b4f61f..5ce50ef0f2b2 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux samples code
-OBJECT_FILES_NON_STANDARD := y
 
 obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
 obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
-- 
2.25.1
