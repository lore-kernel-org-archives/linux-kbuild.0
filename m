Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920359;
	b=Lmp3p2ccUyAxr/JaljdRoAf83LbuVfEcDdaOS+l0IabhnxAQdy9H2+HaljX4M/y4lgRN
	 1YwK+o+CmJLbmVG9ue2RIpRa6JrQP1rd4KrBMlFiR6B6GPWy8wTb1F7MHqvV6nBhRAynh
	 ar1Mfo+ri0D/TjxX31QYbaE4Vi9ugAfRhg0syZoPldIV0IJN0CCfIiM6rF6ybjABCmJEP
	 9279NyJ4o2bdvA4ynqRyQ9bMMfSvcEy6nKazLp+bIekuIH9tzWb3w9UUJ0kexjXMAWSds
	 zh2k6+OceUmplPQE36CIOfZM2Ye7LUCUtJZtMM+lg/vMesdvXhUDLDLnnu1KWvvsymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
	b=iOrofuw5MfTpEUn5qSB4hQ1LHWwPrfhawn09Sak6hfHEGc0tgeqIOiGxvU77X3jBtw6B
	 HeJof2hn3lmfMsBs3FvNjY9c8agaXdVyeWi2R0MjsI5J6JuvTT4jHBlvAdIp7Dv75hvGq
	 mDwR1YrjUR/vL0oT3H8okdERPYr0VaAa8InDA+PJcnRM6pjvyvKEpxAlQwu3MKfLZ/zb/
	 aQOHp/KShq7fgCvELHkcfoDxGS6fiirC29xMxIQkVdjWQr2rYRwzuotyyf9+aSfuwS0ZS
	 3aVH868sQl9vXfKfzOlgaPi48X5ZSI0HqzSv/WQkF3KK+mQEc6pVcTFIF3fo1oGVeew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GPyWKVmX;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA35606A32C
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 23:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA35606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GPyWKVmX
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so191025c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Nov 2026 15:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793920358; x=1794525158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=GPyWKVmXbRnHFHyAlQNZfvqo0xBU3poeqVkh6j0bhZztW1KrN3eCJPerMSo1gDtO8c
         6JpfreadEoFpRXdnLzNopzlCLOHXCQN3whZcr9fISD2NsgfstmVO1YWJrPvV3g+TutE0
         VtHd5nvVbO8rWPla6m0WZpDaMDYdRk68NSnk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920358; x=1794525158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=Mi1kFE7JNdIFn5GQayHjF2dAdi9R+0jYsr8tnWFz3mIq3ZkFA+XY7gQOoCLu3Hh9xM
         3x3tZi41msVOLoUZm2xDZqZgTL+Mgn/mHUICmURglQo6gyNtO57y+6aiov1XBPOfzWr0
         8/qCU5Er3Rcp/JVxXZZmtSm/ugqhOYU79GHe2fETJHz2jhmxFozTE34MGHhgbbOwnH7G
         SYAzKBbUcMX7Wi5mEtlKpNOG6YmCzBdhyklk6NSjy2AGuNNun6adgI0Q71RVqWOZnZGA
         7wFzvxwdZWSQG4N4FPQi8WFDIzXOCbZGwROgNg69wwQy54Xhp4X3SySdZAOKPhxTOHXJ
         hAiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxisy4F0EILu8qFka3kxdVb/PDHdXFqFEoBrGXI+z8FOfAjO0FzPoKqL6QVBJoK9WHXMgFQPbbYYh/js6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MTu4Gu4wic4JWX7iOTI4hZvloZMFCMx0OhVuhheQM3i01Zxgy
	k/Pgw+bC71YCrg5mjbE2gkvbeGMPST4Nrz88dV8mJx8pUu0DWw1RwewMg30xnn7eUw==
X-Gm-Gg: AYBFou07jQsbxf9MO5ssnzGOqbhvOdw1Ckb7U4mps9RxwCu1ffgQrKCv6Vmzfm6UgIA
	dpz22ctsZURR+z9U3p6JWsnzaNDT70VEv1fiYZkhgO1+qFj+dV1RZAojhxrLtHAfY4Ag9c83sKJ
	F+mtXa0uZ1qQDF6CdZJ0HUWfEheEqyGSLh/IBZEBXrEPYHQICxTHvOi/qTZqvpWlh5JAPec+2lb
	yg75bjhsEMPe9FR83k6cHgPZ7bshADN+pOBBX9OeuAgiq1C+J1u1KhPAFonwsxUdxLH9oxGIVSs
	j/ICWa4wvJbV7HEsjMivm4Yd3LDse8tRs0huNgXm2Itf4/AAwYq6ZtP17aOMQ0Xc7ytrGokdATo
	s/genZSXlprZAKcHOLJ/EAdbeu98hYad4thpZN6MeQvmc2fsqlhoHm2dgfdraI6gSy9kVSv/abG
	cm9GYBiqs+CIyd7ITbqWJs02TLl7fzcZwIg5+8h0uezfLeefTVgfSm6x1Uc/vros7Ad9bdfm7jx
	zXv32/Sa9FmUNZMZ0AU6s0d4ydlam0ONnOkPMynS3ntld+hZipJBhQR215Wvgvu/iJehivdYqJJ
	yRnZH4SH5K3d/WCePwUnC4mAZjpPeDejcNqgNKLxua8k0WneMRAPi32JBatyqNnQcjr4Jrstrqi
	c7SogGAR1Av57UA==
X-Received: by 2002:a05:701b:2905:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b25d338dddmr562194c88.23.1793920358113;
        Thu, 05 Nov 2026 15:12:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm312961eec.25.2026.11.05.15.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:12:37 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Yabin Cui <yabinc@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Thu,  5 Nov 2026 15:12:00 -0800
Message-ID: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
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

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
SampleProfileUseProfi remains false by default in the LLVM backend and
is only enabled by the Clang driver.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/Makefile.autofdo | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..8754b60ad2ab 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,6 +13,7 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
 endif
-- 
2.56.0.455.g6c5a503b38-goog

