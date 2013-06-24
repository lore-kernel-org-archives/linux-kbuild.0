Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:64489 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752868Ab3FXSM1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 14:12:27 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 11/15] kconfig/conf: print the seed used to initialise the RNG for randconfig
Date: Mon, 24 Jun 2013 20:11:55 +0200
Message-Id: <a5f6d795f5941e97e757b643a6482968a66c6150.1372097219.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1372097219.git.yann.morin.1998@free.fr>
References: <cover.1372097219.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1372097219.git.yann.morin.1998@free.fr>
References: <cover.1372097219.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... so the user has a chance to reproduce a test-case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/conf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 94521c7..38616c1 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -532,6 +532,7 @@ int main(int ac, char **av)
 					seed = tmp;
 				}
 			}
+			fprintf( stderr, "KCONFIG_SEED=0x%X\n", seed );
 			srand(seed);
 			break;
 		}
-- 
1.8.1.2

