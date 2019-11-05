Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40929 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731090AbfKEPFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 10:05:01 -0500
From: Alyssa Ross <hi@alyssa.is>
Subject: [PATCH v2] kconfig: be more helpful if pkg-config is missing
Date: Tue,  5 Nov 2019 15:04:15 +0000
Message-Id: <20191105150415.13098-1-hi@alyssa.is>
In-Reply-To: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
References: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alyssa Ross <hi@alyssa.is>

If ncurses is installed, but at a non-default location, the previous
error message was not helpful in resolving the situation.  Now it will
suggest that pkg-config might need to be installed in addition to
ncurses.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 scripts/kconfig/mconf-cfg.sh |  3 +++
 scripts/kconfig/nconf-cfg.sh | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index c812872d7f9d..aa68ec95620d 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
 echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
 echo >&2 "* depending on your distribution)."
 echo >&2 "*"
+echo >&2 "* You may also need to install pkg-config to find the"
+echo >&2 "* ncurses installed in a non-default location."
+echo >&2 "*"
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
