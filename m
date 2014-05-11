Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:64714 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751232AbaEKFCy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 May 2014 01:02:54 -0400
Date: 11 May 2014 01:02:52 -0400
Message-ID: <20140511050252.19596.qmail@ns.horizon.com>
From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH] Documentation/kbuild/makefiles.txt: Improve description of lib-* targets
In-Reply-To: <536EFC71.3070209@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr
Cc: linux@horizon.com, rdunlap@infradead.org

I had to ask on the mailing list, so save developers the bother of
answering the question again.  (Wanna-be kernel developers might also
be helped, but who cares about them?)

Signed-off-by: George Spelvin <linux@horizon.com>
---
As with most documentation patches, this is also an exercise in eliciting
corrections by proposing a wrong answer which will be jumped on.

 Documentation/kbuild/makefiles.txt | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d567a7cc55..f6cc266163 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -237,10 +237,29 @@ more details, with real examples.
 	be included in a library, lib.a.
 	All objects listed with lib-y are combined in a single
 	library for that directory.
+
+	The entire kernel is then linked against these libraries,
+	so the linker will include the code in the final kernel only
+	if it is referenced somewhere.  Thus, lib-* goals may be
+	designed with false positives.
+
 	Objects that are listed in obj-y and additionally listed in
 	lib-y will not be included in the library, since they will
 	be accessible anyway.
-	For consistency, objects listed in lib-m will be included in lib.a.
+
+	For consistency, objects listed in lib-m will be included
+	in lib.a, but this will probably not do what you want.	If a
+	function in lib.a is referenced only from a module, and not from
+	the main kernel image, the linker will not incorporate it into
+	the kernel image and later attempts to load the module will fail.
+
+	One solution to this issue are to declare the object boolean
+	and link it into the kernel with obj-y if it's depended on by
+	a module.  The object's code will be included in the main kernel
+	but unused until the module is loaded.
+
+	The other is to make the object a module itself, and use an
+	obj-m goal.  Many helper modules in lib are used this way.
 
 	Note that the same kbuild makefile may list files to be built-in
 	and to be part of a library. Therefore the same directory
@@ -252,7 +271,7 @@ more details, with real examples.
 
 	This will create a library lib.a based on delay.o. For kbuild to
 	actually recognize that there is a lib.a being built, the directory
-	shall be listed in libs-y.
+	must be listed in libs-y in its parent makefile.
 	See also "6.4 List directories to visit when descending".
 
 	Use of lib-y is normally restricted to lib/ and arch/*/lib.
-- 
1.9.2

