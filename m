Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:49304 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbaDLMxW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Apr 2014 08:53:22 -0400
Received: by mail-lb0-f172.google.com with SMTP id c11so4347278lbj.17
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Apr 2014 05:53:20 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH v2 1/1] builddeb: add arm64 in the supported architectures
Date: Sat, 12 Apr 2014 15:53:06 +0300
Message-Id: <1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
In-Reply-To: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..0bf29a6 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -42,6 +42,8 @@ create_package() {
 		debarch=hppa ;;
 	mips*)
 		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
+	arm64)
+		debarch=arm64 ;;
 	arm*)
 		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
 	*)
-- 
1.9.1

