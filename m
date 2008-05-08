Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out04.alice-dsl.net ([88.44.63.6]:46586 "EHLO
	smtp-out04.alice-dsl.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbYEHLlO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 May 2008 07:41:14 -0400
Date: Thu, 8 May 2008 13:41:11 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Disable modpost warnings for linkonce sections
Message-ID: <20080508114111.GA20671@basil.nowhere.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Disable modpost warnings for linkonce sections

My build gives lots of warnings like

WARNING: sound/core/snd.o (.gnu.linkonce.wi.mpspec_def.h.30779716): unexpected section name.
The (.[number]+) following section name are ld generated and not expected.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

But for .linkonce. duplicated sections are actually ok and expected.
So just disable the warning for this case.

Signed-off-by: Andi Kleen <ak@linux.intel.com>

Index: linux/scripts/mod/modpost.c
===================================================================
--- linux.orig/scripts/mod/modpost.c
+++ linux/scripts/mod/modpost.c
@@ -721,7 +721,7 @@ static int check_section(const char *mod
 		/* consume all digits */
 		while (*e && e != sec && isdigit(*e))
 			e--;
-		if (*e == '.') {
+		if (*e == '.' && !strstr(sec, ".linkonce")) {
 			warn("%s (%s): unexpected section name.\n"
 			     "The (.[number]+) following section name are "
 			     "ld generated and not expected.\n"
