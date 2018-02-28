Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:45778 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934720AbeB1QO4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 11:14:56 -0500
From: Arvind Prasanna <arvindprasanna@gmail.com>
Subject: [PATCH v2] Documentation: Update ncurses package names for menuconfig
Date: Wed, 28 Feb 2018 11:14:40 -0500
Message-Id: <1519834482-1756-1-git-send-email-arvindprasanna@gmail.com>
In-Reply-To: <CAK7LNATafNCOBMsNezrCT8j_N2kJiLt7S063wRtjGsaJTgxLvA@mail.gmail.com>
References: <CAK7LNATafNCOBMsNezrCT8j_N2kJiLt7S063wRtjGsaJTgxLvA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: yamada.masahiro@socionext.com, Arvind Prasanna <arvindprasanna@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The package name is ncurses-devel for Redhat based distros
and libncurses-devel for Debian based distros.

Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
---

Changes in v2:
- Add a missing echo as pointed out by one of the reviewers.

 scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index a10bd9d..6c0bcd9 100755
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -55,7 +55,8 @@ EOF
 	    echo " *** required header files."                            1>&2
 	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
 	    echo " *** "                                                  1>&2
-	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** Install ncurses (ncurses-devel or libncurses-dev " 1>&2
+	    echo " *** depending on your distribution) and try again."    1>&2
 	    echo " *** "                                                  1>&2
 	    exit 1
 	fi
-- 
2.7.4

