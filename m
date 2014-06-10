Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:49260 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754407AbaFJCwQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 22:52:16 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: document KBUILD_SHELL
Date: Tue, 10 Jun 2014 11:51:50 +0900
Message-Id: <1402368710-31648-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

CONFIG_SHELL was renamed to KBUILD_SHELL.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>
---
 Documentation/kbuild/kbuild.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6466704..425cd2e 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -233,3 +233,8 @@ KBUILD_VMLINUX_MAIN
 All object files for the main part of vmlinux.
 KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
 all the object files used to link vmlinux.
+
+KBUILD_SHELL
+--------------------------------------------------
+Specify which shell to use to run shell scripts in Kbuild.
+Assigned by the top-level Makefile.
-- 
1.9.1

