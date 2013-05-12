Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37242 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab3ELTJA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 15:09:00 -0400
Received: by mail-wi0-f172.google.com with SMTP id ey16so217677wid.11
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 12:08:59 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH 1/2] scripts/config: replace hard-coded script name by a dynamic value
Date: Sun, 12 May 2013 21:08:51 +0200
Message-Id: <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
In-Reply-To: <cover.1368379475.git.chauplac@gmail.com>
References: <cover.1368379475.git.chauplac@gmail.com>
In-Reply-To: <cover.1368379475.git.chauplac@gmail.com>
References: <cover.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, andi@firstfloor.org, yann.morin.1998@free.fr

The script `config' prints its name in usage() function. It is currently
hard-coded to value `config'. However, the script may be reused under
a different name in contexts other than the Linux Kernel.

Replace the hard-coded value `config' by the name of the script at runtime.

Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
---
 scripts/config | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/config b/scripts/config
index bb4d3de..6b3272e 100755
--- a/scripts/config
+++ b/scripts/config
@@ -1,6 +1,8 @@
 #!/bin/bash
 # Manipulate options in a .config file from the command line
 
+myname=${0##*/}
+
 # If no prefix forced, use the default CONFIG_
 CONFIG_="${CONFIG_-CONFIG_}"
 
@@ -8,7 +10,7 @@ usage() {
 	cat >&2 <<EOL
 Manipulate options in a .config file from the command line.
 Usage:
-config options command ...
+$myname options command ...
 commands:
 	--enable|-e option   Enable option
 	--disable|-d option  Disable option
@@ -33,14 +35,14 @@ options:
 	--file config-file   .config file to change (default .config)
 	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
 
-config doesn't check the validity of the .config file. This is done at next
+$myname doesn't check the validity of the .config file. This is done at next
 make time.
 
-By default, config will upper-case the given symbol. Use --keep-case to keep
+By default, $myname will upper-case the given symbol. Use --keep-case to keep
 the case of all following symbols unchanged.
 
-config uses 'CONFIG_' as the default symbol prefix. Set the environment
-variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" config ...
+$myname uses 'CONFIG_' as the default symbol prefix. Set the environment
+variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" $myname ...
 EOL
 	exit 1
 }
-- 
1.8.3.rc1.44.gb387c77.dirty

