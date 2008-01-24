Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37476 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757210AbYAXWEA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:00 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 34/77] kconfig: add hints/tips/tricks to Documentation/kbuild/kconfig-language.txt
Date: Thu, 24 Jan 2008 23:03:15 +0100
Message-Id: <1201212238-4369-34-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Add a section on kconfig hints: how to do <something> in Kconfig files.

Fix a few typos/spellos.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/kbuild/kconfig-language.txt |   54 +++++++++++++++++++++++++---
 1 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 616043a..53ca12f 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -24,7 +24,7 @@ visible if its parent entry is also visible.
 Menu entries
 ------------
 
-Most entries define a config option, all other entries help to organize
+Most entries define a config option; all other entries help to organize
 them. A single configuration option is defined like this:
 
 config MODVERSIONS
@@ -50,7 +50,7 @@ applicable everywhere (see syntax).
 
 - type definition: "bool"/"tristate"/"string"/"hex"/"int"
   Every config option must have a type. There are only two basic types:
-  tristate and string, the other types are based on these two. The type
+  tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
   are equivalent:
 
@@ -108,7 +108,7 @@ applicable everywhere (see syntax).
 	equal to 'y' without visiting the dependencies. So abusing
 	select you are able to select a symbol FOO even if FOO depends
 	on BAR that is not set. In general use select only for
-	non-visible symbols (no promts anywhere) and for symbols with
+	non-visible symbols (no prompts anywhere) and for symbols with
 	no dependencies. That will limit the usefulness but on the
 	other hand avoid the illegal configurations all over. kconfig
 	should one day warn about such things.
@@ -162,9 +162,9 @@ An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
 respectively for calculations). A menu entry becomes visible when it's
 expression evaluates to 'm' or 'y'.
 
-There are two types of symbols: constant and nonconstant symbols.
-Nonconstant symbols are the most common ones and are defined with the
-'config' statement. Nonconstant symbols consist entirely of alphanumeric
+There are two types of symbols: constant and non-constant symbols.
+Non-constant symbols are the most common ones and are defined with the
+'config' statement. Non-constant symbols consist entirely of alphanumeric
 characters or underscores.
 Constant symbols are only part of expressions. Constant symbols are
 always surrounded by single or double quotes. Within the quote, any
@@ -301,3 +301,45 @@ mainmenu:
 
 This sets the config program's title bar if the config program chooses
 to use it.
+
+
+Kconfig hints
+-------------
+This is a collection of Kconfig tips, most of which aren't obvious at
+first glance and most of which have become idioms in several Kconfig
+files.
+
+Build as module only
+~~~~~~~~~~~~~~~~~~~~
+To restrict a component build to module-only, qualify its config symbol
+with "depends on m".  E.g.:
+
+config FOO
+	depends on BAR && m
+
+limits FOO to module (=m) or disabled (=n).
+
+
+Build limited by a third config symbol which may be =y or =m
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+A common idiom that we see (and sometimes have problems with) is this:
+
+When option C in B (module or subsystem) uses interfaces from A (module
+or subsystem), and both A and B are tristate (could be =y or =m if they
+were independent of each other, but they aren't), then we need to limit
+C such that it cannot be built statically if A is built as a loadable
+module.  (C already depends on B, so there is no dependency issue to
+take care of here.)
+
+If A is linked statically into the kernel image, C can be built
+statically or as loadable module(s).  However, if A is built as loadable
+module(s), then C must be restricted to loadable module(s) also.  This
+can be expressed in kconfig language as:
+
+config C
+	depends on A = y || A = B
+
+or for real examples, use this command in a kernel tree:
+
+$ find . -name Kconfig\* | xargs grep -ns "depends on.*=.*||.*=" | grep -v orig
+
-- 
1.5.4.rc3.14.g44397

