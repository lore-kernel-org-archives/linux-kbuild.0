Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC383BCD15
	for <linux-kbuild@vger.kernel.org>; Sat,  5 Sep 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612058; cv=none; b=rrJvTDDvgxzMIXmQuXozLYlanQzbU5DtgkOrwNg3Z3lb5oXXFJpmXWCXRkFmPpjhm/Zi5oD5b45MXGVkpBUBHe3/v+f8DTb5JthC6X+Rvf/aqavrJy1oL+cl2gyyRr8/5FRmKtBRWX5PQTa/RDCm63FHJr0PF0W1p7YRJpVwMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612058; c=relaxed/simple;
	bh=91ejPOUpBNQRSTphrYpjdfpBj6miXLi2eFQAv88zwKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOK9TjgUPbYQtoGkFOVXdVOR0oGFvVc5DPUMx7IbbFzFY/eX3sujFSBpm3NDvnEXGDgZaabl3t6u3JB8e+XMWfJszOPPPcDRlQIbWgUKqEuWV1bjkjKWgu7y+vlLhrvgWtap1FUX4DwgbRi/luq/k5K00u69h8fxLuXlZbVuEPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSj4cd7q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSj4cd7q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so14536905e9.3
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Sep 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612054; x=1789216854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KskTBUozJ4EcI4scTcf0nV7JQH2rdRSj0aYV0ycw1Rk=;
        b=hSj4cd7qHnjjTmSpoSN43uIJy8zqNIVFFg9BSmEpSvT5gdZBIDAQ7zVyf2w9u11aIe
         cJB8bvAGmu6odUHoB2WTg6psuY0Wx9fsCdMze+MU5QTqDgVoNdjYE0zoQBN/vbsOaZfj
         L0+w6bI5UDJ5kAIIacikd5zxmbK3f9rb2x2yi4kjYfGB1GaQ6qgvA2Tnn0Aby4EBc7LC
         XbJAa2AXE3jr576Pa348bwMsJeEnGtTnkk5XPapLD2jpbtQoGNp+l+LCPnmYJenjhSca
         YUFAQt35totKmcZKJIVa9NHw9ua9SgCs8IBOl8SinqQN13xoEydJ1xPW3OXVvk1cHJvN
         xT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612054; x=1789216854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KskTBUozJ4EcI4scTcf0nV7JQH2rdRSj0aYV0ycw1Rk=;
        b=Ppy1GHBX5TTbUDhwUdcAnsHTaVaRe6MbLvPY/voB95a2X/2XpP28QJPefJBaKwpQhL
         vCJ4rZZu2nMuNK5ora0rwcPALzTbm4QiykyPgRR8QEcoYNB7hrg8QmPwWe2+eX1Zx/yw
         6XsEf6sHBPLpzHVETWccHFyBOmkILgJjv40/ExJXCO9JZ95GXMRNBiFca4N/YnvPwJrA
         oegHaocrLMKg86GSDZ1mFsewD1GfPwCXcYSDJq/yacZWdPVvC/7nqCp4xeESgKBZAPHk
         82AvQREKJGtjuTy/ZpNvngGMrtD7FJUsQ8FUmFj58OKgyA311dWtnpyPcW4/wgK5nCo+
         KK6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzygS7IU2AxI+SBZ3JcgjCrBOfquAUvKhGsk9SfKKTvdtnlANLkXQvJP2msJLRT0VE4LPERq8LIVugG1XE=@vger.kernel.org
X-Gm-Message-State: AFuF++k/YhcuNr1anjt6FapyGRxDR2fBoVwoAvF2I16+TJRjZo8Fba0c
	3Ydv/go3O74oO99iyrFLzX+9UcfqMkK06vEWXB2pUMLgRtA87lYmfxQn
X-Gm-Gg: AYBFou2mwT+zH6pnIYyyum+VVefcU6hca8J4IvLw9cZRbCHVHwLO6dMzAzDsQ34UBJy
	SNgK71aZbiJPSFAZH/0d/jjyO+vWr7VV8DPqDe6l1DrhgcM9Noll0z7WjFzGcPb8kLW7iSWRdKP
	qdzWlz3ER+7rZNUVPXcR/F69NaJaGYe8zUZzHpeWFCD6MytEeSTXOaw17ozXsN+3qjDJWfUr18b
	mXBSbrSNm2Bcx+b2o6IeDAzfOmfMpRYem1eFdqGy1PD0XpDYeznwiCUcj4avb4bN1EBnYMcBFzG
	6ZHvLUNk4wTwHhhsrXeiJY4sQ6IUSDNuOk/2SDaJpaNUHlRdhZ6f8J+8Wc/t3mU9sNL1aopbniD
	zSBSAIpxhLz9c466P3jGicfo0uJg5RnPszWi5AkOGbT8rq221Fo07TAOjyS6eFOQwES6tIYjBtZ
	85jjUCKlGWiG/t6daLIl8Mgy3eYEIP50DF0IcbjSwM4wSrudeoxLuD41sKpQ153Ta+Mitw/sBUr
	4VvSaNqbKCdtJE/9uI2kQa0CzpX7b0txAKd0Lw3Tdr9iUoTV7MiZ/4FDYvKm/5aB0IM
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr89384995e9.23.1788612054317;
        Sat, 05 Sep 2026 05:40:54 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm87742495e9.14.2026.09.05.05.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 05:40:53 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: kconfig: fix shell function syntax in caveats
Date: Sat,  5 Sep 2026 15:40:45 +0300
Message-ID: <20260905124045.42713-1-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig separates a function name from its arguments with a comma, but
the caveats section uses Make-style whitespace in its shell calls.
These expressions expand as undefined variables rather than invoking
the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
example fails to parse.

Add the missing commas to the shell calls in this section. Keep the
Make examples unchanged.

Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

The issue was found and this patch and changelog were prepared with an AI
coding assistant after a request to find a small, verifiable Linux fix.
The assistant also prepared and ran the verification described below.

Validation:
- Built the current Kconfig conf tool on macOS with Clang, Bison and Flex,
  using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
- Extracted the documented working CC_HAS_ENDIAN_FLAG example into a
  minimal Kconfig, with a test gcc-check-flag helper returning y for either
  endian flag. Before: syntax errors and no helper invocations for either
  CPU endianness. After: both probes execute and CC_HAS_ENDIAN_FLAG=y.
- Built the changed page alone with Sphinx, treating warnings as errors.
  The complete kernel documentation set and kernel were not built.

 Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 6163467f..e15af278 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -225,7 +225,7 @@ not work::
             $(MY_TYPE) "foo"
             default y
 
-Obviously from the design, $(shell command) is expanded in the textual
+Obviously from the design, $(shell,command) is expanded in the textual
 substitution phase. You cannot pass symbols to the 'shell' function.
 
 The following does not work as expected::
@@ -236,12 +236,12 @@ The following does not work as expected::
             default "-mlittle-endian" if CPU_LITTLE_ENDIAN
 
     config CC_HAS_ENDIAN_FLAG
-            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
+            def_bool $(shell, $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
 
 Instead, you can do like follows so that any function call is statically
 expanded::
 
     config CC_HAS_ENDIAN_FLAG
             bool
-            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
-            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
+            default $(shell, $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
+            default $(shell, $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

