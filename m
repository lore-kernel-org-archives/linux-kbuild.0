Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712273;
	b=M4roWykZaoJ/vV6Ei5bgMrB7BhgQWlZHUgQ0sLzOPpRy7O+an91iU1Q7du2SS7PY4GZf
	 Eu5zpjq8eTxcCh84f8PmvPE4VWUIptdvwhC4Qqg5GpZghwHgz/VUys58iUqeKgjf7hSkY
	 WLvdUtBlkfJDPrdI9rHbfpnRHpmbkH+FzHd4ERDbU27nHpsZrXxr5ULryVKUb24A7hCcB
	 vYr9f38pj/x+wMHIJgstcWYkPJWGJFStB5pRElDQBU7/c3u7ENTVqm6R/wmH4Oa9G/fO+
	 +npmBxGlFSB2OCkw/1tR0yvGSmdSgffJ5i1mLjPcYUpl6RRi5V9yRXLcr8dZux259+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
	b=CzgtIfNIxZM/VSqrshavofhMGpDA+lzeqGYX36kagrVTy3TnGDDNTDlbrlctMd+Vsk7Y
	 V7o1zK/7vk1sRXnaEWnrPdLN+sM5M8URPRwseWrwytHvyg4NfBznUrY+U4Nch636U+/ye
	 4u13qg+hg4uQN0cNnCpBVqZLfGqbcrpNnm9Se83WRsSKiY9PcgmH0fCdCaLHynog4zyqh
	 8Cv01QAA1+AtEFbwEvt/SNwPSa5+bg2EtdMOMKhqanUH+ZMmBqW+8sSidV1TROT9GbqAY
	 gYCC9ArcvKlVuKR0Af3OXsxmy0dFOmxoV+E/zJMFdgUknYtPpMq52ZZZAAoQKqQM//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GYdf48Re;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EDF606A31E
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EDF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GYdf48Re
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b9095eeb5bso704175a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795712271; x=1796317071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
        b=GYdf48Rel+xZTNASrIkJh8dJ1IoW5cH+nuC2hdh1PR418OPqGn+m7+jt8YypxOJ42d
         A8otXJRlCUo07fpaKyXliXivnSMaNFYr7KmUtoRuIee85UbSUTZXQejj75mIQpsaPjoD
         faP/LQq5Wx7hlbCmKftVXBr5qUNGigWfi4cHt9QyGZ/PPDlDnpGkWYk+f2AJQ01pWkFw
         I7miyBexbK0gx+YD4RnzrpHxMIA5/Bi6miLbCqwX4STs6UWwW9JtSPrzrppSd6ch2S11
         XLhbtR46XvTOTQW0Vo0Yehyr6Dmdg2jgoCsiaL8pWMLcG++y49xpueNJ0ozoEF7ez5KL
         uO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712271; x=1796317071;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbzDc5IQTnuzR0VW7Y/c20qDWcWC8/2koHRhDseDoYM=;
        b=Y6gAW0KCsGQzxhDOJy/qVM5FpQk38iM0b1/CSrsl3FtO3lI+6BCpj6F1n16tPH1CT8
         Dx1GmZHh+vwDeBT3OE8JJlVGzox2ox3C/u+ttr+r4yBK+eCpO007d3sW4lNwdFyq2DpB
         hjqBTh7Wnh8BnDb1igsw2KuA8xqWBWXMEbJ3Zzd0oTXa1zQT+x1mW+FnK7n5E0pxQ6ti
         I218+YIy1yMSmebuLi4kmpjyXGKHbBYubL/k1WAgD1Bdq38/FBS+uz/F+jLmMKyn32Wz
         o6f6wRGDke4IK2p17cfKhng3tCR7se6lrVHVILJo1G9Ww9y/1Ls0CpMkHdo9Fp32Yglc
         qfcA==
X-Forwarded-Encrypted: i=1; AL+hErHEctVoEek47Qm5jHCIoMsRs2eWK86t1ky5QEZKMDZZpCyCwlMG0+NcdLlZ4y7H/5ZLroI0ZyTq5rDF0IM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CZOw7chJrHnF67VGwJPLT6VgZS3qlKWYtpMyLclvzUBGZCq5x
	EzxjwPJWGUwz3eP4DhLrJNe8SF62h/juWRHSYkFb3mqNOwSbDeRv0gZ95AFus6hHWivcYyATTA=
	=
X-Received: from edwf26.prod.google.com ([2002:a05:6402:151a:b0:6bb:6fe7:16f8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1c08:b0:6ba:a614:2fa1
 with SMTP id 4fb4d7f45d1cf-6baa6145b66mr8005803a12.20.1795712271121; Thu, 26
 Nov 2026 08:57:51 -0800 (PST)
Date: Thu, 26 Nov 2026 17:57:40 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078; i=ardb@kernel.org;
 h=from:subject; bh=X6vteHyIC3rKBXp7WqfXPsq2tsAfRKOq0QrILcJganE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsjlYVXgEdc6lFQ6GaplpkZXRdydVifTj6V1NvolL04/
 n1/zcqOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJH6owy/mLTE59sm7VS/ELF6
 hk4fc9KqgIlGs09GLtCW80h4+y/9GCPDSbdC5eijVdLpExl+Pg98mO4e5z+r1OTRv+eafBstSjq 4AA==
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126165739.2453269-2-ardb+git@google.com>
Subject: [PATCH] kallsyms: Omit unnamed local symbols from System.map and kallsyms
From: Ard Biesheuvel <ardb+git@google.com>
To: llvm@lists.linux.dev
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Since LLVM PR #223686 [1] ("[LLD][ELF] AArch64 Errata patch use
STT_NOTYPE for symbols"), ld.lld --fix-cortex-a53-843419 (enabled on
arm64 by CONFIG_ARM64_ERRATUM_843419, which defaults to y) synthesizes
an unnamed (st_name == 0, "") STT_NOTYPE local symbol for every
executable InputSection that lacks an STT_SECTION symbol in its input
object, such as empty .text sections in data-only or .init.text
translation units, or per-function sections under -ffunction-sections.

elf_symbol_type() classifies these unnamed STT_NOTYPE local symbols in
executable sections as 't' (matching GNU nm and llvm-nm), and
sysmap_omits() does not filter empty names. As a result, nameless 't'
entries are emitted into System.map and compressed into the kernel's
kallsyms tables.

Beyond bloating the kallsyms tables with useless nameless entries, this
causes CONFIG_KALLSYMS_SELFTEST to fail at boot ("Test for Nth symbol
failed: ()"), because kallsyms_lookup_name("") explicitly rejects empty
strings and returns 0.

Omit symbols with an empty name in sysmap_omits() so they are excluded
from both System.map and kallsyms.

[1] https://github.com/llvm/llvm-project/commit/5da7779afdf3

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/kallsyms-sysmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kallsyms-sysmap.c b/scripts/kallsyms-sysmap.c
index a482968eba51..1cb3b1775157 100644
--- a/scripts/kallsyms-sysmap.c
+++ b/scripts/kallsyms-sysmap.c
@@ -96,6 +96,10 @@ static bool sysmap_omits(const char *name, char type)
 {
 	size_t i;
 
+	/* Unnamed symbols (st_name == 0). */
+	if (!*name)
+		return true;
+
 	/* Absolute, undefined and debugging symbols. */
 	if (type == 'a' || type == 'N' || type == 'U' || type == 'w')
 		return true;
-- 
2.56.1.839.g22a8290db9-goog

