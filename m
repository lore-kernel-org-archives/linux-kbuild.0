Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78914471CE8
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000350; cv=none; b=C7rIEZ3WVeKrF36V/UO8gNYrWpwJwROQYbrtlgpcM+vFVR6FCTw5702mpS8rskQPiAPla1OKsj/tRkY/FW1lS99EEMH1PecLx2LPguKU8cGA4NUJnqE2zLKvplTTwyHk5UFeZrHmXXJvS5PpSgLYcfcgPV1JpiTabebB/wHwqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000350; c=relaxed/simple;
	bh=Hp1aaN6m9SLOJ9Ba77XKxslIFjByDCCJrJMUB87/J7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mm+Uw2C7ZDTVFMx4PUbyHbSmP6oD4cyFhIBBKAptxqOBBzzEL0rbM+7P7n/dNpVhJB/Nw9P51rrzjyNW3f2uJY7aUYFdfWy/y5P5oRhS7zTs4AoupBg/hWMvru2A6Z8czFiiAI6+/Ah6hTXobEzb3m8kzMlrtqhELxM2fuEy3YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h28rVdGL; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h28rVdGL"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1553161f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000345; x=1790605145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X9iJStx8k76O9mNNIa9n25MiOt6w1A7vHpXQesRkijU=;
        b=h28rVdGLNenqmI8RqjzxFu/RJSKbLRv+7ymn3gTJw47/ANWN+0HrOaUKmYmX7nU8Br
         GJKG4unSf/4uwU1vOeMkMKJ5416sM9iCusXrhaae6d4/C4r3FqoPxzE1PAMU9HmZgMhu
         JHn9FwGyJ1kdWyyhKheCP97wQjswxYDY18RN6NlbeJOh6N2J21EbZkZJ3jTlBFXfZFEc
         FTt7/EcXFY48wCNeXQxEbt2ZF1vIsjK3R77INN6YBckf7jlmApgzKNLrEBgTznc9+vYR
         2KucigoDm9smNQT3TVdYgB2ul5/Tksht4XzB/pr8NfUtgAvky9tOgHbdlzsfsldJG6cH
         s6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000345; x=1790605145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9iJStx8k76O9mNNIa9n25MiOt6w1A7vHpXQesRkijU=;
        b=bdQoj/ypEmg9SRyOEEru1oqb7FN4Z/2vTL4b+uHCJF1dYBEZEk3eyXlwIJUXslVWQn
         DVWf+99IzEKR6embtFt74wbjJj2PH2pJing61iP4eHBQjpbNSjJ2StU3UNC3CkTKlk0L
         Pd+IVGdT1cQ4hbyTW0OAVWYlmp4xxUWAHB1j5376Jc9fgYRoVjjenoNz2rLI1AApaiqn
         V+QqjxS9o+Or6rCXnTZIyBmNSw9JIyyPietrzfKaE7FYrUn29oftz/OZ8Itqlo16lDU6
         E9hwRikLqkusbEcsBnp75hGNGjHcZQsO4a2Cjqez2q7+A83eOCiv9rNTkgVqN1ImW/qP
         s4Zw==
X-Forwarded-Encrypted: i=1; AKwUvByk+bdYnxoJTcISaSGGkDtAGMw3vGGVIxxTObt2ZyR+eVxHVdhMksPumtXukPMhT2b5YaS/51dJ7r8WTnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nKTrMqpoAJGWC8rmWqBQxRE3GS5K4hShR2fn9BW8tYF9Y5TpGP
	csQGBg9lU1qyXqeFSwRRKw7q/hSEjX/DwRTh8aEdwlmo3JoY+gARTWPoUQENZ9UG9Fc=
X-Gm-Gg: AYBFou0WKgnQdkbRokVt1gpR36GB2H74wWJPONfjzcg2k+QntT9EwcB218gz/sOikZz
	xr8EdSLP03H/OY6RswYI/2WkkvhEucc01YTo4J0jYQPxkU/7gof/rE7uVjDcdg/y/3iIOd+OyHa
	EId3qeI9Qi0A5/xXZZxFNk0T58jI2C5qVed8epT+IwseGnToV25yg39FZEied43V494Ihrd16PC
	iHU5cbPbBXVbp/buWYuGM0YSipJzIF1zIhtR8KsXEEnmCUoN94Aj/zAf2meqGUhvIlSXidfuwzH
	CtLjTyLIwTvUc/M4z9uD8EloMmqsjg+5P3UxPi32InTLi/ycs4XgM7UneQ18vsCgHtIqwcvUPmC
	zUaU+cg6Uw0z+8Q3xg/FwXwraU31NvdkDw0R0AIzYRlBOJqT9B1ZshwCgEIyZMeotTIEe2jPDTc
	dkIgLtVGrv2PiLDBkS7ZuMJmYsCZlzSIO74gBsLsu69roB2NoADFLghDP7Y/Evx9hoZv4YNAlJa
	jccwIi2gqbKbWK2d9L9vKper/jo/9wA960dM55Hl16olRxtp/jW/YN5voz7tg==
X-Received: by 2002:a05:6000:310c:b0:485:ae8d:1e07 with SMTP id ffacd0b85a97d-4871e37dee2mr15597411f8f.56.1790000345490;
        Mon, 21 Sep 2026 07:19:05 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724422790sm22134362f8f.5.2026.09.21.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Raag Jadav <raag.jadav@intel.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexey Gladkov <legion@kernel.org>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 1/3] Move struct cpu_feature to <linux/cpufeature.h>
Date: Mon, 21 Sep 2026 16:18:49 +0200
Message-ID:  <ef103a4b9e1cd7477fa52ee347c4ec301354fba9.1789988540.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
References: <cover.1789988540.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Hp1aaN6m9SLOJ9Ba77XKxslIFjByDCCJrJMUB87/J7I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzLZ9D4hpytjwv31lXxPvfXsBlJnDYJz+Jiq Ckg1/ZdTzmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8ywAKCRCPgPtYfRL+ Tr7BB/9RxyUkC8S2GB8h2AOL5R1cm+BhY9DSagwLwPGj7JLlQCNJn+1BpMEj/D6VFQC+nz70qG2 yPyA2QQ1bUxHWk/yXqQHc2aLOAwfVbWII5ziFW40g/6GvU6wvz8WcEyRDE31WY34MEQ7U7jcb6C lV32wGb66HTpO1a/WqGnaIiLw+93l6IkcuGzKf3aCqRjjMDVAl2id/bwVPjVAI4krEK2MsAhXb1 WpGCfUDDGDfmsMF3khnktkeHgFidAC6iBymdXOg9yODHQcbhPhE2c31y8H93SOIWisLa86oVmgb aT/QWYPEJ2u+WdNcbeKYiBJxYkR/MuOmC2K6dh+rQ1fbEPw8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct cpu_feature used to be defined in <linux/mod_devicetable.h>. It's
much better located in <linux/cpufeature.h>. The only downside is that
modpost and devicetable-offsets.h need the definition and thus
<linux/cpufeature.h> must be included explicitly there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/loongarch/kvm/main.c         |  2 +-
 include/linux/cpufeature.h        | 12 +++++++++++-
 include/linux/mod_devicetable.h   | 13 -------------
 scripts/mod/devicetable-offsets.c |  1 +
 scripts/mod/file2alias.c          |  1 +
 5 files changed, 14 insertions(+), 15 deletions(-)

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
index 6aff540ee9e5..93c1da38aaf6 100644
--- a/include/linux/cpufeature.h
+++ b/include/linux/cpufeature.h
@@ -6,10 +6,20 @@
 #ifndef __LINUX_CPUFEATURE_H
 #define __LINUX_CPUFEATURE_H
 
+#include <linux/types.h>
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

