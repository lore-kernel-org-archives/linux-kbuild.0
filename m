Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53077 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388292AbfKEPI2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 10:08:28 -0500
From: Alyssa Ross <hi@alyssa.is>
Subject: [PATCH v3] kconfig: be more helpful if pkg-config is missing
Date: Tue,  5 Nov 2019 15:07:36 +0000
Message-Id: <20191105150735.17200-1-hi@alyssa.is>
In-Reply-To: <20191105150415.13098-1-hi@alyssa.is>
References: <20191105150415.13098-1-hi@alyssa.is>
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
Apologies -- was a little too hasty in sending v2, and it only
included the updated message in one of the two files that needed to be
changed.

 scripts/kconfig/mconf-cfg.sh | 3 +++
 scripts/kconfig/nconf-cfg.sh | 3 +++
 2 files changed, 6 insertions(+)

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
index 001559ef0a60..c212255070c0 100755
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
 echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
 echo >&2 "* depending on your distribution)."
 echo >&2 "*"
+echo >&2 "* You may also need to install pkg-config to find the"
+echo >&2 "* ncurses installed in a non-default location."
+echo >&2 "*"
 exit 1
-- 
2.23.0
