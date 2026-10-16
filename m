Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BEB45C700
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145375; cv=none; b=fbgIyy3wOEm+gZXebiodB5bPbqtE62cG1KTZZ59XYlgAQSBRyRkAFb46TMWN6LBrSatLy6BNRx3XcX4Ce2wSzTLnZa1hZOvdSvEjp8w0cCsR2PRMW2/S2GOostPUyLTB03C1VlZsmZHGjLvwt8/uW5aSoKmqCB2TvrqL95MHLVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145375; c=relaxed/simple;
	bh=crosGR30DuymSJAOJ5Zhff5jw2N4cCZP6bAKixXUBgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBxT9LNThc3BWvJUYO7idpHWRthBKjxLeyCF6WGRKZuiBPzi5jHleIeWsQ33bIxmOw3YtVVtyUgw5eiR2DwG9U8bNzVQoFg80v1NySbT3j468TCRx7ArWyvenXIQyPE501B6DMkI8lbxEYzEQJ2IMpjJ0d+tn5bIKunODSj2h3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=py/iJPJA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="py/iJPJA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3728272f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792145371; x=1792750171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77GWMzZyZ3eJoAxvDDtvCgDy409gWeoAg1Ntqch7jyI=;
        b=py/iJPJACfc6vqLpebgQSetti6QFXpavOQYEoqVjORBuQilt5ABVG8V1OLUgYdhwBw
         hV2yESBVwk4kr2QE30lH68czovFn2FvX6ssZMe7RXQl68wd98IPlh/2yGFHnFSGkIa3z
         b+TXhw0EAPB8HkGUtK+BLo6zuivclwmxm3enF5f6hlOHFVDoitrQ3Vkt4KQVpNwaIXP9
         YzWeUR4xHCKkfxEJQfTFRpQgdyvcqAttBRoyo8TbR+j+1i/dbI1aiuxXyd/Z43/Qgs99
         22KP+vevBctucW41ayQsfyePqQaTBzEycKwbZHasy3nUYLKuWLo1aIbKUtfWcsb2E8pm
         PGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145371; x=1792750171;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77GWMzZyZ3eJoAxvDDtvCgDy409gWeoAg1Ntqch7jyI=;
        b=dJy3eG8SvEqrS1BUkgN9qxmlYaGP11085qcXk2nlB4nOFpSUCa5kolLcRE2hitK5iU
         YDIcM/Div4wgjhUKinmEdel2dNGIUrxJtiD7lqiaUd4YkWTcOdnJ6w9XScOtbfBRIaIg
         WzEFd8ujQEgkvuRdfq/W/CxBmrNrPzsYnxLF4s++7BSICEJSug8pcbUpex7Lu8Z2SzDE
         65lA4y58DDRCJY4Qe8+KlAVntxdyiUIxkjObVbjd/6LzWxpNA1nhTMC/4GYmnqsKSOUr
         Hi774q23vmOiGMlj9UfsIyF4cH9IItLSlW9oxL8NZGKPgwfxGiz4lq73sDq9MwFMVuty
         0D1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcDwIDMlUntp5uff4vBchNZ1vF0BZbX8b12WDbS6Kvbx3U2d/lRn+XGY4uGJ9p4SpX/nC30/W55P8tFQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq+g9gX2U4hCzMpR6o5uimNX/SaVwyXxp+pd9DBxQYBE5aR6qZ
	smZFWQV9uPgYloksAkCUVBxq7LlcJD8vUPhh4cUKk1xt6fey59LC5tqPMKDYVZeHAk8=
X-Gm-Gg: AYBFou3wEhRzXwpvS1tJw6fNWsJ2PFHkiyLfRFmHhDixirycF864wo8ZfX34TnHCKlF
	ay5xNdYIy29FKUZC7A4T92CTHmJiiFzBcCe93cXHYgCNie3fUPUSJCMZ5qt1jkfSy4NdSPVRoE+
	+GiVPk7e4A2oz96oTTw4c2AmCrBjPHesM8l9St+Ug9jelu8468jstJrgE4mxfeWe8abmMF3IODz
	e8uwn0eoZzfGHe3TPPe297HOJpaUrQsBH+roNmhe3bQVpFTu8xR2O10fi3iCrsG8fAMBiid3j4q
	9JA9spKOAWO1PLr/bognKywesFesP/OsZG77Gpn1s9bPuElEH/PMFUDaV13sYljlTMs0ery8pmH
	nm5EwO5xmdQJgp6PLDJ+jCAsqU8OQYOlpMhypDxnl20c4uQer6yjIP8Kgo+PWjysn44rrYmZZCc
	D10WzHv8JGlroUn4WYG6+EYG/H2/D6h25Pk2ml2HqlWb8/3g2XpBM0U26Y41d/h44LsGAlihICS
	75su1frS+rocxXBUqdH457gTz1GZUr6jpjL5slL7KEtfL9LJnvLtDA6/v/F98ggM4X/oiA=
X-Received: by 2002:adf:e004:0:10b0:48d:fb06:d034 with SMTP id ffacd0b85a97d-48dfb06d0fbmr4073257f8f.51.1792145371342;
        Fri, 16 Oct 2026 03:09:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904af4079c70d984f00.dip0.t-ipconnect.de. [2003:f6:5f19:a904:af40:79c7:d98:4f00])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4338417f8f.25.2026.10.16.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:09:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Nicolas Schier <nsc@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raag Jadav <raag.jadav@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/3] Move struct cpu_feature to <linux/cpufeature.h>
Date: Fri, 16 Oct 2026 12:09:12 +0200
Message-ID:  <bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.1792144769.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
References: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=crosGR30DuymSJAOJ5Zhff5jw2N4cCZP6bAKixXUBgc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq0ffLpwY+CLA09xXJD1mLphQhOSY5nYjIZfPtV kcN/rHjt0WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatH3ywAKCRCPgPtYfRL+ TmcCB/9c636N89IbJUTslZqeG/3O7qtsWZAh6metCHY46spBdytF7QWjwRdG6kl/6GRcYEj1Btl p4MHtBWWm3ywxRr7znMf+pR+0dqklb/1C6LDRsgETSwm/25oP+NZ7ONrgkw+zqPAcPHfQqg1Q30 upKdalLz9JcHGMCdbrMYX7oPLyxX9mOvkmBMUvEQTZV9thvNsalGuwBgGmsoSKDoC8J5CfX1luI 3ihKKO7ED5p5RsXSe1Qm7WyNx2I/nEF5lAmXoJe/a4vAxpyKKxh8AyazRJSOrkPuO/rau/OPuKX ZqMSeuk2sz5s8HVw56CvBdayNHvXHadxL3dOmfe1Kttenwew
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct cpu_feature used to be defined in <linux/mod_devicetable.h>. It's
much better located in <linux/cpufeature.h>. The only downside is that
modpost and devicetable-offsets.h need the definition and thus
<linux/cpufeature.h> must be included explicitly there.

Acked-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/loongarch/kvm/main.c         |  2 +-
 include/linux/cpufeature.h        | 19 ++++++++++++++++++-
 include/linux/mod_devicetable.h   | 13 -------------
 scripts/mod/devicetable-offsets.c |  1 +
 scripts/mod/file2alias.c          |  1 +
 5 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 236523d2449d..d082dae61971 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -5,7 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
+#include <linux/cpufeature.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
diff --git a/include/linux/cpufeature.h b/include/linux/cpufeature.h
index 6aff540ee9e5..7b22a536542d 100644
--- a/include/linux/cpufeature.h
+++ b/include/linux/cpufeature.h
@@ -6,10 +6,27 @@
 #ifndef __LINUX_CPUFEATURE_H
 #define __LINUX_CPUFEATURE_H
 
+/*
+ * This file is included by scripts/mod/file2alias.c which is compiled
+ * using the host compiler which might not have <linux/types.h> but the
+ * __u{8,16,32} types are defined there locally.
+ */
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+/*
+ * Generic table type for matching CPU features.
+ * @feature:	the bit number of the feature (0 - 65535)
+ */
+
+struct cpu_feature {
+	__u16	feature;
+};
+
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 
 #include <linux/init.h>
-#include <linux/mod_devicetable.h>
 #include <asm/cpufeature.h>
 
 /*
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..9ce2429b455f 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -8,10 +8,6 @@
 #ifndef LINUX_MOD_DEVICETABLE_H
 #define LINUX_MOD_DEVICETABLE_H
 
-#ifdef __KERNEL__
-#include <linux/types.h>
-#endif
-
 #include "device-id/acpi.h"
 #include "device-id/amba.h"
 #include "device-id/ap.h"
@@ -69,13 +65,4 @@
 #include "device-id/x86_cpu.h"
 #include "device-id/zorro.h"
 
-/*
- * Generic table type for matching CPU features.
- * @feature:	the bit number of the feature (0 - 65535)
- */
-
-struct cpu_feature {
-	__u16	feature;
-};
-
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..b57dbbef8777 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/cpufeature.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..88bff3207277 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/cpufeature.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
-- 
2.56.0.rc1

