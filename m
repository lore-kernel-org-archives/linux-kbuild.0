Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kapsi.fi ([217.30.184.167]:39342 "EHLO mail.kapsi.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752254AbaIAG0a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Sep 2014 02:26:30 -0400
From: Mikko Rapeli <mikko.rapeli@iki.fi>
Subject: [RFC PATCH v2 02/27] scripts/headers.sh: add verbose option to make calls if defined
Date: Mon,  1 Sep 2014 09:25:53 +0300
Message-Id: <1409552778-2537-3-git-send-email-mikko.rapeli@iki.fi>
In-Reply-To: <1409552778-2537-1-git-send-email-mikko.rapeli@iki.fi>
References: <1408660449-4011-1-git-send-email-mikko.rapeli@iki.fi>
 <1409552778-2537-1-git-send-email-mikko.rapeli@iki.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, mikko.rapeli@iki.fi

Useful when debugging the scripts.

Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
---
 scripts/headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/headers.sh b/scripts/headers.sh
index 978b42b..09e8a5c 100755
--- a/scripts/headers.sh
+++ b/scripts/headers.sh
@@ -7,7 +7,7 @@ set -e
 do_command()
 {
 	if [ -f ${srctree}/arch/$2/include/asm/Kbuild ]; then
-		make ARCH=$2 KBUILD_HEADERS=$1 headers_$1
+		make V=$KBUILD_VERBOSE ARCH=$2 KBUILD_HEADERS=$1 headers_$1
 	else
 		printf "Ignoring arch: %s\n" ${arch}
 	fi
-- 
2.1.0

