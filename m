Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FD3D952C
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Aug 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956164; cv=none; b=DwIxHgjtT88+LjUhbt4fS53ljrx/Kt+MnymmqK6HFjfagB7PRIf53e33M4FcHmmjxs8jSa+mDlfyEC8zR83VL3kD2FBYHLNVR+FjeXFKrn/nFeZm6ww4F2SKA/Db0L8EU9aSg4vSens3Cnl4CA+d9GHy6MOdKqbnwnBBqtAvy30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956164; c=relaxed/simple;
	bh=X/sheB2HerNRDwMRSjJhuRwSfkYyfYB880Mu9Bm0zM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtZcx5/pI/l/HMX5/RAdCFeCNvuW1phT3Q/XG9SL5RdWbCh4xX+QfLMPIjgMuhWSCMjVQHrxet71pGXs6ZHV5BBrRY/BE9jWaVzX6IzMI6B5BOXdusD/qCDntnmNW2jZZysF2Pa1S1tpi78hJF4tnbkbRpwSWxSzrn3yKvemj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPmT/+uL; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPmT/+uL"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81f3b227a4aso21980697b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Aug 2026 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956160; x=1786560960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=cPmT/+uLpce8SKENudlRxESni5y8tchI2GJAosBoI7UNsrQMWVUhdh9jGiw2DZSV3H
         bp7Eh1iJAmwk4s9U3Qby6oTesb588lrHrS7I5t4S7vlckBf7S/TPaiqgACP2vThFKX7I
         xIfP1M5Wzw7/8SQOq3v+tFtzbC/IA6Lol1iUilBa97PVQtznFFVu/1Ssy9UF8JOQD4ob
         POu3Wb+N0sO+szx9u+5tXoLKOMb/X+pJYE6Ejplh+vSI267sq51g8pNlDwt7KjQyXfuT
         8QLyGCDhEgbEK7vk/h1WA897qVGW04btQT9Vf7QbbrdcMhebtUplbdWrnlgUnhCet5Xm
         S8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956160; x=1786560960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=RcXtwC/JSf9FcLYHmEr0NGiCda1f7AE9qAsb63GeB8FJULGcCtvjihtBHgra/MVJMH
         DPMhOaPfRangUnNPEfL8w9hLNGHuKYkYSb0SXfySuONDSGgSkMh9crNYruAstc/8G52y
         SVLDy2icsLlmGOhbGsixCUAmaxmfvWlZJ1TK9ma9eaoq4bE4m09TojbrS4vQxMTai8vm
         aJZ4aWTOU+EJzo4nNYK186dZnpq4Eo1wGAlvrLMW3XMedOwaZXDr9ZjDyCHUa901CB/1
         SuHBM9e3CtN0AUljQ7+xjCbNbhq1deJ6dKsADtiQ/ghM2YIZDIMAh9E9QwOJgprKkR+d
         QgbA==
X-Forwarded-Encrypted: i=1; AHgh+RrBaBvyOwQZDBd0fA49JPTjPRFCoE2xbqnLxzU6ImP+c5JgQVcmUxk0ymADjOnCEYcGxmB4hrBVgjtBAus=@vger.kernel.org
X-Gm-Message-State: AOJu0YyON0bKgvw85hrtHrV96qDh+PGqebwIoERCj/Bx1BBBxJZdRmrn
	WWr9NFu1v7/6liAwmk+GOwTovxVN+ZlGDRoPylKVQ+hEIgODH32NxRlf
X-Gm-Gg: AR+sD10LscHloYOmKvzustaML+E9KSj4xQm+N5n9Enwot3LBfn4Vf9i946z3s3GD+HO
	9lvfBt9fyX3nESbemQ8QJmQNmt0sY8p5YEoD99Ka1VgGhHx3FWq3ce9CTjfoCd5aWvJz5BX9PVN
	LYzZf6LbGp3ZV7qt+jnk1+lMrzFvooHvu4DxgGdR13WtwdHb08Me71RcjnbZnzifG0HvtG0Kd7h
	pii3RYvBxftTU+8hkEEAfSGF/9jmdeNLZ2OFPqvNPlxAuucPtUHwTR2zbmS9oAvfa0mBwmaCQpu
	v1CgJLnFIRXrHa4b94XcqHHoYfGh3rKn3Otz5rJsaWEAGuyjDHLGnJpAWD/KpVQzVqWoj6yovw+
	18KV4gbzQdmA6Amw1HYj2QN9Omxes32pk0OKXVy5XQ1Hkl68r015ILFrKXKvCYGy8nD+t5sz5tf
	tO+eDWUa9xdTUup5Ad6Ew0K7v9E+MbZaK1DZ1nzAhpm00rgPCilJV80G0yt4uK
X-Received: by 2002:a05:690c:6212:b0:81f:64cf:2c58 with SMTP id 00721157ae682-8201bccf8ddmr51869547b3.6.1785956159995;
        Wed, 05 Aug 2026 11:55:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131d9135sm25910817b3.6.2026.08.05.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:55:58 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
Date: Wed,  5 Aug 2026 14:55:57 -0400
Message-ID: <20260805185557.3283233-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That flag exists to stop gas emulating instructions the assembler thinks
the target lacks.  It is a gas-only option, and LLVM's integrated
assembler does not emulate instructions in the first place, so nothing
is needed there.

Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
still passed for clang builds using GNU as (LLVM_IAS=0) and omitted only
for the integrated assembler.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
for clang") is unchanged from v1 and is not resent.

Changes in v2:
- Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
  will be sent separately when the alpha backend is upstreamed to LLVM.
- Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
  so it is still passed for clang builds using GNU as (LLVM_IAS=0).
- Reword the subject and commit message for the reduced scope.
- Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com

 arch/alpha/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..7074602dca94 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)	:= -mcpu=ev56 -mtune=ev6
 cflags-y				+= $(cpuflags-y)
 
 
+KBUILD_CFLAGS += $(cflags-y)
+
 # For TSUNAMI, we must have the assembler not emulate our instructions.
 # The same is true for IRONGATE, POLARIS, PYXIS.
 # BWX is most important, but we don't really want any emulation ever.
-KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
+# Only gas emulates instructions the target does not implement, and only gas
+# understands -mev6.  LLVM's integrated assembler never emulates.
+ifdef CONFIG_AS_IS_GNU
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
-- 
2.54.0

