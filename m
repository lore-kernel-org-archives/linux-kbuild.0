Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:48434 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYDP1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 23:15:27 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: remove unused variable in qconf.cc
Date: Wed, 25 Mar 2020 12:14:31 +0900
Message-Id: <20200325031433.28223-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, kernel-hardening@lists.openwall.com, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

If this file were compiled with -Wall, the following warning would be
reported:

scripts/kconfig/qconf.cc:312:6: warning: unused variable ‘i’ [-Wunused-variable]
  int i;
      ^

The commit prepares to turn on -Wall for C++ host programs.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 82773cc35d35..50a5245d87bb 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -309,8 +309,6 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
-	int i;
-
 	setObjectName(name);
 	setSortingEnabled(false);
 	setRootIsDecorated(true);
-- 
2.17.1
