Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29153 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFQDDJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 23:03:09 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over '---help---'"
Date: Wed, 17 Jun 2020 12:02:20 +0900
Message-Id: <20200617030220.34733-2-masahiroy@kernel.org>
In-Reply-To: <20200617030220.34733-1-masahiroy@kernel.org>
References: <20200617030220.34733-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org

This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.

The conversion is done.

Cc: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkpatch.pl | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4c820607540b..1351e052eb99 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3042,11 +3042,7 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
-					if ($lines[$ln - 1] =~ "---help---") {
-						WARN("CONFIG_DESCRIPTION",
-						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
-					}
+				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:---)?help(?:---)?$/) {
 					$length = -1;
 				}
 
-- 
2.25.1
