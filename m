Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33295 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750938Ab1CSE0P convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Mar 2011 00:26:15 -0400
From: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Date: Sat, 19 Mar 2011 04:26:10 +0000
Message-ID: <1300508770.26693.73.camel@localhost>
Mime-Version: 1.0
Subject: [PATCH] kconfig: Avoid buffer underrun in choice input
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org

commit 40aee729b350672c2550640622416a855e27938f ('kconfig: fix default
value for choice input') fixed some cases where kconfig would select
the wrong option from a choice with a single valid option and thus
enter an infinite loop.

However, this broke the test for user input of the form 'N?', because
when kconfig selects the single valid option the input is zero-length
and the test will read the byte before the input buffer.  If this
happens to contain '?' (as it will in a mips build on Debian unstable
today) then kconfig again enters an infinite loop.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Cc: stable@kernel.org [2.6.17+]
---
 scripts/kconfig/conf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 659326c..006ad81 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -332,7 +332,7 @@ static int conf_choice(struct menu *menu)
 		}
 		if (!child)
 			continue;
-		if (line[strlen(line) - 1] == '?') {
+		if (line[0] && line[strlen(line) - 1] == '?') {
 			print_help(child);
 			continue;
 		}
-- 
1.7.4.1


