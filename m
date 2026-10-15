Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571B59C963
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098123; cv=none; b=G7TpijF+DHXma609VMNH51O1E6rOHHhf+V/j1cGJgG+pxn/pMjTVMb0k3YiKNAHgpMszv82reI0nKi1dynUGs8SoWpNdn082fdgq09hv0MC3wCM/T3m91wF74HdMbuCy5paEpiBHOHSL+Rs/QQn8hGwVQ45BNQvJBZJ+D2YyuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098123; c=relaxed/simple;
	bh=CrId/mzxO173Pii4jucd8wzO7SQYyYyWQ7bm2bVwkio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lt9mRWzSh8Kj/osyhX42Qf/hqKT2kOQDHM4pM3UykN9iJI8GZUtMOCabGOsj2LqJQhq7V4koOwBXpt3QwsqM1Lwj+/0sOBN2mjmO8qSFdf7QnNRurZ9Yd8f5SYk444yud66BM8HyLOaenpbP+xGLpO93GYK1/BxHgd7vzZ8BpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smQXQSlw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smQXQSlw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so5975247e87.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792098113; x=1792702913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycEiSjweMphxeT+LmW+Ybd3KfInm2+XUCR6PcOqNVQI=;
        b=smQXQSlwtFI22NhLDDLPsYXq5WyqNBAY1dwFtXXZKKVitnTjDn8s52LaC2YayRQOfE
         sZezujv0DVwVAT7Nlhlkp0E6xRLsPqN817HYEnc/MkVMMSHAgh2DuafBtGSmTQiQifpW
         Yfq1EkygRejqYvpkx+BH5olOtK5Ey2RYFFFU7KRVYEkwnac1E5NXeA01cAH0VKeUQ2fU
         zabcXiihWbYMfDJN4rfJ48p/8Twj41pb4B7Tct5dWZS95LMaBMn2vG0IM3dPZX6t6hDD
         LLz06EOOWtGkYoO5iebh2G2hdM9hQTEWSDCoXHvcySQXK5U5GofW09SScQKTg5QcU10H
         ZMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098113; x=1792702913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycEiSjweMphxeT+LmW+Ybd3KfInm2+XUCR6PcOqNVQI=;
        b=n8Qt+qD0yHSKHwhl12+QDOIYt6HY7liIZD7Tl/1pvIeg2bJFGkkovJzoVKZp3HEofY
         V5EleQE9Bhu5kDEuqUSk20lKLq/C+/ePTgfOTA3XGeijyYDrLrehZgWU5ZHy2JsKPDcF
         JkkEoLTmfH1yujdGb8/7HUuJgAdrYKeczIPzWT/1+EpvpudQC3Kc7Xheo2qCemWNNTMT
         Q1fgQvHwwYI4lEu/4EA/X2glge+uYw0ffJxZPHrAC2mofF2tkdRwKt7TgCWfwgWdaqF1
         RcTZV4PsO7NhV/cUOgTaE3DvnLoyVtgVRFswa35d2ZRy78I19K8hnnUUkvEdWCirAvA/
         8QGw==
X-Forwarded-Encrypted: i=1; AKwUvBzsjzx1kO5uuGlf/iF2pmS0dK3OAvCMXg/nULlo5dSnkwrP+zaeFwHbwkSaDk3ne56NOLlonIggeANgLIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLof6rshT7VsdqsOXc2sxw8TBGI/yk/V+3BdMiPAl1igC2+uH8C
	dYrSolmEvx9CCVVrGL1ypPBldDAL5HfaNh1P+TL46l7HYqZjYnBaetnx
X-Gm-Gg: AYBFou31nhtdiK3JCMfVS3+vIqTgPC0zWYNR4VNm+vLab60XWCis1ugKHKWjD6GjwlI
	WrTZ/M+fitT66ryv4EmqdvK88FDNy/hb9y0nJO5JnqDPc6POgOdcQSNM/jkfx3UvYADRFKnoabZ
	7ild3tyVAzlIgM3U28q9D40hw1bM8tJW3NFE8Lsk/vMI4Qru9fWrO+Nr0VLRBx4Xx8KZSRzddl8
	aH0ksCCqz1UZRXyydZPvDBFQgp3G7XQAw0FnySALajFI/7LbFUnCXw50ZAn1Fpy8ociEeww/25p
	m5I1BZqp24c68ovtn9FxciFRBIdylnNN3RdHkluljvMuYEqPbEdVDo6+4wZNrDPVebdVHfmZuQi
	AeKQgSo7M+y0gNsWUc0hVhNIb/r+al9FcC42zxNpfWmYhr5Z2mzhNV+N6vFeoM0wyVCBV3lQCqZ
	Cg9UHrsKjg1Zg6GiT61mxLptJNcwHPfMq7cMaO+xOAywwi5iRB7IKFXUiaHuOLr30frFp3QaH3e
	I2i+EC6+0jVZV/YDoCeTJkn+FUZnvVcl6I8Hw==
X-Received: by 2002:a05:6512:10c3:b0:5b6:183c:5c96 with SMTP id 2adb3069b0e04-5bcde6adb31mr7892347e87.52.1792098112887;
        Thu, 15 Oct 2026 14:01:52 -0700 (PDT)
Received: from sc-mac-012.corp.sbercloud.ru ([188.191.29.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm11127e87.14.2026.10.15.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:01:52 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with debug info
Date: Fri, 16 Oct 2026 00:01:47 +0300
Message-ID: <20261015210149.78470-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928105330.25427-1-d.kandybka@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When debug information is enabled (e.g. -ggdb3), the assembler
output file (e.g. kernel/sched/rq-offsets.s) contains additional
directives such as .ascii with offset info and debug metadata.

For example:

   .ascii "->RQ_nr_pinned $3048 offsetof(struct rq, nr_pinned)"  #
   ...
   .ascii "->func); __data = (it_func_ptr)->data; ((void(*)(void *, pro"

The current sed-offsets macro uses [^ ]* to match constant names,
which is too permissive and can match unexpected characters when
debug directives are present. Additionally, the fallback command
's:->::; p;' strips '->' from any unmatched line and prints it,
which causes debug metadata to leak into the generated header
file (include/generated/rq-offsets.h), breaking the build.

Replace [^ ]* with [[:alnum:]_]* to match only valid C identifiers,
and remove the fallback 's:->::' command so that only successfully
transformed lines are emitted into the generated header.

v2:
- Add BLANK() macro for better readability of generated headers
(suggested by Nathan Chancellor).

Fixes: 7dd47b95b0f5 ("kbuild: consolidate redundant sed script ASM offset generation")
Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
---
 include/linux/kbuild.h | 2 +-
 scripts/Makefile.lib   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/kbuild.h b/include/linux/kbuild.h
index e7be517aaaf6..118568971fdf 100644
--- a/include/linux/kbuild.h
+++ b/include/linux/kbuild.h
@@ -5,7 +5,7 @@
 #define DEFINE(sym, val) \
 	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
 
-#define BLANK() asm volatile("\n.ascii \"->\"" : : )
+#define BLANK() do { asm volatile ("\n.ascii \"->BLANK()\"" : : ); } while (0)
 
 #define OFFSET(sym, str, mem) \
 	DEFINE(sym, offsetof(struct str, mem))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..96c2ec50f06e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -493,9 +493,9 @@ quiet_cmd_zstd22_with_size = ZSTD22  $@
 # the .ascii directive whereas GCC keeps the <space> as-is.
 define sed-offsets
 	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; \
-	/^->/{s:->#\(.*\):/* \1 */:; \
-	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
-	s:->::; p;}'
+	/^->/{s:->#\(.*\):/* \1 */:p; \
+	s:^->\([[:alnum:]_]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:p; \
+	s:->BLANK()::p;}'
 endef
 
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
-- 
2.54.0

