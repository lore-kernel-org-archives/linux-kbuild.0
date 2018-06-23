Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:59296 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933783AbeFWDI0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 23:08:26 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: document Kconfig source file comments
Message-ID: <b2854ed6-073d-11b9-b344-571a0903995c@infradead.org>
Date: Fri, 22 Jun 2018 20:08:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

I saw this type of Kconfig construct on LKML:

config SYMBOOL
	#bool "prompt string"
	default y

and wondered what it does.  Then I wondered if '#' comments are
even documented.  They aren't, so add a little doc for that.

Ah, good.  kconfig says:
arch/x86/Kconfig:2942:warning: config symbol defined without type

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/kbuild/kconfig-language.txt |    6 ++++++
 1 file changed, 6 insertions(+)

--- lnx-418-rc1.orig/Documentation/kbuild/kconfig-language.txt
+++ lnx-418-rc1/Documentation/kbuild/kconfig-language.txt
@@ -430,6 +430,12 @@ This sets the config program's title bar
 to use it. It should be placed at the top of the configuration, before any
 other statement.
 
+'#' Kconfig source file comment:
+
+An unquoted '#' character anywhere in a source file line indicates
+the beginning of a source file comment.  The remainder of that line
+is a comment.
+
 
 Kconfig hints
 -------------


