Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604186;
	b=FP8YuUJ2opSTTUyYY5gL6Wq11h1kK0BLHnl+zbUwSctkPRvYsgNxoS4ezc2jA5HGM92z
	 huvz/fk1MttZbeIGB+s1IAtCTKOHoihqnMpz0t9O14d3V+OU6jv4WouH/TD7AhWoFrTV+
	 f3l6tWnuxPqr8Pd/uAUKkndgcBuG3y+PH5ymUTNkKtbCCAK70YLxZij1VELf/BkNa1O3V
	 LoMAXPTvt8LrR0WMX/Xwpsgk9RLZNg+Y5qS8HjcaF7ZmyhytPjJ/VBq2hqmoAGNnMBWn8
	 oYYeZnpao8AJhuSH6Ot9q5nFbtOmtWvqb0bN21ZVy3DVbEUHVUisH61K86WDXCNAw5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
	b=IJDbwGTCRKRncGLm1Xyv5wFoxfo7EnoRITyBswOlfsCxydbKKySsOFmzLvR/PgVcN/rM
	 CSmVjidzyAOzA+3Rrr2KPEDWMCuv66R5PfB2Qw7c/ZywZIeCLm/7iiTr1bdr3i0xKfcYI
	 dqUqw2JfFF3LBaArjA3e14VGgv+RODU9/IGWlu+B1//gNvu1DLcutWRKYXXzrm0raLPn3
	 ZAf4ksc36XpyKzmeOBo7++9GYHQbaPjlI4oK+esl45eYRUg+g4TCqQXXsr6zDVFludUZa
	 47nIxYpjVpoZFbS2fRHejhRw2dEyJwsLLyl8YouSeFaNOLvm6NL9q4tD3w/lWND1Cqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6044460A6F4E
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6044460A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso1583599c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 13:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604184; x=1795208984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=f5G+K8muPvFutbfJr6R332HD1ROW1xYUUgwMqGlJG5sdS8n521EAX9bb7/fEpuROB8
         eNUbtmskhwKN9TVqqp2dJSUilyYGIHhpsJxhJDNg8bjAH888Nnj8sTfSQWKWG+KtwyCH
         5yt/NdJ8FyoTKKXpWUSAhC/Q3ZjHTzz8lquGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604184; x=1795208984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=Pe9BRM95xxL9Uh4MT1nMFu5fU6HrpQCkWOyMSAapWRoc7worzTqvWISaR8TRMEszlX
         kU5qTI3eXV6ns+XCnk3AjYR4gqh3pTpcktsw5aNVRO/Tn1jCxCfXxAssWOQtxIhZjoL9
         /52HBIyQU4lgNVNTVyZl0NjCgiSdox7vSOiIvTqakp0fPHJCIkjvWzP7HAXdnpvb2aCM
         cxTYsZ/Gc7kzHVlk3tyLlkZcu7GPCAI/+8ax1Xds6X6x1h3zkuJ5qrt0ckWqwiw7kJI3
         3hi+eLUpXqvX41n/WYxPfiW4txi6wYNc4hbaMMB4Okf6VHHaBZhrgzfcmSEaOcro6kMS
         rdeg==
X-Forwarded-Encrypted: i=1; AL+hErHc8ak65h7eNpH3Neu6rtQy5cbCZdkCxYYZO1sQ7FG293uNMkJ/dbYIyrXS1Xj5KILr9Xi/zWPVyYNv5fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UxTFADSEur9RBOFyb2c0/jkGiEswujwYDtdgSXWbJ0o7ythrr
	wbyRKGkiCj70YKBJMMVDem5JBik035qWxMTx4DyT4YHtaTRUdH6vnrLFC5dNuz4+Rsm9p9J/60b
	FJwm3qMx3r10=
X-Gm-Gg: AYBFou2rBUru6DDJplb9WKmi0szOxRT3xxZFWzS1rqcA/kjIfxrylJeWfGOL8LwfPMb
	gpMXZhXbckK2V8OjdnV4pjsaIFEtZzk9m7VdG4rX4WEr7drZBnCCiVMO3hSIpnbJhl/W/DhXEoo
	2nEwd2818bJI/B/yCKDuEuFcnaax1ZgcfEPZahkDtpffADYdUnVr2g2AD/qgginVoSUZ8Vn07Lc
	30RsBU82Y3mQYgHW7l4+L8/eSu3ycmmvMO4BIjUuekRGMB+ZJxmyoQRG9ltd8jBG3bGz6YL+bNW
	KwFuYcpDDHzT+JhmuD9OHJMrzNhRgk8025xtqGvBuP46uFcnG+2V7MHkTwbStKpBnNciMpz/DgG
	xdC1fbYgRCt3uo3NZwWGNtQI+K/2x+9lxz8ExIblOl+YrwV5zrP8tP1CsVl4Oh791Szvhiixj90
	2381UVz9g5QoJGO0aQDVliCAEyqB/vhaJOjoRSUH0eKZ3X89wHjnwfVGVZuSHq8yZ9FeCnYEToL
	065vgLaC1i9dhyNlom6sBACZ/G7yofHL5I/FKJn+WRTXD7w+b6fRI+2YjxGvIj5JF7kS0z8PoZ5
	zjWYnMX9bdOUCRootsiIED/pb6x2R1tbORmwvYebLwu8fDSXdAu0Cz7vI6MK5g3yvWqL4Sw/mqg
	e0LnksWqANPaElSse8FREl1yMBnN8FwW57w==
X-Received: by 2002:a05:7022:408d:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b50310591dmr3354209c88.23.1794604184477;
        Fri, 13 Nov 2026 13:09:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:42 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add sc7180-trogdor.fitconfig FIT config file
Date: Fri, 13 Nov 2026 13:09:14 -0800
Message-ID: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
FIT image to be built with:

  make \
    FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
    FIT_COMPRESSION=lz4 \
    FIT_FACTOR_DTBS=1 \
    image.fit

Having an in-tree `.fitconfig` configuration file for Trogdor produces a
FIT image matching what downstream ChromeOS build scripts
programmatically generate, makes it easy to use `fdtfactor` on the
Trogdor kernel image, serves as a template for future Chromebooks (which
could encode board/SKU matching metadata in configuration match subnodes
rather than combinatorial `compatible` strings), and helps community
users building upstream kernels for `sc7180-trogdor` devices.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. If it's controversial or people hate it then it's fine not to
land it.

Changes in v2:
- Replace 728-line sc7180-trogdor.its with a 49-line
  sc7180-trogdor.fitconfig sidecar file consumed by scripts/make_fit.py
  (Simon Glass)
- Move motivation for sc7180-trogdor from commit notes into the commit
  message body (Simon Glass)

 .../boot/dts/qcom/sc7180-trogdor.fitconfig    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
new file mode 100644
index 000000000000..5a7be0035001
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+
+[sc7180-trogdor-coachz-r1-lte.dtb]
+[sc7180-trogdor-coachz-r1.dtb]
+[sc7180-trogdor-coachz-r3-lte.dtb]
+[sc7180-trogdor-coachz-r3.dtb]
+[sc7180-trogdor-homestar-r2.dtb]
+[sc7180-trogdor-homestar-r3.dtb]
+[sc7180-trogdor-homestar-r4.dtb]
+[sc7180-trogdor-kingoftown.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r5.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r9.dtb]
+[sc7180-trogdor-lazor-limozeen-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-r9.dtb]
+[sc7180-trogdor-lazor-r1-kb.dtb]
+[sc7180-trogdor-lazor-r1-lte.dtb]
+[sc7180-trogdor-lazor-r1.dtb]
+[sc7180-trogdor-lazor-r10-kb.dtb]
+[sc7180-trogdor-lazor-r10-lte.dtb]
+[sc7180-trogdor-lazor-r10.dtb]
+[sc7180-trogdor-lazor-r3-kb.dtb]
+[sc7180-trogdor-lazor-r3-lte.dtb]
+[sc7180-trogdor-lazor-r3.dtb]
+[sc7180-trogdor-lazor-r9-kb.dtb]
+[sc7180-trogdor-lazor-r9-lte.dtb]
+[sc7180-trogdor-lazor-r9.dtb]
+[sc7180-trogdor-pazquel-lte-parade.dtb]
+[sc7180-trogdor-pazquel-lte-ti.dtb]
+[sc7180-trogdor-pazquel-parade.dtb]
+[sc7180-trogdor-pazquel-ti.dtb]
+[sc7180-trogdor-pazquel360-lte.dtb]
+[sc7180-trogdor-pazquel360-wifi.dtb]
+[sc7180-trogdor-pompom-r1-lte.dtb]
+[sc7180-trogdor-pompom-r1.dtb]
+[sc7180-trogdor-pompom-r2-lte.dtb]
+[sc7180-trogdor-pompom-r2.dtb]
+[sc7180-trogdor-pompom-r3-lte.dtb]
+[sc7180-trogdor-pompom-r3.dtb]
+[sc7180-trogdor-quackingstick-r0-lte.dtb]
+[sc7180-trogdor-quackingstick-r0.dtb]
+[sc7180-trogdor-r1-lte.dtb]
+[sc7180-trogdor-r1.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx.dtb]
-- 
2.56.0.611.g1030f0b940-goog

