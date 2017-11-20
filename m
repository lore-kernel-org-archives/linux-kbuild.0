Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60364 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751253AbdKTWjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 17:39:47 -0500
From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 1/2] Documentation/kbuild: Add guidance for the use of default
Date: Mon, 20 Nov 2017 14:39:33 -0800
Message-Id: <575ec3811e20371ab691cfb9611c31be48e5cc90.1511217248.git.dvhart@infradead.org>
In-Reply-To: <cover.1511217248.git.dvhart@infradead.org>
References: <cover.1511217248.git.dvhart@infradead.org>
In-Reply-To: <cover.1511217248.git.dvhart@infradead.org>
References: <cover.1511217248.git.dvhart@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Darren Hart (VMware)" <dvhart@infradead.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Document the preference [1] for new CONFIG options to "default n" (or
not use default at all) in order to minimizes changes to the config,
especially to avoid "make oldconfig" growing unnecessarily from release
to release.

Document the exceptions where it is acceptable to use "default y/m" for
new CONFIG options.

1. https://lkml.org/lkml/2017/11/18/257

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 Documentation/kbuild/kconfig-language.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 262722d..688e41e 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -77,6 +77,27 @@ applicable everywhere (see syntax).
   Optionally, dependencies only for this default value can be added with
   "if".
 
+ The default value deliberately defaults to 'n' in order to avoid bloating the
+ build. With few exceptions, new config options should not change this. The
+ intent is for "make oldconfig" to add as little as possible to the config from
+ release to release.
+
+ Note:
+	Things that merit "default y/m" include:
+
+	a) A new Kconfig option for something that used to always be built
+	   should be "default y".
+
+	b) A new gatekeeping Kconfig option that hides/shows other Kconfig
+	   options (but does not generate any code of its own), should be
+	   "default y" so people will see those other options.
+
+	c) Sub-driver behavior or similar options for a driver that is
+	   "default n". This allows you to provide sane defaults.
+
+	d) Hardware or infrastructure that everybody expects, such as CONFIG_NET
+	   or CONFIG_BLOCK. These are rare exceptions.
+
 - type definition + default value:
 	"def_bool"/"def_tristate" <expr> ["if" <expr>]
   This is a shorthand notation for a type definition plus a value.
-- 
2.9.4

