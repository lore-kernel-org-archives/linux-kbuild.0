Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F36C433E6
	for <linux-kbuild@archiver.kernel.org>; Thu, 14 Jan 2021 10:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 451D823A21
	for <linux-kbuild@archiver.kernel.org>; Thu, 14 Jan 2021 10:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbhANKEw (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 14 Jan 2021 05:04:52 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:52347 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727967AbhANKEv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 05:04:51 -0500
Received: from orion.localdomain ([77.7.60.217]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M890H-1l5CG21qU7-005J2c; Thu, 14 Jan 2021 11:02:17 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH] scripts: kconfig: fix HOSTCC call
Date:   Thu, 14 Jan 2021 11:02:16 +0100
Message-Id: <20210114100216.11787-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:zyRntTR6dFuP5Dlqeu+Eum7UbFZqUcolGG82TrgQ1Lf5Qin1+KT
 HuKJIwrCox9uQTJboBuyzeS++E/8tXsd5zj8Ijq6rT41mT/cAKM9rniD5qfUYTF2y0OQWrA
 vMagJdGi53z8fKCiecLddGnfYo3kEjYJEf7ifpRmmzARGA6BxvQS2YBLbJRInD3Tqqo/WkC
 HF/ZfSzeh6uaJDVbHZKpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvOOqGw/OEM=:hZLqjEeVuURVsGUe2fUwgO
 GfEOoTGEJp/ZtMApCVk6klnff67KT0fkv3n3U9yeITLch9aqMkXsxNW9xipL/ynMNyjv98QOL
 YKi8QxKiOOA1v05MzmxeUNUjyKRZnVyuHjIU9JXDxbk5q/0L32nEdORUsLfIQGc7Xw75DFb9y
 IrOUu/kzWwnmG5RxIAMRqY3lctOzF/lRm6O/d1X2nCKTSZFPQnFHYz9b/aXFyGMt3rrM44BZg
 inAvi/QTJs3JuaY9RL8ICVtUKwgteE2sPv02h56K8UYdjDmzPHfe1sUCRM8vyFf8LCiEEpa5j
 luFPi4vWQ/j3rqX7wQ9foDhvAQvz736+ypduhQt2D28quuxrTClypMcdOXx8NCAw5Ypb/7iQt
 9NHS+VLQBA8Afx60XolZGY1s/8Y1i1vDhB/c7hQ0JU9tnn67T/76Qt3VOcDZs
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The change c0f975af1745391749e4306aa8081b9a4d2cced8 introduces a bug when
HOSTCC contains parameters: the whole command line is treated as the program
name (with spaces in it). Therefore, we have to remove the quotes.

Fixes: c0f975af1745391749e4306aa8081b9a4d2cced8
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/kconfig/mconf-cfg.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index fcd4acd4e9cb..40fa449ed049 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -35,7 +35,7 @@ fi
 
 # As a final fallback before giving up, check if $HOSTCC knows of a default
 # ncurses installation (e.g. from a vendor-specific sysroot).
-if echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1; then
+if echo '#include <ncurses.h>' | ${HOSTCC} -E - >/dev/null ; then
 	echo cflags=\"-D_GNU_SOURCE\"
 	echo libs=\"-lncurses\"
 	exit 0
-- 
2.11.0

