Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC141A91E
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776928; cv=none; b=eFoDLhFr/HlRljNXb3/ips1lmqS0dlyZyhFKoKOvhpRnaKOl0vpkcQSGs6M0nn4dpXhxrhDARMROxrpsrqAY0aN6+Oywpew2TRyHS6ItYZvx4X+24yJ115ieV3RshCUPaB9O+3YtGQ1oqeICKSmwfrZKZ145UNZhqhBbxEg/mpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776928; c=relaxed/simple;
	bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0pwWNnkCMQ8xTpGMxTSh5P6aRN1odg+4yQ6HW4ULM1C0AscxnJucEYWtbjOhkupWLZTHyvaK3snNS9nTsiE5fhFUuSOH9f3QZHbKOlSCZYN2JfxKv+R2P5D3C5zjSeoENK8Lf0XLiA0c51TjK+N77hfqvuBbGy8zOINh0sIjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw+DCwTA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw+DCwTA"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e6f0b4610so40383957b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776926; x=1786381726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=gw+DCwTA4CrfSN0t7YePWrnv45/QwK+Yhe6YjF1Bs9BoqoJUiOIgW5P0oriJC1zJHv
         iAqms+hXRaQKoKjDuO41hoEf1CIF7NjKXS4FyEY1RZsBF8PTDI24ee1b8PczEnnUcSov
         LiuMk7O4UnE4W/LgLbJNvV9Wlr4rYn1bTd2aS9YEAs6/AOR6USW4nK3cSKZL/CHc2i0F
         90FP72F8Yjq72YXHFGwcHJJgBl9suC9eOQXbJ8/69tfWsrHkCxUShd2D2zxqFOB/1cCj
         xJHIVZHQ4jATPD3RAGaHMXRTehGhITcDfUKyJyOg7QyXRfprhlo89L2dhLjqvExFBFgC
         4Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776926; x=1786381726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=JMz5OTZEcGah5xovM19hPZrQBY9BZZ25fc9kzITUPYmOSIvxB24P31R11+NlNCeyR+
         MgDcO0YVoMg9tRbXODXkhGWWS/mDQIUwXTrFljH80UIFicbxcwdHpwXprnYIXSv4iCdN
         An10uqwzgaVnPGJVTokfjczzjJyss+DMc9fT81x2yhJKAQ1WBoFdNRjsfDdHhJfEjPXP
         ke/NPIBgbVb9aWXm/jCAE2cKQB6tSD1xe8QikiBK4WK2Ty3gjF+uDjR5s7AFgx80t5Rc
         94sDz6+blZhOwX4qZhCWnM/+3mjgKwF5fNLuUPKQrxsLLeK6NH2OxmZ6Zu+dzL9phQ/f
         oPqw==
X-Forwarded-Encrypted: i=1; AHgh+RoV1M923gEnrrSBiZr1N+H6KPvdrK22LiaFiT6Vn3jmwXc7tgre8HudpEG8Az+wczi5ikRSoTYmwM9hrsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygB3DoY4rB/1F0MAp+Md1wcVGUTabE++eyMym5d/osj9Nwzk4F
	6cEhsJSgtJjKIFZ8dJpY4GS5argGliSCWARxXpUHsSYpXnEHS+dx2UVj
X-Gm-Gg: AR+sD11eoYIsyLr8e869ZSOw63O/wp2sEeRMd1JY6FaEoNv2SrtyejlQcRnUAZSWd6Y
	XIcnDJ0j306REdffXy+ZglNyp0ZDzwYy+eCjb+T8jGraJqoqIld5cP+3ZRu4ScZzmG1rXZJ/uwD
	DbyxmYoiUGowZZSt6aiwZaex4Ht/KDs8UcO68UkSNb/k+GGL6sdm+sa+/9sSwfKNVRv+I2ps2NV
	7Gr4wcuk15M7V3avKaoEX9TzGmKtM+GktYxwQyoPUiruai2q5glaFCo9W4HXcsvTpxLMTIBeJNM
	piduvulDKXbCTTC5vt7mcXkYUg/wFTOxLf9ZIXkUAvx2ZLzFBae31WorbPnz4GAxwPoXqk+RMz9
	Sy5ijyaxkA7Gm8hHzdBIeN0snrNw671hbr2jDfoc5vwytftiEsF+WErGV+t/bKmDSFzadzo1OLX
	/CimYcuPRaVdK9YRN8uWiCi5o9n7ZYhoScr9YVGs3vn1VzHLVsyeWEP7osgaip
X-Received: by 2002:a05:690c:6081:b0:81f:2403:9e70 with SMTP id 00721157ae682-81fd4b4af48mr139827077b3.19.1785776925809;
        Mon, 03 Aug 2026 10:08:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2cae7sm58991847b3.2.2026.08.03.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 13:08:41 -0400
Subject: [PATCH 1/2] alpha: enable building with clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkuu6PPRZIy51x96/X9GXXfd2znlU/aZKLQkChXzc
 B9zzFrY8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNfYr2Jk+C8svOPN2t
 7wRraza+7dM7J6Wb2/wvS0r3jnnVU7QiIa1zMyzNsQlhUdOkU04/SaLevnVV10vuDx/+uGPy77d
 3kbdfFs5wIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register the clang target triple for alpha, and pass -Wa,-mev6 only when
building with gcc.  That flag exists to stop gas emulating instructions
the assembler thinks the target lacks; it is a gas-only option, and
clang's integrated assembler does not emulate instructions in the first
place, so nothing is needed there.

With this, LLVM=1 (and LLVM_IAS=1) builds work.  Note that the alpha
backend is not in upstream LLVM yet; it lives in

  https://github.com/alphalinux-org/llvm-project

and is a work in progress.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Makefile    | 8 +++++++-
 scripts/Makefile.clang | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..54283705911f 100644
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
+# understands -mev6; clang's integrated assembler never emulates.
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index b67636b28c35..2434cf90ad7e 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,7 @@
 # Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
 # endianness and -m32/-m64 to set word size based on Kconfigs instead of
 # relying on the target triple.
+CLANG_TARGET_FLAGS_alpha	:= alpha-linux-gnu
 CLANG_TARGET_FLAGS_arm		:= arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon	:= hexagon-linux-musl

-- 
2.54.0

