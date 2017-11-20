Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40856 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751483AbdKTWjt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 17:39:49 -0500
From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 2/2] Documentation/process: Add CONFIG default value to submit-checklist
Date: Mon, 20 Nov 2017 14:39:34 -0800
Message-Id: <359bf77e70babec97628725ca98cffe1b0ac6792.1511217248.git.dvhart@infradead.org>
In-Reply-To: <cover.1511217248.git.dvhart@infradead.org>
References: <cover.1511217248.git.dvhart@infradead.org>
In-Reply-To: <cover.1511217248.git.dvhart@infradead.org>
References: <cover.1511217248.git.dvhart@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Darren Hart (VMware)" <dvhart@infradead.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Add default value review to the submit checklist, referring to the
preference for "default n" from the previous patch added to
Documentation/kbuild/kconfig-language.txt.

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 Documentation/process/submit-checklist.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index a0d9d34..7d04ab3 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -37,7 +37,9 @@ and elsewhere regarding submitting Linux kernel patches.
    You should be able to justify all violations that remain in
    your patch.
 
-6) Any new or modified ``CONFIG`` options don't muck up the config menu.
+6) Any new or modified ``CONFIG`` options do not muck up the config menu and
+  default to off unless they meet the exception criteria documented in
+  ``Documentation/kbuild/kconfig-language.txt`` Menu attributes: default value.
 
 7) All new ``Kconfig`` options have help text.
 
-- 
2.9.4

