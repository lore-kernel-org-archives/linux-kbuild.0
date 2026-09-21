Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E1D4A2A45
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000352; cv=none; b=cfgjqTyjOBFaWSmN99oJqPt54n5MjZlfkS+CcSyvkbpyNSXRnVaU1/S7aszZAVZmkBmwl7wKBGTyRJ531DbHcOuRDV9W0AImfzmshyYth9EVrYKfblmQKCVS4BKecY7sAAiUu5WR2zUFXgAwblUqfluqsVutVUGovqLziBKwbCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000352; c=relaxed/simple;
	bh=7NQB7CbqeJhBU0gwoZAcCCwGqFylrf3yNUA3KAuTKWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9twLRlCtMOeYzmSLhEszSvwJzRtdyq2BfMcd3DTDEHHhTLTkw2UgI2NetnsFoNOcrLZ/a8whv+KGCnhuLwDeKQ9TWUcJB1nJ6kl2knNneJ+XQmZFKSH5eHhAp9OUnkC0WqRdxB41ZqmN7IaP6/RL1TIJiRU7ZdvxdFyoE+wClI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SQlD9sHl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SQlD9sHl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso43022935e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000348; x=1790605148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGr9PNK8A3HIW2FQblW4kHC8jz59SbhsDctVzKss3rc=;
        b=SQlD9sHlpMF885fT5c+sjeik+QVnPKZNN65UvN+FKvqnf1UgxU0Ec0KPHIqGkWPdOF
         5tjlCF0AlGkBcyf9HpZAymn2VMNJinJaRfBPJ+oOJ6Ga4CoXKLBw8BxQPqkixlZIsul+
         U6Ql83zp0dSuDoIN22hdt1pgqGDtYzQ4310wQLeX0uW2R0DsTZ6OZUVL9XRfGvGlpJc4
         Y7z/pcmvqUQmF73NAQUavHpQEHkJRLVTGhA82Yy1exthqGhBUfXGWiOCzdIXLh0fj8wL
         0+NUqfbYU0M8MgEP7d1g6IZEcCrO0WpkzF8JaqlZU0zJW4voW3l3wqgshcF2pJl6fzJu
         6eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000348; x=1790605148;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGr9PNK8A3HIW2FQblW4kHC8jz59SbhsDctVzKss3rc=;
        b=xDg/gH+C3sPy9RwVAPABz8Vqbk2fk0pgmB+g2lQ0k1Ynq+Qi2Tk5xhtJYdaxx4B8Xp
         f5Vt/dY2jT06QlDH2hyLE006GLibUjfO+CZEtO8VbJwzNvaeA2e/6Z2n2Th2JXOm39x5
         ii0gQGVWzSWRm316BqscDEZnKaB8BlhC2npF7GixFTPrlSyAk+4C6/py1Z4fvjLzGho1
         PmrmCXjUE4Q1vplqbuNlTuDLsBTd9vsGdth5rOQCCjv83hoO5t41xYrYyzkjzPPLnFg3
         QyQr+vNMl5+cTjA4RWeSd/Vx4rqmhIF3XWI6smUzgkXBtIsdHF2LtOOghYs5FrEs+fmx
         yDuA==
X-Gm-Message-State: AFuF++lOGbnNM/fs44b1vHbH33QmVbFgK5Mu4wd0xnMzaEezVGCwZkW/
	xDBoCSciXqwlQrEyMaxVJBI3scKeEIzFaIU5s3H3jrpv8iHXcqXoQ6nd/H+NLAlFkbU=
X-Gm-Gg: AYBFou0AgCuykYD/uEhShGjeGUanXT/dOFoyCF62aVlAal3kXFbnyBNC+DIhOy5R1ZN
	o1p+6VsQCOp/Qrg+Z7VevMe7VhuKRPMqI+J8uvYw1GYEZGsfKUx4GVKf4vEuaDKSyJZppymw3OQ
	1g7ABpkR1X44/BD9s9VxBuUTvK3I2tBgRREXdHJgeNkiCGn+z3i9bgcfKVIpaENMvVvpZ8ok9ne
	emX4a809feO5iCYFr5qAnPGBUK9QzxXoWg9q4FYqCprYgFxosaPdnA4xl+wDLQiH3xwhLWvw7zQ
	jHdwMrWpMMSmO/ZBMlPUCSzWaLMjcsfzJLnFrnWqCK8waCCnf9wQPfDPQQnKT7zwx+8JgkCkGAe
	jueZw3ucWGew5BgmBwbbWsjDlwd5Kf8Z/YnlWlVlt5yrljUDwHvgCWc3Jpp1qQ+p4QCkvXQuEFp
	UeX4xOWPoeo3ZFl3uYtkAm6yB8ixe0BpHlUfi60yRU23/yHvVaR/27HE5cgtITWdVI/hC5d9syc
	f098+OZIrvyBylPAuvxCdLXPnag72g0P3nih87+N62yOukLPkwKpXP1d8wTkw==
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr149417615e9.28.1790000348476;
        Mon, 21 Sep 2026 07:19:08 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd0f8563sm266149915e9.6.2026.09.21.07.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hugh Dickins <hughd@google.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Hasan Basbunar <basbunarhasan@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 3/3] file2alias: Include the needed device-id headers instead of the catch-all
Date: Mon, 21 Sep 2026 16:18:51 +0200
Message-ID:  <6259139da4f8181c7b6ca01128ba7c645335850d.1789988540.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3655; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7NQB7CbqeJhBU0gwoZAcCCwGqFylrf3yNUA3KAuTKWc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzPV1jgeWLSkidYVaR74w/TcNnjTpQgpxto8 AHidD6Gt/6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8zwAKCRCPgPtYfRL+ TgL/CAC1AVwnpLLgxTrLAkF2GH4zPzt2M0FNmNlVmNzxzunjhXlffDkyWlJaD2wTrB5vItEgsTa Xll2BQ800pyZfkhqWvUbQJC9bNtEOBl1vvIgAvfWsKovISkQxHa8vgrYOogoGWqIMpd1XF/eNbm SEQ3Et68nzemxPwr47YlVQjEAzx+f1Ezo+H6goaAk742lDhIjnd8tsQ9Qz/2VV4+dRpEb6CQkI8 QgiOZ1CDDhVRD2i113b3VMh8+xa0/LRwtcHVJt62Z5ZE9l3vMMxbnmDMoHRYINwL+O1GQLk3jf/ xbGUUHXJkv1s2f2o/qMhvTnJVeboUUDvQztol5XI8slkE/ZV
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mod_devicetable.h> is planned to go away. Include just the needed
bits in scripts/mod/devicetable-offsets.c which reduces dependencies as
<linux/mod_devicetable.h> includes several headers not needed here.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 scripts/mod/file2alias.c | 55 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 88bff3207277..7d76233a8d5d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -122,7 +122,60 @@ typedef struct {
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
 #include "../../include/linux/cpufeature.h"
-#include "../../include/linux/mod_devicetable.h"
+#include "../../include/linux/device-id/acpi.h"
+#include "../../include/linux/device-id/amba.h"
+#include "../../include/linux/device-id/ap.h"
+#include "../../include/linux/device-id/auxiliary.h"
+#include "../../include/linux/device-id/bcma.h"
+#include "../../include/linux/device-id/ccw.h"
+#include "../../include/linux/device-id/cdx.h"
+#include "../../include/linux/device-id/coreboot.h"
+#include "../../include/linux/device-id/css.h"
+#include "../../include/linux/device-id/dfl.h"
+#include "../../include/linux/device-id/dmi.h"
+#include "../../include/linux/device-id/eisa.h"
+#include "../../include/linux/device-id/fsl_mc.h"
+#include "../../include/linux/device-id/hda.h"
+#include "../../include/linux/device-id/hid.h"
+#include "../../include/linux/device-id/hv_vmbus.h"
+#include "../../include/linux/device-id/i2c.h"
+#include "../../include/linux/device-id/i3c.h"
+#include "../../include/linux/device-id/ieee1394.h"
+#include "../../include/linux/device-id/input.h"
+#include "../../include/linux/device-id/ipack.h"
+#include "../../include/linux/device-id/isapnp.h"
+#include "../../include/linux/device-id/ishtp.h"
+#include "../../include/linux/device-id/mcb.h"
+#include "../../include/linux/device-id/mdio.h"
+#include "../../include/linux/device-id/mei_cl.h"
+#include "../../include/linux/device-id/mhi.h"
+#include "../../include/linux/device-id/mips_cdmm.h"
+#include "../../include/linux/device-id/of.h"
+#include "../../include/linux/device-id/parisc.h"
+#include "../../include/linux/device-id/pci.h"
+#include "../../include/linux/device-id/pcmcia.h"
+#include "../../include/linux/device-id/platform.h"
+#include "../../include/linux/device-id/pnp.h"
+#include "../../include/linux/device-id/rio.h"
+#include "../../include/linux/device-id/rpmsg.h"
+#include "../../include/linux/device-id/sdio.h"
+#include "../../include/linux/device-id/sdw.h"
+#include "../../include/linux/device-id/serio.h"
+#include "../../include/linux/device-id/slim.h"
+#include "../../include/linux/device-id/spi.h"
+#include "../../include/linux/device-id/ssam.h"
+#include "../../include/linux/device-id/ssb.h"
+#include "../../include/linux/device-id/tb.h"
+#include "../../include/linux/device-id/tee_client.h"
+#include "../../include/linux/device-id/typec.h"
+#include "../../include/linux/device-id/ulpi.h"
+#include "../../include/linux/device-id/usb.h"
+#include "../../include/linux/device-id/vchiq.h"
+#include "../../include/linux/device-id/vio.h"
+#include "../../include/linux/device-id/virtio.h"
+#include "../../include/linux/device-id/wmi.h"
+#include "../../include/linux/device-id/x86_cpu.h"
+#include "../../include/linux/device-id/zorro.h"
 
 struct devtable {
 	const char *device_id;
-- 
2.56.0.rc1

