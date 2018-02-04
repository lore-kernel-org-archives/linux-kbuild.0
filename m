Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:40327 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751468AbeBDLhn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 06:37:43 -0500
Received: by mail-wr0-f193.google.com with SMTP id i56so26765952wra.7
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Feb 2018 03:37:42 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH] kconfig: Minimize 'Selected by' and 'Implied by'
Date: Sun,  4 Feb 2018 12:37:12 +0100
Message-Id: <20180204113712.8983-1-rosca.eugeniu@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>, linux-kbuild@vger.kernel.org, Eugeniu Rosca <rosca.eugeniu@gmail.com>

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
readable") made an incredible improvement in how reverse dependencies
are perceived by the user, by breaking down the single (often
interminable) expression string into small readable chunks.

Even so, what happens in practice when reading the reverse
dependencies is that 80-90% of the OR sub-expressions simply don't
matter, since they evaluate to [=n].

Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
and vanilla arm64 defconfig, here is the top 30 of CONFIG options with
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
| IRQ_DOMAIN                    | 75         | 19           |
| SERIAL_CORE                   | 75         | 9            |
| PHYLIB                        | 74         | 16           |
| REGMAP_MMIO                   | 72         | 15           |
| GENERIC_PHY                   | 67         | 20           |
| DMA_ENGINE                    | 66         | 11           |
| SERIAL_CORE_CONSOLE           | 64         | 9            |
| CRYPTO_BLKCIPHER              | 64         | 13           |
| PINMUX                        | 60         | 17           |
| CRYPTO                        | 59         | 10           |
| MII                           | 58         | 8            |
| GPIOLIB_IRQCHIP               | 58         | 9            |
| MFD_SYSCON                    | 58         | 15           |
| VIDEOBUF2_DMA_CONTIG          | 46         | 4            |
| REGMAP_IRQ                    | 45         | 6            |
| REGMAP_SPI                    | 44         | 2            |
| CLKSRC_MMIO                   | 42         | 5            |
| SND_SOC_GENERIC_DMAENGINE_PCM | 41         | 3            |
| CRYPTO_SHA1                   | 37         | 2            |
| REGMAP                        | 36         | 4            |

The story behind the above is that we still need to visually
review/evaluate 212 expressions which *potentially* select REGMAP_I2C
in order to identify the expressions which *actually* select
REGMAP_I2C, for a particular ARCH and for a particular defconfig used.

This patch attempts to bring at user's fingertips those reverse
dependencies that actually participate in selection of given symbol
filtering out the rest of them.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 scripts/kconfig/expr.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2ba332b3fed7..147b2d8a8f3e 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1234,14 +1234,24 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		if (revdep && e->left.expr->type != E_OR)
-			fn(data, NULL, "\n  - ");
-		__expr_print(e->left.expr, fn, data, E_OR, revdep);
-		if (revdep)
-			fn(data, NULL, "\n  - ");
-		else
+		if (revdep) {
+			struct expr *left = e->left.expr;
+			struct expr *right = e->right.expr;
+
+			if (expr_calc_value(left) != no) {
+				if (left->type != E_OR)
+					fn(data, NULL, "\n  - ");
+				__expr_print(left, fn, data, E_OR, revdep);
+			}
+			if (expr_calc_value(right) != no) {
+				fn(data, NULL, "\n  - ");
+				__expr_print(right, fn, data, E_OR, revdep);
+			}
+		} else {
+			__expr_print(e->left.expr, fn, data, E_OR, revdep);
 			fn(data, NULL, " || ");
-		__expr_print(e->right.expr, fn, data, E_OR, revdep);
+			__expr_print(e->right.expr, fn, data, E_OR, revdep);
+		}
 		break;
 	case E_AND:
 		expr_print(e->left.expr, fn, data, E_AND);
-- 
2.16.1

