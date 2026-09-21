Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B748592F
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000350; cv=none; b=eAnWGUNTwCqTx4LLhpVZTAdA+/bUSvV2ZK4xHc+N5GsPjgMbZPMOEId/mgrHlIybscJKvjy5jj3XwQatiG+CW6nUZl+BPV8sU1zgCdWg3GtQ2n61Ly8BrbgLYTyVfRqql5to/onsnNPDnoYegX/7VJqpkiHRgfwgk/WlM/fnVzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000350; c=relaxed/simple;
	bh=DdfuVrashnhPbbC2AOyCTMLd9nXt9cQdw7NV65Bugo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQnQ1QWGB4f/KpJ/NqBnVxh7dw8KpQ7vQYwcD7unUOGkoQq8XItRN4x2i85bMfuqGqlayfbDUj8wsk0kvznn93dPd3crwRLbfeGT9Sjd9jQLi0JD11S1iFiIwdSGnJYYsW+rUtcJC8KWEcvEEXgMnelHs+zzk1hXUI3Udk5thuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J6WyJqDZ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J6WyJqDZ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so608987f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790000347; x=1790605147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SC7BywN25z+Ea3u9MVvG+0TQTnZaS++wuF5w8Mka+Xk=;
        b=J6WyJqDZNTOkRYxCoohxkN2K+ohtnkxnFCy+IZ/+J5zL4x3rMtLnWz2YkdTjamU5mr
         MN8VfLYRbIybzeE94lVt7diuEYsW8lbvHtalRNymsWHydJh7GsmU+nfE51MSx8Tp2Fz3
         cmjgvi6hbNbw3zLvu4GM7Xa+h5Atyc5y3bHT4CoGVZkcwPD9U9d5n7yrYllifLECE74I
         9pGgDuBOvliaASA6gAU7IK5dLzvFHq+P+1ghPrL17lBkMjfxoZl1aSjholsBvRUdBLSy
         40H0GsmPMKyKCuDmpmgBdqCWQD7DLZvzH/usnFOjAvw5AIomFGKGSdvD2HBSln5xH8jz
         t1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000347; x=1790605147;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SC7BywN25z+Ea3u9MVvG+0TQTnZaS++wuF5w8Mka+Xk=;
        b=UKkPamzXcuzVI9wy2Xa/4/MdRPrC8OWtfc7IjzdOObBRskdeulaLBh+tLH3zSkQ3UJ
         2+qZvkDwoQohbkOa8DneAg6mOLAmn4WQGsJ62uZHkO4vkprvpX3kxIuPpsj/aoET1vGH
         yPv1dsVDNb1r91tPo6+Y0WzuYvjqkyXuFSDYf3+CMOLxdzVoTCDHU62JAa5lNtJnKXpd
         7ZKXl1x42YHPtZvuY77uFGG2VkK8dzwhMpiVeXI0IczNawzpYw1cbYapyQHQz2Ftyo1h
         zsOCIHWhuxmFuLVe22MKc31rpWpACXB7APYMUqkvYOJhyBw9bvlkz6Tb5E7AL239u+C2
         CqmA==
X-Gm-Message-State: AFuF++mMzRKeoH8ZjYfIXTxR3daoJWBhCdwBrYw292Vy4dHWhpVS2Irz
	MbGkOyVyaS83I6EzKE8UeGPvwqYq39NNLaqXj6UjuRoW8nn/xQYbgQgqqyriqPmoiVw=
X-Gm-Gg: AYBFou1ghUle8TRzMjo3HOoE6oGm9phRAyztEw3c96dl/iqccmcHd4zPKlGfRoEZw+7
	DNw3vKrtKOnx4mRDh3QyYUbbDNE60m0qjQbjyrK/JOBCiMOR3GSBEQkZzAb/M08qx6fMJ+Crxnd
	Mek04UeDy+8/yGvbgkp/f7kvHIRVUqn39tSf4VN9Mr8WcFE/q3p5LP5Ian2oRrk5RwfpHJVqbif
	6Ve3v/WceMIuqstJtkendBlLLW/oj2tsCpO+2YeQOuElBq1hSk7/X0ulM2UfPz/XKEu9hr2QvTm
	IR75An1KHIBpgToG88MnvML4Quq9Zmu8ako0h5ya0HeYg1oziCQN2fpoXhTefbIgPhvuQpAOV3X
	ONRh60H+i2K0mKVZY7Oe14rKTZhcxarf4CCJ+BwhnE2ZiqKuqDUJqoTqgd4GtNSWOxEdOtzejNh
	GXWFqLjkUt6A5wQVeSnJ2IzVIomzRXyuyBvOVpD/xl5iFWPqlc+lKYWsJEAcraQ8AWkJv5ynnkf
	W/kHG61qBaDkGlzB8hsr8kMswHEVVCnTJqz8bEUp0U1XetvCQbdyZu3Ld+iMzusK0SfnOhi
X-Received: by 2002:a05:6000:310c:b0:487:732:9964 with SMTP id ffacd0b85a97d-4871e220623mr15518127f8f.13.1790000346875;
        Mon, 21 Sep 2026 07:19:06 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4872459a5d2sm21003708f8f.31.2026.09.21.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:19:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v1 2/3] devicetable-offsets: Include the needed device-id headers instead of the catch-all
Date: Mon, 21 Sep 2026 16:18:50 +0200
Message-ID:  <710070be196bccc6139bd1f19a6c38d9969da3bd.1789988540.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DdfuVrashnhPbbC2AOyCTMLd9nXt9cQdw7NV65Bugo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqsTzN8bi+GI+6jG1VeujxlSPkJmenTJsZW6Up/ trU2St5lSCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarE8zQAKCRCPgPtYfRL+ TjD2B/99rEyuH0Ot045DlEkC7N5QwupE5Hg0r8e5YWJREejG3GSS5hfKAqZK+SWuzFCPtjJWora JdMkq7G9FlEzQMOaHvCMhBsQ8davahEtIvsnyTAm5gUHl6CF0ES7/WAku7uqaTqWqyUe7rO3kRN tV1x0Ik7aFNAmaXv5pAzHipniGFxstNk6Jvm2jy694zY8mz5q+fv3Bnen8IN7oyAPUlekmvWjlv G7iiHi5S6Vodv2BZuvDDtwilvSMmFKNWan9n/DCgPg4LgrIFrb6h4vWzGXh9rUhizA10RCUPEBJ y7uGnrdKfDqwQXaxqXfx28JNbFkl2b7eJCKUVf5rId0lJ1iU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mod_devicetable.h> is planned to go away. Include just the needed
bits in scripts/mod/devicetable-offsets.c which reduces dependencies as
<linux/mod_devicetable.h> includes several headers not needed here.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 scripts/mod/devicetable-offsets.c | 56 ++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b57dbbef8777..1f4bbd014a3d 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -2,7 +2,61 @@
 #define COMPILE_OFFSETS
 #include <linux/cpufeature.h>
 #include <linux/kbuild.h>
-#include <linux/mod_devicetable.h>
+
+#include <linux/device-id/acpi.h>
+#include <linux/device-id/amba.h>
+#include <linux/device-id/ap.h>
+#include <linux/device-id/auxiliary.h>
+#include <linux/device-id/bcma.h>
+#include <linux/device-id/ccw.h>
+#include <linux/device-id/cdx.h>
+#include <linux/device-id/coreboot.h>
+#include <linux/device-id/css.h>
+#include <linux/device-id/dfl.h>
+#include <linux/device-id/dmi.h>
+#include <linux/device-id/eisa.h>
+#include <linux/device-id/fsl_mc.h>
+#include <linux/device-id/hda.h>
+#include <linux/device-id/hid.h>
+#include <linux/device-id/hv_vmbus.h>
+#include <linux/device-id/i2c.h>
+#include <linux/device-id/i3c.h>
+#include <linux/device-id/ieee1394.h>
+#include <linux/device-id/input.h>
+#include <linux/device-id/ipack.h>
+#include <linux/device-id/isapnp.h>
+#include <linux/device-id/ishtp.h>
+#include <linux/device-id/mcb.h>
+#include <linux/device-id/mdio.h>
+#include <linux/device-id/mei_cl.h>
+#include <linux/device-id/mhi.h>
+#include <linux/device-id/mips_cdmm.h>
+#include <linux/device-id/of.h>
+#include <linux/device-id/parisc.h>
+#include <linux/device-id/pci.h>
+#include <linux/device-id/pcmcia.h>
+#include <linux/device-id/platform.h>
+#include <linux/device-id/pnp.h>
+#include <linux/device-id/rio.h>
+#include <linux/device-id/rpmsg.h>
+#include <linux/device-id/sdio.h>
+#include <linux/device-id/sdw.h>
+#include <linux/device-id/serio.h>
+#include <linux/device-id/slim.h>
+#include <linux/device-id/spi.h>
+#include <linux/device-id/ssam.h>
+#include <linux/device-id/ssb.h>
+#include <linux/device-id/tb.h>
+#include <linux/device-id/tee_client.h>
+#include <linux/device-id/typec.h>
+#include <linux/device-id/ulpi.h>
+#include <linux/device-id/usb.h>
+#include <linux/device-id/vchiq.h>
+#include <linux/device-id/vio.h>
+#include <linux/device-id/virtio.h>
+#include <linux/device-id/wmi.h>
+#include <linux/device-id/x86_cpu.h>
+#include <linux/device-id/zorro.h>
 
 #define DEVID(devid) DEFINE(SIZE_##devid, sizeof(struct devid))
 #define DEVID_FIELD(devid, field) \
-- 
2.56.0.rc1

