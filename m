Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:37910 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbeGSG17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Jul 2018 02:27:59 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: fix typos in description of "choice" in
 kconfig-language.txt
Message-ID: <ff6eeb9d-a7de-0bc3-05ef-53bb1286347f@infradead.org>
Date: Wed, 18 Jul 2018 22:46:36 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix a couple of punctuation "typos" in the description of the
"choice" keyword.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/kbuild/kconfig-language.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20180717.orig/Documentation/kbuild/kconfig-language.txt
+++ linux-next-20180717/Documentation/kbuild/kconfig-language.txt
@@ -370,7 +370,7 @@ choices:
 
 This defines a choice group and accepts any of the above attributes as
 options. A choice can only be of type bool or tristate.  If no type is
-specified for a choice, it's type will be determined by the type of
+specified for a choice, its type will be determined by the type of
 the first choice element in the group or remain unknown if none of the
 choice elements have a type specified, as well.
 
@@ -384,7 +384,7 @@ A choice accepts another option "optiona
 choice to 'n' and no entry needs to be selected.
 If no [symbol] is associated with a choice, then you can not have multiple
 definitions of that choice. If a [symbol] is associated to the choice,
-then you may define the same choice (ie. with the same entries) in another
+then you may define the same choice (i.e. with the same entries) in another
 place.
 
 comment:


