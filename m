Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510657;
	b=Wi0atrG148UA20G0rWKZ7VCqfNSVvHCBgHxO/xfowcJCyvwyFDcbnFCaQIZUMrfCTF5t
	 5xPI5713zw6oBabljJIKt+vyvlo7+L4EzmKuaF34uB5phAdDaeLO8ee84HYO2ptynEvbI
	 a7Rr0RFbfh9fTtP91vIWjIcj80Sn6G14g1Q8TCuDqbUsGeKzAiy1bTmNl9S8DsoAOplG7
	 ZpYB77/I9Ca3vDZLTW0PD5qNXVxaEq2GQ7GvbCmJdNLtMEKy+LBNDLSsflr1WuLYSzX7Q
	 r/H7Koywy8cNYUJB+Gme0SO1PDlCGTZBzsDQmLfJ+7noDQjEwtll8yc9KKaq3j/wbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
	b=nE2c8HglkLL5DWCvKsDW1wLI6/suS7TtHAghwzFOaYaJDeozW8t4si0MOzpIgI0hPsW0
	 jfUjr4rEcRe5iX5yeP0PRJiMYFNFxBwfm/I963ljt9kAy3OUi5F/inU0AEk/doYWyUp2M
	 EFC6RHNmcXLphEhGniJp++uI//uRJpaOBgRN9+zMP6Jvx3qsX7uDo5qYxhRqlEVTKpfBz
	 SW7/Rm4s9Hp8zTShohS6/KRAhRPFxvb34/9utMHdlcD0AUTgrBcN8VtS3FZ1A+e+FfIaU
	 q8TOG6hDiEqCfxB5tSBUDVk7tS9JlQa2Q7plsYBhf5FY12SO+WDk6UvQZNf897Bd5aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BC60A3824
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188BC60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so1226356eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=IEWFjXdYPvHf1GX8A4uK2ABfWGSlVp/WQdtFWAFPb9xPpTeDY0wm5hQzqHNR0CGNyG
         gw52LIeiYhC9IHIn6FIdkvW2vBm4vC3ehHqZJblz1xfrlYYx/RYysnM2pQ/Y4+etxin0
         IzpXTkMh6gCy2nqoHlR5KxsNg1/pU5B6tIaMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=OCPdyQK7AeoGffBbCf4yOlRT+AsV9N5W7xK1aezOMdJyJhXZX+cE+37huqEOx7z+kj
         TVLiWSkA2UlACh77cGyOHQgxap1FQ4q52BJnD7FDaZy9bRXnSvIFVv2ns4Cyv0mVR/yK
         8aDg/38Ohbwgdxyyh6zybeqIjVV/VLCLh6kF1XkIqkwYdg7V1tjxr30kYj6EFDZhr85n
         QhaLXGaZR3WlXgY/DeGKW3ykA8Y2+gwAy0/YKjBWAzHcz5Y+ZT5W/XjOzXU/Pl8xzEGc
         g2XM5kbebIVAHfxhKVqMS/yNaOFiO0VxKXt3LfjVIifgYmdh60JG36pUumkONoFnhnOn
         JpoQ==
X-Gm-Message-State: AFq9FYJY5A3RRzuILgMJgl+xxgSx5toKIoBqVPIbQFkxGiKD0UPGFco8
	0Rd4yJm+hJ4yJvDKbiNXMXqndHHYq/wEQWgwdSoKMO3yX22buWyopAZRvA1Q5gFmog==
X-Gm-Gg: AYBFou3wAbaQyaZ2/iXFx9122HtVj3EULLLxetJP1iOlmfWj+n0rX7Lgc0hVqbBcc5d
	OQuA0xMY2WOYtxHssN/4RdbBE9Q7Sdf27PDJiJYQQQYBSwqyY0BX8FhGkI+iX8U0HbNYDHxu5P6
	1z57POHvxaDH5GHN+303t5zGIrCgFDts3p98C7S9SpSTK33qwDJpnqhIVDFYwWeuL3zZ4JejkZu
	MPzGcwe3L6qJrnZ4F1HpFv2ce3ApSCegYh5/u7TwTsIgqfGgV/vtj7CirbbYbQRcR+LnRa6O/fr
	lNHhAWOOFGZm2sHGQcxWmcZo8AvRDBHGQ8TAlAdYjPan2/ySmGvznhr3EDCZ8hpn2rDmZ2/Yt2B
	PJ2Piny/biAQ+X7D2CfzXGNJxWD2zlBKsekMbUapY4KAZscvXdVG3ehVNHrH4KNZjDP4k/cZoS0
	8a6byFkWUCot7UD/Yk1EfKNDhgWemzXwkMdDAyzORrkdTwWxxA6j/foctDCOZZJjsVM2uN+vASS
	TPi0igqJo9G5RR68C7yKxmPaS91HCLTD3/Gtc+1tQ2BulEhokDkVJrVix0=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog

