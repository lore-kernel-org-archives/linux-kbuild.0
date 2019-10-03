Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:59222 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfJCH7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 6/6] nsdeps: make generated patches independent of locale
Date: Thu,  3 Oct 2019 16:58:26 +0900
Message-Id: <20191003075826.7478-7-yamada.masahiro@socionext.com>
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shaun Ruffell <sruffell@sruffell.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

scripts/nsdeps automatically generates a patch to add MODULE_IMPORT_NS
tags, and what is nicer, it sorts the lines alphabetically with the
'sort' command. However, the output from the 'sort' command depends on
locale.

For example, I got this:

$ { echo usbstorage; echo usb_storage; } | LANG=en_US.UTF-8 sort
usbstorage
usb_storage
$ { echo usbstorage; echo usb_storage; } | LANG=C sort
usb_storage
usbstorage

So, this means people might potentially send different patches.

This kind of issue was reported in the past, for example,
commit f55f2328bb28 ("kbuild: make sorting initramfs contents
independent of locale").

Adding 'LANG=C' is a conventional way of fixing when a deterministic
result is desirable.

I added 'LANG=C' very close to the 'sort' command since changing
locale affects the language of error messages etc. We should respect
users' choice as much as possible.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2:
  - Add more commit log about the locale impact

 scripts/nsdeps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index 964b7fb8c546..3754dac13b31 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -41,7 +41,7 @@ generate_deps() {
 		for source_file in $mod_source_files; do
 			sed '/MODULE_IMPORT_NS/Q' $source_file > ${source_file}.tmp
 			offset=$(wc -l ${source_file}.tmp | awk '{print $1;}')
-			cat $source_file | grep MODULE_IMPORT_NS | sort -u >> ${source_file}.tmp
+			cat $source_file | grep MODULE_IMPORT_NS | LANG=C sort -u >> ${source_file}.tmp
 			tail -n +$((offset +1)) ${source_file} | grep -v MODULE_IMPORT_NS >> ${source_file}.tmp
 			if ! diff -q ${source_file} ${source_file}.tmp; then
 				mv ${source_file}.tmp ${source_file}
-- 
2.17.1
