Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43959 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752800AbaBGSQG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Feb 2014 13:16:06 -0500
From: Jan Moskyto Matejka <mq@suse.cz>
Subject: [PATCH] Modpost: fixed USB alias generation for ranges including 0x9 and 0xA
Date: Fri,  7 Feb 2014 19:15:11 +0100
Message-Id: <1391796911-23456-1-git-send-email-mq@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jan Moskyto Matejka <mq@suse.cz>, linux-kbuild@vger.kernel.org, Nathaniel McCallum <nathaniel@natemccallum.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

Commit afe2dab4f6 ("USB: add hex/bcd detection to usb modalias generation")
changed the routine that generates alias ranges. Before that change, only
digits 0-9 were supported; the commit tried to fix the case when the range
includes higher values than 0x9.

Unfortunately, the commit didn't fix the case when the range includes both
0x9 and 0xA, meaning that the final range must look like [x-9A-y] where
x <= 0x9 and y >= 0xA -- instead the [x-9A-x] range was produced.

Modprobe doesn't complain as it sees no difference between no-match and
bad-pattern results of fnmatch().

Fixing this simple bug to fix the aliases.
Also changing the hardcoded beginning of the range to uppercase as all the
other letters are also uppercase in the device version numbers.

Fortunately, this affects only the dvb-usb-dib0700 module, AFAIK.

Signed-off-by: Jan Moskyto Matejka <mq@suse.cz>
---
 scripts/mod/file2alias.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2370863..25e5cb0 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -210,8 +210,8 @@ static void do_usb_entry(void *symval,
 				range_lo < 0x9 ? "[%X-9" : "[%X",
 				range_lo);
 			sprintf(alias + strlen(alias),
-				range_hi > 0xA ? "a-%X]" : "%X]",
-				range_lo);
+				range_hi > 0xA ? "A-%X]" : "%X]",
+				range_hi);
 		}
 	}
 	if (bcdDevice_initial_digits < (sizeof(bcdDevice_lo) * 2 - 1))
-- 
1.8.4.5

