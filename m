Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D986FC43334
	for <linux-kbuild@archiver.kernel.org>; Tue,  7 Jun 2022 15:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbiFGPUJ (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 7 Jun 2022 11:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiFGPUG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jun 2022 11:20:06 -0400
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727FF66ADE;
        Tue,  7 Jun 2022 08:20:05 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 257FIhb0015394;
        Wed, 8 Jun 2022 00:18:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 257FIhb0015394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1654615124;
        bh=LIQRolKJUy5EgtlTCuYPI57ux74QTIvAUnxIqYWqrlc=;
        h=From:To:Cc:Subject:Date:From;
        b=CaLs/kJ01/rgCoCm8BVFkd73Mc6d4vewxfkABOPm6hyicQVsd3ke2P1wGZCPm7f22
         Me1tksnhDPZprP3M5P6ATB8HbiO3LBwsje7N3NecSpjtNHucl1d5+ntZesivQ9l9pN
         Xp4kA2B6I79IBo2uGYQIe3Ez50/GhLBhIvFaEonaO6m2eIxorRl+FHrsAWlwkExR80
         Q88dk2b1+3KzdpG+mt4lrp3vBofWNaUyssqvkNsCvMkTY4U+3BWERcN86Ab8Z5LD7R
         tYPc7LMsX/XRduLrR6MnvI1IeLsUPFMqu8VDfO1N8YjlJo9SOR7dKQsDjoyhABFIdD
         75+iEOsQFPgHw==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/nsdeps: adjust to the format change of *.mod files
Date:   Wed,  8 Jun 2022 00:18:40 +0900
Message-Id: <20220607151840.437500-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 22f26f21774f ("kbuild: get rid of duplication in *.mod files")
changed the format of *.mod files to put one object per line, but missed
to adjust scripts/nsdeps.

Fixes: 22f26f21774f ("kbuild: get rid of duplication in *.mod files")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/nsdeps | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index 04c4b96e95ec..f1718cc0d700 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -34,9 +34,8 @@ generate_deps() {
 	local mod=${1%.ko:}
 	shift
 	local namespaces="$*"
-	local mod_source_files="`cat $mod.mod | sed -n 1p                      \
-					      | sed -e 's/\.o/\.c/g'           \
-					      | sed "s|[^ ]* *|${src_prefix}&|g"`"
+	local mod_source_files=$(sed "s|^\(.*\)\.o$|${src_prefix}\1.c|" $mod.mod)
+
 	for ns in $namespaces; do
 		echo "Adding namespace $ns to module $mod.ko."
 		generate_deps_for_ns $ns "$mod_source_files"
-- 
2.32.0

