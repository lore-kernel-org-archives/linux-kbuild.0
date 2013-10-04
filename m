Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:53462 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754447Ab3JDKcD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Oct 2013 06:32:03 -0400
Received: by mail-la0-f46.google.com with SMTP id eh20so3047737lab.33
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Oct 2013 03:32:01 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH 1/1] builddeb: add arm64 in the supported architectures
Date: Fri,  4 Oct 2013 13:31:51 +0300
Message-Id: <1380882711-31929-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, Fathi Boudra <fathi.boudra@linaro.org>

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 90e521f..f76be3a 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,7 +43,11 @@ create_package() {
 	mips*)
 		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el) ;;
 	arm*)
-		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el) ;;
+		if grep -q '^CONFIG_ARM64=y' $KCONFIG_CONFIG ; then
+			debarch=arm64
+		else
+			debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el)
+		fi ;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
-- 
1.8.1.2

