Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604183;
	b=qP6Bc87iOX/18yW5ZiNmA6z37xF2Wi+nWcl2aXKrWrsHZmEakMdrgFfjbVKVnqWdj2Ii
	 Y+XKGxIxZj3HlF/MCe+sDWGa1Z6Pik7NUpyxm9MqrQ82hcenlFgsmmVqStnjrk3T+XaTh
	 i966iRHWak5Jt0NYWX7RdDpiKDLFICawtXd5VhI3sCes8I+d3VgODHqWq/vFWDMYg6OAA
	 Cn5YkJIbGO/nVCKiQsrnb/6dpIEfR3OieVRebFB/12WwEtxfNxDBkh54o7gPxF/bNTtxq
	 veIL/0S4Sq0kJGM8MWbjrj467FAEKstRxOizdZ4N5ViL+l39tiBvBogHKSASRJ91kHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
	b=kuByUOZS/NfzZggLsLoIj5tfIkPXBNLMl8CYyHKh4pR1M8E2ihIHSetSG1ZXsZRIdl4V
	 w6WBFiyUwSa45DtbM7r9+LoB/64fRDvddh28iuK6oNjEo8Kntqp9L/ZjKWFxRVxw8cqAQ
	 U64Hzfw6XPgRt6LDZzP2LlatTAm2c87rDDGUCPurdpRKEc5j9CfiWCMd7XAG5x+Ppg4ZG
	 5/LBnR7G8ZVYe+tGBQpZwf9vOpvXpAnf04pLXoxlCDl7mv+l2sChniPE7YVbOLCvBvwit
	 U94CjlP8yPRC6L3HeQEcYF0fY0umtdNL6ItJ6Qqy8+GXJkx8mcpYnY71r0OwMhEqkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BA3606A8A6
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BA3606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1035545c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604181; x=1795208981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=mL4bWoI1mpeMMgydl8Xi9d2krbL4oJdwH5dCeLzhcLNDqmkJeCUaFBJPwG5csoTBCA
         yQosIHGXgtHK3esf/hwQtiVpDpS+LeYZsaNYU9xQunGvp3H22PUO/6SMho5UbuXCpeCD
         weIZd7D/MGUjs+KEXZMU/C1/MVZILtvH4SRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604181; x=1795208981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=0jxoFWV/Ky7JsieMC54NHYFITuRQhXMnFYU3ThkEBJyUzQVtnMM745zyCWORIx+0/A
         vfegPI1gbM71HCjz3Ms1AqBMAT/2uE7OfZzapmruw6y/I+oBussFILLAUZW1LLsddXbd
         R+t0c+Jo5pZfRXaLfo4a/HJL5uFV+kD812aSks74cXvGKoD7mVi4eVqtLYIzHHa6XRX4
         dX4+rmzyG0011gDt/5zqL1g9Fw0rq71WRILJ4jWU+ft0Ai4cEEqkL0Opbdp1uptRPjPw
         vbKBNHnncLjUgGvY6leWOSn6R7Hd9qBUspOsUaODuUniW9ayeb9NNrdisb+y5AZB1DCS
         lZOA==
X-Forwarded-Encrypted: i=1; AL+hErECYOwdw44tNkyZbJVnD8F+ROvm/Z6OG6ReBGMHxQx2P3S4ydL5LtwTINIjjvYqlGJEKpa+Eyu5mH94jig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e1I2G3KTKMNKEZQXDxRVwR7+vx7B4aj5G9GSJPs2lozxCUFgh
	Xesl0iSgfQenUOOWL8gL2r1CJkx6eaoPN2TPpB1gqBEpcc5bYL05GODqtv16BsGubg==
X-Gm-Gg: AYBFou32ReRztDIqhSe82W+oIdJFYvzPwSfw7Kr2scU25xjhOmEzQw2RhlvVnQuooFT
	6vIQAQa28JTlzKWZDWg+0I1gtRURJ3fWLBkae85WKhDnd7d+G9shzYOqGJXoDO5JtC3okg6Tx9N
	f7AqNlNXmElBxVG5TXB0UkcB2UK0J7B/dEqC/QPP6v42qi2aXiLXgD+BbGsLrh8OVQ1gwICi5Ny
	dHhhWoBibsocUreVAxLu7u+yRaKqxLOvSvJfozKDWNE0djHo4gg+OOZjc+507bZd3f50wGmTBXs
	la9cZLQxqL3n+sIlwuH/2ZWXkwGsGzZy+Lx0oyAAV7w/qnrwKXMf7FyP9B1mvW0MsnhLmgr+uGj
	pbKm8Nm/HdVe3xjaSe8tbz8oyupaQXmlEk2NGDvMIl1UY9upSsKzokOFGcumj52nD9VchgkOCO2
	UtCxVhsg5qWDY2TF49Cz+191PLBzZJ5liYTeD4bzyiSbH83tbxUBgnnRmQdJ6JNeOKV+4kFEron
	4cyu/zZFaubt6Er4c46TtK4Ww4cRNwKZJQ/B3dBiuC9FO5aZHzoHGcw9g2bzbuzvUUQyf2leu5+
	aV16vFWzy4hxKABZvPZ54OzZ9CmY1C1EuNl4NDtB/41d/9OhdEknU0UByQ3iRuzD1MVRo2ur6FL
	kdeb2XL1DIcb8tpVVgXMA61ZBL7FYC0F4JQ==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
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
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog

