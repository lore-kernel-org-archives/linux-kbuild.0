Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB92257854
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242590; cv=none; b=uLxDk5gyxTek8Akgl9zCkiVWQpq8DaqydQhRRd0uepaetShp+y/yKhyAyizA7QZSYWBMKHQhCcMf7lLKyh2sbGJharrnwrihzkK9KIKWZfmevKuiSEpayJGXm7PZz2bwyEaRVI6mYyprAIgFZ+SieOyxgvlLyk3skhZb48Gew2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242590; c=relaxed/simple;
	bh=RRAPtpAYKD4cfGwxNOC6QT4BUAvhWpgnDPyObJltgWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1parsY4Neb+UHZW8YTuKNcbG9BWhdsxjGEXlaDJm0sPzQDSaULpVn63pcYmR1YmBIjXaZEZ/HqRPD60NGA/bCF+rXkfT7ddOpgN37w8bNoVkv+xxK3kGk8iOOUliH56rUuTbONA8lyAfyzGolT3D51pRm/5tzOKPruSNpv5PX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtmV1CRA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtmV1CRA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso5016455a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jul 2026 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785242587; x=1785847387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/FdTYHBFIWgj2aIzUMsnbW+FrCu/VZ/kY6SILWA9Uc=;
        b=xtmV1CRATrtQ6iJ6XVOxX5HheMHvfoj+gGydlgSVGkpJACxWUYkV3p7MZKM0YSZcsE
         bpXKQahYZxuHVwxrZIv7Itsfr0s60Yde3BfJDi++c+r2T8HvGjPSTFmuOXqn8hCKH9r0
         CW8dWrWax4Wl9ksSjauYLaUzFHOqZ4Gnq7XiUOUjjzPSGpg+tjF1yNYo+gRwpjExq0Ao
         mV9IKFR6/ReD3dChKsVTnyltIBzSGb58qs+Pf92RQFXfc/vmNnRJfD+22729WzoS0QYj
         hBXaLsPSWCGtyeU8sjjIuG1ajORqhcX/euDBy+DI7/lmy4TtpV0Ldx28JFYP4wCwY6Gz
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242587; x=1785847387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/FdTYHBFIWgj2aIzUMsnbW+FrCu/VZ/kY6SILWA9Uc=;
        b=gJtNLAvxLAhAKMy3mpEIUGadrUbA9/KxD1VhsApjcip2+e9WyHj0zMTVX2lZzcwFFj
         gGuGVKfYnQsH+43UQ5TYpZwZ2ekSPHKk4UbPWe+dy4kcbEu346+qkwWn9Beunq10HnxY
         mJ0VlqxAM3oKcvrCPKMJBTkHMg0/Rc1TIk3+4bzJuBRuzUpCO5aI6PqSxKq6kSDpOv7Z
         T6yX4lYw6bqpyK0z1NRhpRrkCafXNFPq9ZkUl19yX7ozFRa9zXeC1nO1YX1d61MGQ4Ib
         LvC23vIJcS86s2DkRyUwResDO6VPXvOUS4CcytoDd8b/Z1Szx1d7yOKGxlsHvTgV+HJu
         SNVw==
X-Forwarded-Encrypted: i=1; AHgh+RqP6B6n7CbAhwfEI3EhwSgRZlo0yRx1oulAgWIP9YApMXi2D90ynZwp8aTcNaX8tVo576p6X3uXUUl8piE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMDXdUdIonYS32+bJsko+4aCxKRq9o6nsxoe4pN2xRMM7tVKZH
	M+wuzf14Ps+63bn0EtS2iLlhKYOkz+B2zyHuddtgdggBbU8HtsUxPSQbWj9T438L3IQ=
X-Gm-Gg: AR+sD12mojy66xs1/Hd0cH519yc6iYcF/1fhuQEZ3B47Ro3VWwrk8G9n0N25YTJAZuw
	Pahjp5V+4zXVKTYOwnm2ML1D2F968SbKzOQ69L7TV/bjrZEXu+ffcb0tMYDE8V/Xn6MBlCcT6P/
	kp2Ogcl7/SmPQN0T5Uh07+tktNhwpqjUME+olyqhRfAH3KDr6AjPXeTElYDznirZ2bAc14hEA3/
	gCkxfa/kSJCPznAxCCqPs30uJ3Wx9cqRU9U5hSQpyze2ntwly9vRSSYUqfx9zefjPsECN05oHDf
	AVHsM//bdhAiqJ0MAwCYzfmAwq5OZgjw0vsEMHB1a0yJfeI6BNrLruJ+PlnkWPKSz13Cn5WGrBp
	TRWsiPuOYE9niPD1hDSIlkgtfbf1ZxMNG9sm4sP75LuAp/g5qHRtKiozoTpLvM7pRcjQrTsxcw6
	L3TPt1Bw2VyN6a3TYexEZSL8QzToW8fP4T2V2e0GQszS1ExwrQNffPEciHhhTN+xVwbw==
X-Received: by 2002:a17:907:3f82:b0:c1c:208c:c04c with SMTP id a640c23a62f3a-c1f71e468ebmr108420166b.27.1785242587150;
        Tue, 28 Jul 2026 05:43:07 -0700 (PDT)
Received: from puffmais2.c.googlers.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c902d2sm745805766b.34.2026.07.28.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:43:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 28 Jul 2026 13:42:39 +0100
Subject: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
In-Reply-To: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Add symbol size for kallsyms symbols that can change size so that sizes
can be determined easily without having to manually calculate them
when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
.tmp_vmlinux?). Without, the assembler records the symbol size as 0.

This is primarily useful as a debugging aid in case of linker errors as
part of link-vmlinux.sh, and because symbol size doesn't have to align
with the offset to the next symbol due to padding/alignment.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
I've opted to only add this for symbols that can change between runs
where relevant, in particular kallsyms_num_syms and
kallsyms_token_index have a static size. While kallsyms_seqs_of_names
depends on table_cnt, kallsyms_offsets does so as well, i.e. is covered
already.

If you think for consistency just to do this for all symbols, please
let me know.
---
 scripts/kallsyms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 37d5c095ad22..494852ade6d8 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -398,11 +398,13 @@ static void write_src(void)
 		strcpy((char *)table[i]->sym, buf);
 		printf("\t/* %s */\n", table[i]->sym);
 	}
+	printf(".size kallsyms_names, . - kallsyms_names\n");
 	printf("\n");
 
 	output_label("kallsyms_markers");
 	for (i = 0; i < markers_cnt; i++)
 		printf("\t.long\t%u\n", markers[i]);
+	printf(".size kallsyms_markers, . - kallsyms_markers\n");
 	printf("\n");
 
 	free(markers);
@@ -415,6 +417,7 @@ static void write_src(void)
 		printf("\t.asciz\t\"%s\"\n", buf);
 		off += strlen(buf) + 1;
 	}
+	printf(".size kallsyms_token_table, . - kallsyms_token_table\n");
 	printf("\n");
 
 	output_label("kallsyms_token_index");
@@ -441,6 +444,7 @@ static void write_src(void)
 			       (unsigned int)table[i]->addr, table[i]->sym);
 		}
 	}
+	printf(".size kallsyms_offsets, . - kallsyms_offsets\n");
 	printf("\n");
 
 	sort_symbols_by_name();

-- 
2.55.0.229.g6434b31f56-goog

