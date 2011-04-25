Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:61904 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758275Ab1DYMfY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2011 08:35:24 -0400
Received: by wwk4 with SMTP id 4so1288240wwk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2011 05:35:23 -0700 (PDT)
Message-ID: <4DB56A89.6060204@gmail.com>
Date: Mon, 25 Apr 2011 13:35:21 +0100
From: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] Fix handling of backlash character in LINUX_COMPILE_BY
 name
References: <4D9B63B2.1080701@gmail.com>
In-Reply-To: <4D9B63B2.1080701@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

When using a domain login, `whoami` returns the login in
user\domain format. This leads to either warnings on unrecognised
escape sequences or escaped characters being generated for the user.
This patch ensures that any backslash is escaped to a double-backslash
to make sure the name is preserved correctly. This patch does not
enforce escaping on the KBUILD_BUILD_USER variable, as this is something
the user has control of and can escape if required.
V2 simplifies a very complex escape pattern introduced initially.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 7ad6bf7..f221ddf 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -43,7 +43,7 @@ else
  	TIMESTAMP=$KBUILD_BUILD_TIMESTAMP
  fi
  if test -z "$KBUILD_BUILD_USER"; then
-	LINUX_COMPILE_BY=`whoami`
+	LINUX_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
  else
  	LINUX_COMPILE_BY=$KBUILD_BUILD_USER
  fi
