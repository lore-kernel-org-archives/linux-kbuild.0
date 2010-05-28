Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:38773 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1756959Ab0E1IZC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 May 2010 04:25:02 -0400
From: Toralf Foerster <toralf.foerster@gmx.de>
Subject: [PATCH] streamline_config.pl: make a variable local
Date: Fri, 28 May 2010 10:24:59 +0200
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201005281025.00358.toralf.foerster@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

to prevent a possible pitfall

Signed-off-by: Toralf Foerster <toralf.foerster@gmx.de>
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
-       @arr = @{$objects{$module}};
+       my @arr = @{$objects{$module}};
        foreach my $conf (@arr) {
            $configs{$conf} = $module;
        }
-- 
1.6.4.4


-- 
MfG/Sincerely
Toralf Foerster

pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

