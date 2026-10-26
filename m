Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000859;
	b=nrDl4381iOMXXAlIeBnM1X3F/qdvsk4rwArrqj9XWKlMk4PtKZO2IQVQdbIRQN2S5jzG
	 +GFcCCybRFAA0DXCjd0tpJ81BnDUIUoLs44tUoxYJR8rM6cwqFQfyYwlzrI7FNvSDLdxx
	 UKW/qAlS7WzTpuO8j9rUerxeSULQhgCymWojh1h/3K5H8grihbq4efgRvtHBG0j3QjVB7
	 MmdLrt689E14E3OhpV5qnzT1BiQ8IPLs9msdOf2ycorbLKzS1xIRnjo9oUu9bEpO1xNqJ
	 5MU8WwaFwfziJhXZQlvi2MPGtPlYKXpfAiTxR5gtPyH06vZyXYw07yHlESotvID5uyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
	b=SH4OvItM+Xrwa81byJA24G+ZjxCWi7azR4iuLq19begdC2oIXiSORa/Fspcx6wFi5a70
	 Sueh7f11YQV3tweMUFQy+HaQAK1MUali8WpQ/AURY5GH6CO9rsoNL8RbngmlVduq8MBi7
	 i/d4zKm6hlSPmg+dCR/PIPuCaYVGgk5Fx6v5I6NLY+glZQUrwN6G9qrNcpdjtL0S10p+M
	 gDPSQeCwtq8uMsEZqwONK+VGKk9u/80proOTljgI6xS8tcmuDyE2njGLZ8q8TdjeUFnAI
	 mr9sst8XhdRzCAEMlM7+VcHHK6r0yLru7MM7GcxE78bHht7AUVXzAXfowmzkW7i5KDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtS1+Gm0;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5B606A31E
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 07:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB5B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtS1+Gm0
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so25140701fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2026 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000856; x=1793605656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
        b=FtS1+Gm0kC1H4kbEW1IubNEaMyaB3+vSvPRkxQcfQIvIYVzTmS2hI8PTfpI1pjgell
         6qVt2mmVG1i9XoT44Z3lG5Ag1riz4Z1dmRhdbBEg5HAEbo+2D6dhZ2vqw0g2MtGl+u89
         4F2DPmWtulDk6aoJHlO0Zz9iXd1hMOZzqXcifjFPcrbQbNl9o+7fWnmoUVNOrV+Dz1OV
         SbnY4sDScnKYHj+ZkmSeHRkSHwF98TmFASHF4pB3Ee9emDWTaKm5IE13hvOisqzCZ7GN
         gymjKvSA36puJtisAImmXGrIMEoUl+cAL6EpV6rPxw5BDKxufjEjTlIg4y6oFYt/5/HZ
         jWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000856; x=1793605656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UuOcKX5/sC1jqJ5XhioCcbGcHx7M3qqzB+X648UiWE=;
        b=PO7jaOuSCwX1gBIiBztsbALgK9NYxml8GzzmmzNsQhww6NUGR2W6WKi8PhwhfIQqCK
         EOQDyHOpT0WI06A65nDyuWGBPwN+51Ap1QeWynKQD5UGlI7254jPte0V5vN81xKuFxBv
         qY2NLNjqWOJqm3t2JNY/ZUk+NYCyUzBmfFnmeHvm0ZUzAZ8vi4KGoiWDlTg92yLo/Wjq
         wWrnpMV1kt6XBw+8xaWGElDLwzlqQTtC3okdrevEfoBXVEbJCSl2SxSRgMXHQEEn/MGr
         ZG7G+YhuZ5FEMxwox4mSNh5iAZm3ph4TGCDvByeALEM+Lm6c7SRWnubGtUQqoyxDXfBu
         ea3w==
X-Gm-Message-State: AFq9FYIxl3jTQja4fA2JjcMndh37XIf1XA+MP9clIxcD8orss1IhYt2p
	YSnHw5lkad5QIMy1wO4ewldx699wcIQxtORBfIVqKavfIzcNAIyR6tSjVy1s3LcZf3nY9Xod
X-Gm-Gg: AYBFou21QeaSdHAynqJq0UTkxw39vYLf1Z3BbUtFyFNuClZe8BZynTM+4mjMCRANUqT
	dG9MQVHHGn6qw536PZbY2quHFur0kbBAm9XObH4c+3wjNGt26ltvi98D3b00y1oQWIBacSMUdXp
	gW2hTeMKvUuAHJZPduoqnFjfiIZPHXRDN0nc8CJl5xPA3wYbHuRtgOKQ8U1hpeSRNz0tXbh2+LK
	4N1glJQvr0DpXr7nOtPoZQ90DJJYleDOMi8Vk4caE6QEo2IDHupdV7rMML30Qg6UsWxg+yGdPdv
	90Gc29YWUijBFvb0111Z/xhWdpFBgcJvgL1zTSQ0F00KTuOA1YVfqJ17aa6GZywA1PUiatPEwSu
	W1MfXbcgWWTKigmN6QUNMm6zyjmSjRds/ru0hDQfm11UoKUgzET2ACEF7yF1Xc5eBoFfPwfMZTu
	dwNsrKtyhEI6+PZnGqm6QCeTr5Id01IvOlrPo4nqUaKxWvNbhBFNLlMFsfZfojJNLG7AQ9jsqi7
	lXS9DiQFfvCQjTbh2QrFocgfGyFAxoieFvvR1wTDce0BJoPAX3UGihi8HLdFKVQ18rMZwauCk8r
	rCTL1sG3BxMeAJ9aqCglEzcl+TDOxerukABKFNA=
X-Received: by 2002:a05:651c:19a5:b0:3ab:3d02:d03e with SMTP id 38308e7fff4ca-3ac6ff34e59mr13548541fa.3.1793000856228;
        Mon, 26 Oct 2026 00:47:36 -0700 (PDT)
Received: from sc-mac-012.corp.sbercloud.ru ([188.191.29.26])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a463f5sm15727121fa.36.2026.10.26.00.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:47:35 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] kbuild: Makefile.lib: fix offsets generation with debug info
Date: Mon, 26 Oct 2026 10:47:33 +0300
Message-ID: <20261026074733.11777-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928105330.25427-1-d.kandybka@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com> <20261015210149.78470-1-d.kandybka@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
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
v3:
- Check for ->BLANK() at the beginning of a line
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
index 0a4fdd8bd975..90422215046f 100644
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
+	s:^->BLANK()::p;}'
 endef
 
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
-- 
2.54.0

