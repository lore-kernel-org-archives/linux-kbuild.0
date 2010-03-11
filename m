Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42297 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758249Ab0CKWFd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Mar 2010 17:05:33 -0500
Message-Id: <201003112205.o2BM5FpL013289@imap1.linux-foundation.org>
Subject: [patch 2/2] headerdep: perlcritic warning
From: akpm@linux-foundation.org
Date: Thu, 11 Mar 2010 14:05:15 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, shemminger@vyatta.com, amwang@redhat.com

From: Stephen Hemminger <shemminger@vyatta.com>

Minor perlcritic warning:
headerdep.pl: "return" statement with explicit "undef" at line 84, column 2.  See page 199 of PBP.  (Severity: 5)

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
Acked-by: WANG Cong <amwang@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/headerdep.pl |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -puN scripts/headerdep.pl~headerdep-perlcritic-warning scripts/headerdep.pl
--- a/scripts/headerdep.pl~headerdep-perlcritic-warning
+++ a/scripts/headerdep.pl
@@ -80,8 +80,7 @@ sub search {
 		my $path = "$i/$filename";
 		return $path if -f $path;
 	}
-
-	return undef;
+	# not found returns undefined
 }
 
 sub parse_all {
_
