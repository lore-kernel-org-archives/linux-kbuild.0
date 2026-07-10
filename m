Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6332E762C
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692276; cv=none; b=d+r+BP5e2Cz+oil7VJSqm2iEtp6o/D/WFfNgX5oNSLlMXTYJ0mjcTCbwqlOl953/EtLDaXk18IY5RC4hmUQAQfbIrIY45KY3pMCU4eef+PJoym844eN5gPnrgrBrvniZ7PA//r3YcjsQu8pcB8gpFtGqBLbhF96pb4qbokvfHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692276; c=relaxed/simple;
	bh=fU9hRUkgwWtAMevIQ0BwWv9Bl3Z9AGp5quh/pJYfoiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RIupaOFibo3sBmWPEjV4jzVypZ9k/Ef/l4dLtD4ztbqreyz90BCKhhB5ktcGeC14cAsASLZp8DSY26c1L2LtlidbcTWZeIDgNAVDp1BSeEnEua+PkCGDcwtoD2XWdkVm8F8pJm0YSA7DzKI1GCa2VA8Fb8jEMS8pRepCWE6KQZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdkAbGNC; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdkAbGNC"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a361e33392so38965eaf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jul 2026 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692273; x=1784297073; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Glyq5MR4pRinjyKJvPoz45FJVzIcZrDR895QfwtLCo4=;
        b=bdkAbGNCH05a5Lzaq02uaWZee3QPmVBDvohMaUVVjJwcbwlbQlHFNsohVHJBRxLNlU
         VKjOqWbk0pCtd2Vj7P5HPolZL1ghEHqO+Hrc0UXe46jP+51/UxmkT4X4PtfFTNo9V0xa
         J+FqHMsHA/NPUYG6L7B/+hyLh2edTE9MT6EkPUkiEyvK0IDH9tPYPvtPNlFHDh6g+k6K
         vZMRXTB/c2Y94HfO36gc2PdlcW8/aVQJVZni6+lAsQspb1qHWqHSdjiYcjpuAgAsIV3L
         2jYpi8KX+H8BZadDilXDxnHa6MY+cHMYVFtQQgDN/iOXwBsnIbz3edeLfWfgV2apZQXs
         bsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692273; x=1784297073;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Glyq5MR4pRinjyKJvPoz45FJVzIcZrDR895QfwtLCo4=;
        b=jYvBM4+YD5F0DtD9cytQZV+7nl4dCykZptfWAkvAi5RXCvrTPRWy9BZbh2dFJLjVb9
         tBcneQSSfl0lvtQNACp9v2BomuQPlQYPyp9E10rwYdC1S2gQoysxMUKQP9Pz5f0NwR6t
         TXU2+l0kf7w86MDaXrQz33UO/wAYH2aBjslRe5FfeWk+rzMwXV2KHaOGUztn7scS7WBF
         7LUFFDr0kqwKUKDjHrGlwTqh2UGn3d8kcHE+6t7r5KU6nXSgq7eBLWKRR4SQSm/zi783
         4wUmskKZPFNsLW4Xkhc2u/fDacus2YMza2DuKjI3yKC17Y3pbMRwIG8SoCoZnwSag0Lv
         CI3g==
X-Gm-Message-State: AOJu0YzAMB24qgb+gnPSEEjmodUjrr+qmTJE2qX5MCues3CvuT+SmJl6
	j1TONGn4bsrWcALSKmzqCI0KwlMtIFQM794A+A5V8wYUOsg0Yu1Z6rfRQB23/+eH6Ss=
X-Gm-Gg: AfdE7ck3i9YBWa1pMiDm3W7UqNgAh1VAkvYxiaIiZwlW6vkatep3ZamKOEgrrLGUB3r
	gW9PeCvdf2Nm1jB4FGqyF5cEKO8K6TkDai46gJwzNIslivQ4O6gWOwLYipShMmKWKETl54y3GjO
	xlTfsDWvRxrGpE7KkU1s4uKRE32Qa6cgdWQXmZKcsnUGvqnT0xZXdMsYqgokMdDeURaYCDi/xUd
	GCFruCEfV+Wd9E02kRvQxloRlY2b0uWp74+epc1W3QsQew4BvXUxsIcUysuLtM/BkqbirHjStje
	g4wi6+z4ri5vArfUdx9mlx9gjPtKkPMPu1UPJJl9XpIfdNtaxhe3zjzVu4Etiy00lD+ZQvxY6DJ
	2f+kCGgZJBvhKy27KoZOP7lwGEuGFrV+SkaNSmIEiPvTL+B00RgUiCcApwGyAnnmEUllJIiwkR1
	pMfC6ANg==
X-Received: by 2002:a05:6830:2b11:b0:7e5:f49b:35b9 with SMTP id 46e09a7af769-7ebdcb4cdbamr3971376a34.0.1783692272447;
        Fri, 10 Jul 2026 07:04:32 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:5b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm6283496a34.0.2026.07.10.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:04:31 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 10 Jul 2026 07:03:33 -0700
Subject: [PATCH v2] scripts: kconfig: merge_config.sh: keep temp file in
 the output dir
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-merge_config_output-v2-1-8be3de601612@gmail.com>
X-B4-Tracking: v=1; b=H4sIALT7UGoC/32NWwrCMBBFt1Lm20geGK1f7kNKCckkHbBNSdKil
 O7d2AX4eQ7cczfImAgz3JsNEq6UKU4V5KkBO5gpICNXGSSXml/5jY2YAvY2Tp5CH5cyL4W5llu
 hhWmlslCXc0JP76P67CoPlEtMn+NkFT/7v7cKJhiqizdSKqe9eoTR0Ots4wjdvu9fPmZUq7YAA
 AA=
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Breno Leitao <leitao@debian.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>
X-Mailer: b4 0.13.0

merge_config.sh currently creates a temporary file in the current
directory. Create it under $OUTPUT instead, which allows running the
script against a read-only source tree.

The default behavior is unchanged: $OUTPUT is "." so the file stays in
the cwd.

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
- Link to v1: https://lore.kernel.org/r/20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index f08e0863b7128..ec242e03f509f 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -122,7 +122,7 @@ fi
 
 MERGE_LIST=$*
 
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp --tmpdir="$OUTPUT" .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-merge_config_output-d90c161a923c

Best regards,
-- 
Gustavo Luiz Duarte <gustavold@gmail.com>

