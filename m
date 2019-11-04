Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47545 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728392AbfKDUrm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 15:47:42 -0500
From: Alyssa Ross <hi@alyssa.is>
Subject: [PATCH] kconfig: be more helpful if pkg-config is missing
Date: Mon,  4 Nov 2019 20:44:54 +0000
Message-Id: <20191104204453.20115-1-hi@alyssa.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>

If ncurses is installed, but at a non-default location, the previous
error message was not helpful in resolving the situation.  Now, if
ncurses can't be found, and pkg-config is not installed, it will
suggest that pkg-config might need to be installed in addition to
ncurses.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 scripts/kconfig/mconf-cfg.sh | 14 ++++++++++++--
 scripts/kconfig/nconf-cfg.sh | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index c812872d7f9d..f547b13f77f6 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -41,7 +41,17 @@ fi
 
 echo >&2 "*"
 echo >&2 "* Unable to find the ncurses package."
-echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
-echo >&2 "* depending on your distribution)."
+echo >&2 "*"
+if [ -n "$(command -v pkg-config)" ]; then
+	echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+else
+	echo >&2 "* You may need to install ncurses"
+	echo >&2 "* (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+	echo >&2 "*"
+	echo >&2 "* If you have ncurses installed,"
+	echo >&2 "* you may also need to install pkg-config."
+fi
 echo >&2 "*"
 exit 1
diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
index 001559ef0a60..569226f1b497 100755
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -41,7 +41,17 @@ fi
 
 echo >&2 "*"
 echo >&2 "* Unable to find the ncurses package."
-echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
-echo >&2 "* depending on your distribution)."
+echo >&2 "*"
+if [ -n "$(command -v pkg-config)" ]; then
+	echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+else
+	echo >&2 "* You may need to install ncurses"
+	echo >&2 "* (ncurses-devel or libncurses-dev"
+	echo >&2 "* depending on your distribution)."
+	echo >&2 "*"
+	echo >&2 "* If you have ncurses installed,"
+	echo >&2 "* you may also need to install pkg-config."
+fi
 echo >&2 "*"
 exit 1
-- 
2.23.0
