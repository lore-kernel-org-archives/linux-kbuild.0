Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34951 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932877AbeBMA5L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Feb 2018 19:57:11 -0500
Received: by mail-wm0-f68.google.com with SMTP id r78so13157470wme.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 16:57:11 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Date: Tue, 13 Feb 2018 01:56:10 +0100
Message-Id: <20180213005610.10575-2-rosca.eugeniu@gmail.com>
In-Reply-To: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>, linux-kbuild@vger.kernel.org, Eugeniu Rosca <rosca.eugeniu@gmail.com>

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
and vanilla arm64 defconfig, here is the top 10 CONFIG options with
the highest amount of OR sub-expressions that make up the final
"{Selected,Implied} by" reverse dependency expression.

| Config                        | Revdep all | Revdep ![=n] |
|-------------------------------|------------|--------------|
| REGMAP_I2C                    | 212        | 9            |
| CRC32                         | 167        | 25           |
| FW_LOADER                     | 128        | 5            |
| MFD_CORE                      | 124        | 9            |
| FB_CFB_IMAGEBLIT              | 114        | 2            |
| FB_CFB_COPYAREA               | 111        | 2            |
| FB_CFB_FILLRECT               | 110        | 2            |
| SND_PCM                       | 103        | 2            |
| CRYPTO_HASH                   | 87         | 19           |
| WATCHDOG_CORE                 | 86         | 6            |

The story behind the above table is that the user needs to visually
review/evaluate 212 expressions which *potentially* select REGMAP_I2C
in order to identify the expressions which *actually* select REGMAP_I2C,
for a particular ARCH and for a particular defconfig used.

To make this experience smoother, transform the way reverse dependencies
are displayed to the user from [1] to [2].

[1] Before this commit
Symbol: MTD_BLKDEVS [=y]
  ...
  Selected by:
  - MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
  - MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
  - FTL [=n] && MTD [=y] && BLOCK [=y]
  - NFTL [=n] && MTD [=y] && BLOCK [=y]
  - INFTL [=n] && MTD [=y] && BLOCK [=y]
  - RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
  - SSFDC [=n] && MTD [=y] && BLOCK [=y]
  - SM_FTL [=n] && MTD [=y] && BLOCK [=y]
  - MTD_SWAP [=n] && MTD [=y] && SWAP [=y]

[2] After this commit
Symbol: MTD_BLKDEVS [=y]
  ...
  Selected by:
  - [y] MTD_BLOCK [=y] && MTD [=y] && BLOCK [=y]
  - [ ] MTD_BLOCK_RO [=n] && MTD [=y] && MTD_BLOCK [=y]!=y && BLOCK [=y]
  - [ ] FTL [=n] && MTD [=y] && BLOCK [=y]
  - [ ] NFTL [=n] && MTD [=y] && BLOCK [=y]
  - [ ] INFTL [=n] && MTD [=y] && BLOCK [=y]
  - [ ] RFD_FTL [=n] && MTD [=y] && BLOCK [=y]
  - [ ] SSFDC [=n] && MTD [=y] && BLOCK [=y]
  - [ ] SM_FTL [=n] && MTD [=y] && BLOCK [=y]
  - [ ] MTD_SWAP [=n] && MTD [=y] && SWAP [=y]

This patch has been tested using a custom variant of zconfdump which
prints the reverse dependencies for each config symbol.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 scripts/kconfig/expr.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 0704bcdf4c78..173fc5b252d5 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1185,7 +1185,19 @@ expr_print_newline(struct expr *e,
 		   void *data,
 		   int prevtoken)
 {
-	fn(data, NULL, "\n  - ");
+	switch (expr_calc_value(e)) {
+	case yes:
+		fn(data, NULL, "\n  - [y] ");
+		break;
+	case mod:
+		fn(data, NULL, "\n  - [m] ");
+		break;
+	case no:
+		fn(data, NULL, "\n  - [ ] ");
+		break;
+	default:
+		break;
+	}
 	expr_print(e, fn, data, prevtoken);
 }
 
-- 
2.16.1

