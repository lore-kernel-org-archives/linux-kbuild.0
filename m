Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B635C6FD1D
	for <linux-kbuild@archiver.kernel.org>; Tue, 14 Mar 2023 00:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjCNAn7 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 13 Mar 2023 20:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjCNAn5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2023 20:43:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1D885A53;
        Mon, 13 Mar 2023 17:43:36 -0700 (PDT)
From:   Bastian Germann <bage@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1678754582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/z3vaQ8GUvb78pXKGjdT6XJOHYKwTBbiZILJSNZF6zA=;
        b=tFN8r9tXr9Gxg2euGaFYaa+Z1R8IjHrxBetKJXZ3MA7jVnBBhUX62JdcexfK1wSb85A7+D
        yIOLP69E3k18pQC+FbMTSU4eTj6oS7dR8vigpA5/L51OPBrnIwGXRwyp+nyMG80zBNsrcw
        jNVWITgdIax/S8ZKsCtHYLOBKiNyfSGJ1Mz6EOiu0rxo5nY3Qp5Gp8IfXGVDjFkkF/taeq
        QvK///pWcBGyUnXNM/gMxbN8sQl44ehdD0HhoUKM7+Thmn1usXi5YFq7Wl3kHyor72/7Su
        Ela4QDXNoF5PmVPnSPtaUZy8oWKeS4XqtiGZzX1lOkKFdPuaniXR3x75Ny3X4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1678754582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/z3vaQ8GUvb78pXKGjdT6XJOHYKwTBbiZILJSNZF6zA=;
        b=g4qHge7jzfrNGv6Drf4ZCnVe+frSJVRoRKsANIolBaWhENVQqUMY9o35RjdF/Rim508ogL
        RErJ3PMqlVASLTCw==
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bastian Germann <bage@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] builddeb: Eliminate debian/arch use
Date:   Tue, 14 Mar 2023 01:40:22 +0100
Message-Id: <20230314004022.403937-2-bage@linutronix.de>
In-Reply-To: <20230314004022.403937-1-bage@linutronix.de>
References: <20230314004022.403937-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In the builddeb context, the DEB_HOST_ARCH environment variable is set to
the same value as debian/arch's content, so use the variable with
dpkg-architecture.

This is the last use of the debian/arch file during dpkg-buildpackage time.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ff5e7d8e380b..ef43e8937f25 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -99,7 +99,7 @@ deploy_libc_headers () {
 
 	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
 	# used by Debian-based distros (to support multi-arch)
-	host_arch=$(dpkg-architecture -a$(cat debian/arch) -qDEB_HOST_MULTIARCH)
+	host_arch=$(dpkg-architecture -a$DEB_HOST_ARCH -qDEB_HOST_MULTIARCH)
 	mkdir $pdir/usr/include/$host_arch
 	mv $pdir/usr/include/asm $pdir/usr/include/$host_arch/
 }
-- 
2.39.2

