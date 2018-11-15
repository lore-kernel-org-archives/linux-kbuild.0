Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36433 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbeKOLB7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 06:01:59 -0500
Received: by mail-pl1-f196.google.com with SMTP id y6-v6so1043736plt.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 16:56:23 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 1/2] modpost: drop unused command line switches
Date: Wed, 14 Nov 2018 16:56:01 -0800
Message-Id: <20181115005602.30746-2-paul.walmsley@sifive.com>
In-Reply-To: <20181115005602.30746-1-paul.walmsley@sifive.com>
References: <20181115005602.30746-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Paul Walmsley <paul@pwsan.com>

Drop modpost command line switches that are no longer used by
makefile.modpost, upon request from Sam Ravnborg <sam@ravnborg.org>,
who wrote:

    modpost is not supposed to be used outside the kernel build. [...]
    I checked if there were any options supported by modpost that
    was not configurable in makefile.modpost.
    And I could see that the -M and -K options in getopt() was leftovers.
    The code that used these option was was dropped in:
    commit a8773769d1a1 ("Kbuild: clear marker out of modpost")

    Could you add a patch that delete these on top of what you already have.

https://lore.kernel.org/lkml/20181020140835.GA3351@ravnborg.org/

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0d998c54564d..85bd93c63180 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2416,7 +2416,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awE")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
-- 
2.19.1
