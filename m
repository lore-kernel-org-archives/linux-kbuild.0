Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eastrmmtai113.cox.net ([68.230.240.32]:55499 "EHLO
	eastrmmtai113.cox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753901AbYL1DyF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Dec 2008 22:54:05 -0500
Message-ID: <4956F21A.108@ou.edu>
Date: Sat, 27 Dec 2008 21:27:22 -0600
From: Steve Kenton <skenton@ou.edu>
Reply-To: skenton@ou.edu
MIME-Version: 1.0
Subject: Can this type-punned warning be silenced by using a union instead
 of a cast?
Content-Type: multipart/mixed;
 boundary="------------070106080402070509030404"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux-Kbuild <linux-kbuild@vger.kernel.org>

This is a multi-part message in MIME format.
--------------070106080402070509030404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Can this type-punned warning be silenced by using a union instead of a cast?
 
HOSTCC  scripts/basic/fixdep
scripts/basic/fixdep.c: In function 'traps':
scripts/basic/fixdep.c:377: warning: dereferencing type-punned pointer 
will break strict-aliasing rules

Something like the attached? As far as I can tell the union should take care of the alignment and make the __attribute__ unnecessary, in which case it does not need to be static either. Compiled with gcc 4.4 cross compiler for i386 successfully but not boot tested.

Steve Kenton



--------------070106080402070509030404
Content-Type: text/plain;
 name="fixdep.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fixdep.c.patch"

--- linux-2.6/scripts/basic/fixdep.c.orig	2008-12-27 20:54:32.234375000 -0600
+++ linux-2.6/scripts/basic/fixdep.c	2008-12-27 21:03:00.140625000 -0600
@@ -372,11 +372,11 @@ void print_deps(void)
 
 void traps(void)
 {
-	static char test[] __attribute__((aligned(sizeof(int)))) = "CONF";
+	union { int i; char c[4]; } test = { .c = "CONF" };
 
-	if (*(int *)test != INT_CONF) {
+	if (test.i != INT_CONF) {
 		fprintf(stderr, "fixdep: sizeof(int) != 4 or wrong endianess? %#x\n",
-			*(int *)test);
+			test.i);
 		exit(2);
 	}
 }

--------------070106080402070509030404--

