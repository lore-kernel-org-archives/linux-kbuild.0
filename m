Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:40455 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758332Ab0E1Orv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 May 2010 10:47:51 -0400
Message-Id: <20100528144749.072671097@goodmis.org>
Date: Fri, 28 May 2010 10:43:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/3] [PATCH 1/3] kconfig: Make a variable local in streamline_config.pl
References: <20100528144323.232583082@goodmis.org>
Content-Disposition: inline; filename=0001-kconfig-Make-a-variable-local-in-streamline_config.p.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, Toralf Foerster <toralf.foerster@gmx.de>

From: Toralf Foerster <toralf.foerster@gmx.de>

Proper perl requires that local variables should be declared with 'my',
otherwise this may produce errors.

Signed-off-by: Toralf Foerster <toralf.foerster@gmx.de>
LKML-Reference: <201005281025.00358.toralf.foerster@gmx.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index afbd54a..9726946 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -307,7 +307,7 @@ close (LIN);
 my %configs;
 foreach my $module (keys(%modules)) {
     if (defined($objects{$module})) {
-	@arr = @{$objects{$module}};
+	my @arr = @{$objects{$module}};
 	foreach my $conf (@arr) {
 	    $configs{$conf} = $module;
 	}
-- 
1.7.0


