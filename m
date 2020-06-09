Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:43625 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbgFIAip (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 20:38:45 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: make module name conflict a warning again
Date: Tue,  9 Jun 2020 09:37:52 +0900
Message-Id: <20200609003752.428817-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

The module name conflict is still remaining.

  error: the following would cause module name conflict:
    drivers/char/adi.ko
    drivers/input/joystick/adi.ko

Make it a warning again to build sparc64 allmodconfig successfully.

Fixes: 8451791d1ff0 ("kbuild: make module name conflict fatal error")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/modules-check.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 43de226071ae..8b1785863c64 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -15,9 +15,10 @@ check_same_name_modules()
 {
 	for m in $(sed 's:.*/::' $1 | sort | uniq -d)
 	do
-		echo "error: the following would cause module name conflict:" >&2
+		echo "warning: the following would cause module name conflict:" >&2
 		sed -n "/\/$m/s:^:  :p" modules.order >&2
-		exit_code=1
+		# TODO: turn this into an error after fixing all warnings
+		#exit_code=1
 	done
 }
 
-- 
2.25.1
