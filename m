Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710A2F12AB
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Sep 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524409; cv=none; b=mvVvJIUB8UhMs9ZlspVfn19borvw05K223cHo9Vn2nnuB+lSPsoUxO2SdZImDlKQERbdHCnBJMJLZrmeyM75yUx4rbP+JDwawrJMzZ4Ufm3355493CPruyxuBEodvjxK8Mtb+r5/kjTqUoSWIy6TT74sC6r+bOfMJ6PUo9z+GvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524409; c=relaxed/simple;
	bh=6WG/j/42usMvEDWPvfaoAPfW5qGOhIQ7+bs5jOjNyDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6fzHr3OjWai+QrRTqDCDHk3pQMBqLBAcfokz7XdbhOcgKDHi7M4XlVbWeQEQDGUHRc8Tu5QzK1HC0pTQRb2Kaqi3xim0Ye3zN1be+aLxK5yTsAJqU3RhoYrrMsUMrRc49OrmIlb/3POh/QL0M1AYQeDL2vhwiZ6kLdBtcps8Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQO8kBdm; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQO8kBdm"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b39befc6a8so533153b6e.1
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Sep 2026 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524407; x=1789129207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7YwV2cu1u3dK6SjJICTavcZa0kMWgQZV7MXvNHx3Sk=;
        b=iQO8kBdmN7p3zIhWcrKpJ5D3e5zGAwCLPXBIHWKqpYWakNYXGic84Nr24KeWHk9u/M
         jdrtofiZIq3gZZFVNLKI0H4D1fZ0VSg0wbrsgA9tOx9woWBDMUoake5wOlNWUK8O0QVf
         c/uwtC/NtAqG3TBHyj4vOoB1xG2wdGr0ljnnWzYK47nici/gcFX1dsmqSW/Pz6KrR9+z
         x52Vhaa4hFFpNnVZ9mZBxJuIA5Jrrr9zzdkx7WiZztnpc/vZI524gU7RFvELygA2odQp
         FFGYeFLmzRgpJkjv11mN2dTJEuesxmj4BQJu9arWKQFWsP/0PVmr62iEf86KYTHuPXKW
         j+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524407; x=1789129207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7YwV2cu1u3dK6SjJICTavcZa0kMWgQZV7MXvNHx3Sk=;
        b=gvKzToNtLUCdpssL6sarvFj6XRMw8a6u73nTRYqsZ06n/FGF6BnNRVqzrR4sv2QHsa
         Vp4F3KiFL8CeFUDkShJ7cZU//Oe/eBVJjVptYwroC7eByZyjIt2rigGApe6tTqPM/ZKN
         3qFICfgMfBkl6Pl9Td0caP1QQu06uQSJLzUC87OGUVK+yU/ofZ+19xymXKNWraJq3M1Q
         i5XTJHZ/DcCKCZoeSWUKXcbvrgpW3zihVKT5KaAy5tz063uRtCRttfDrq5/2Ao5j1I8T
         kwo7wvyZyeXiQwlRI12HU9dA6SsedS6YFHr9xrqcOyP9vs4fu3hrvr2LI1HSNch5ofhd
         gmSw==
X-Forwarded-Encrypted: i=1; AKwUvByvwxFq5S3iEk9RpvTD1vi5YTHp8XjNB6olRi1B+Rbern4ocqG6GTToSGujkT8c9/18a6iRB8VM37Wm4n4=@vger.kernel.org
X-Gm-Message-State: AFuF++knPZ2YWWtb6GyQJr3KPsWSWF2jBsx+vIqjDi+zuD1mSlmqjk01
	cBLOEUrhpC3M2+hdWgscLgctvjKgLNI6zV8Gro9DSpDol4IRrLKWLpUZ
X-Gm-Gg: AYBFou0h5tdrSdStXJJfgdFO/HgaGCeyh8NtK4j0xLUASjMAks35+yN2Cy/ah8iqe+j
	ytDLKxTor4WMzccxGSe8443m3C//ZPbHqo25aeZtWLBRgiJhqQ6cG/vYlXV3vqu3TTg5ewy1oIc
	SetP6g9M9O1Qj9clFKFzf0JW0Xi/HgwA9JHxZw3VPIPYqg7IJovmWRAp4PSViqSXg/eW0luTRAQ
	11Yu6vwqIpRREYPpVy8yQs4Oed70PBsYrWr3BEGMhsxdF5Pp5PrXcaZwFgrBy8NHFEt5WQ2W0cX
	ZiXcaP1w+XBu99ZnTHo1EhkVA8vA6qQ+zdy21mjxSOHodorlH/A3NvfZ/26IeaEhFODQwPKnoKJ
	uSWtdhD81SguZ8WVqrfxyQ0Uy4yz5sDO1WT13gIkW+jC5FLbFXojDSxdXAgaP1vA94UFdOfwzEF
	cdn6tt/OjUGgFAdZ+f0wDZqF109XuBiWHdrKkdb6ka8cOcEoRib0d36QNUZeeUxQbQTqnAezEMk
	T6PqPuBo/iVbu8=
X-Received: by 2002:a05:6820:2017:b0:6b7:46fc:1d7 with SMTP id 006d021491bc7-6b746fc0274mr2277743eaf.54.1788524406645;
        Fri, 04 Sep 2026 05:20:06 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm5634125c88.6.2026.09.04.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:20:06 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: fix typo "funtions" in comment
Date: Fri,  4 Sep 2026 17:50:01 +0530
Message-ID: <20260904122002.27960-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "funtions" to "functions", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4ad67b737af7..698ad1748de0 100644
--- a/Makefile
+++ b/Makefile
@@ -1144,7 +1144,7 @@ export CC_FLAGS_NO_FPU
 
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 # Set the minimal function alignment. Use the newer GCC option
-# -fmin-function-alignment if it is available, or fall back to -falign-funtions.
+# -fmin-function-alignment if it is available, or fall back to -falign-functions.
 # See also CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT.
 ifdef CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT
 KBUILD_CFLAGS += -fmin-function-alignment=$(CONFIG_FUNCTION_ALIGNMENT)
-- 
2.48.1

