Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510647;
	b=Z/MvIggM+MSpox+z+SWiWUQmktnnXXL3mm50X9D/iyfmTwOikzoow2W8g2aq3K/zFtf5
	 mLmXWJP+7pcb41MF6mQh03mGqwo2NEs3+VlUZ6qMGTsHBf5bV1XDks+QllQC3f0xQsx1o
	 msQfIH4jUhjhJe9XZ6b99FFriBsxHNjrhs+wNMTF69WN6VVR16NuS8dQnTWQ5KrJi9j7J
	 JrUfndtLa3LgQAyndcec8u+0IDD1ZODl/yu+hbwsRjB3slBduybsMSO8fZP9Zdkq7DZkr
	 OCwOoWK5mosO8k3BdLNE2dMedwMpJbySi19tO6PrClmoecfQCuz2P6JkETICVMKFDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
	b=GBMmQDKeTpVfDaHgTpzNwxS99s4h+WdGvrwLAkD/a8HfpkhGGEM4cjKrrbnjEV0yjFZg
	 qfFM4/4JqObmpq+7eBEu8aMetlQ9BTpqAV4Brq0n9fTm4PS+agcpjKbw/EoiefHXqcm9b
	 ngQi8cU1fioGcHY2205xuj0ElqJxdYjzVOa0YyEU72oyTcPI6bkuR3utpj/OzjnF8Er2s
	 p06izmrMfHvUo/4ubyxA9s4VrmknsZjKg22ydFDc6eC3jEkRdkJw/jpV5ppoewHFOFay6
	 MpM2YeKLsAN+8k4aEvOzd+lOwG9Ln69GUeuYENVwQBrxM9M6VsruyBl0lKBrl0KDoMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Q/M4ohUy";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A5606A333
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 15:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9A5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q/M4ohUy
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3550c917fd3so4042687eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510646; x=1793115446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=Q/M4ohUyAJ7ROEDRnEfif5lqm8SVj4WkJkIxKL1p4bokHsZuMxcjvvMPhVRNkEPoiR
         j5yWwuiinUbY4oNVulXzeJxLzeXkFBbS4H4E5rlSdZ/O/Z6nTiJi5PNyn3Vb6ayxyQLe
         DZha0CltkU3t+XeU2wkG4TuszL7LlwU10IXic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510646; x=1793115446;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=WbC0s7fZPpnteZ7C8GOVeEM0nHJH2YS9JV3Zny+dW4I4sLzGude4w/LvN2kj62b+pR
         e1OHaXyDwnIcU8/byzfWmeO/vPDpgv2dRJ6YuIKHDhVegSGC4JSKQ0EHcP1Ez/4EP3W3
         pqQNROSpra9L6jlZVdN+bJeQlIcrRUdhjsDueBvJwmu3+ZzrJ+xpM79O5KTWMr0LxXXE
         3ABO1x8N54SHGI1bAbpwkhnVA7r5uIpM6UuPyvHtLD+zLk1OqzcsfruKd7hgay7S6iKm
         2zr2OQKsjWhdpJVc4MheFQ4Ox/dpOykOgvx/hipx3fCFexT0gYT93VXbRkcgo80UnSj8
         4NjA==
X-Gm-Message-State: AFq9FYIKoFgiIpndwZ9BHeYjTQ+8IOWd1XZ9+fLvPHywY9eJf6JUJD1t
	AAOeR9FRTDFMxpSkMt2aO3EXb/Z4gYfHHOdPpqQYy3qOgETNrfsq3Mjw+Olth/QGZQ==
X-Gm-Gg: AYBFou35xZwvJlINEBoFFA0viGmoJUO+QIIkrTg7yYKiTXGmSba2//NIfLCxq5vv7Xp
	VGAUznyrFnh+7Z7nh99vHwF/VPhXK9joB2yBBP9VxgB8ATId02aob1ZPbf3A+FZ2CKa7xZw3XyD
	f2RqJgPI3OKgGzAmnlZCAcKHiFXYcznRVsJA1ClbzeGb9I9QXOIHmzdaX4pzaafSTui0YsD0+KQ
	oAXI1yk6YP+zJFf/k1X1l2BwjCw4osxb9MKlhXjxQVaLfELmDa5YHWKI5p1SPUR0PUW3k0EJJkn
	oaMJipGoh1aSNoOXSN0mQ4nJmXi9yZt7lJ0vly1T45ipzB4tsElg/tpcbHUmQK1GuYmrqXRzgiU
	aPLZ8powpZdCrHDZvQYVb82cG3+Oc1PissVoKm3WUBAWQ7OQsRp2wUyE3QnYGgy8GzAUqFdmbaQ
	l9Mm4M+/A+AOW4CWNw/2EVO56HUiM9K8HtoqTrAq+42odK82+T2QObv2uvz1Y1VmIoL1LpjMWMu
	36MohxrRc2DJVJ2DTEgWFk0e1S+FzofBNJYG+P937acc16MxdMYgY7RKVA=
X-Received: by 2002:a05:7300:d409:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-361a1f5019bmr16718087eec.23.1792510646054;
        Tue, 20 Oct 2026 08:37:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:25 -0700 (PDT)
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
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	David Sterba <dsterba@suse.com>,
	Gary Guo <gary@garyguo.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
Date: Tue, 20 Oct 2026 08:35:18 -0700
Message-ID: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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


The end goal of this series is to move forward on producing a
"universal" Pixel 10 boot image that can boot on a variety of Pixel
10 devices (frankel, blazer, and mustang and eventually multiple
revisions of each). At the moment, this is impossible since the Pixel
10 bootloader:
* Picks the base devicetree based on SoC ID information.
* Picks an overlay devicetree based on Board ID information.
* Needs metadata associated with each overlay to match it up.

Since we don't have per-board overlays and don't have per-board
metadata, that means that today you need to pick exactly one revision
of one board and build a boot image just for that.

How does this series help us?
1. It uses a checked-in .its script to associate metadata with each
   board's devicetree. Other tools can parse this metadata in order to
   craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [1], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
.its script is part of this series. The answer: it's a board I was
previously deeply involved in and it is a convenient way for me to
prove out that the Chromebook use case works well. I did hack up some
changes to the ChromeOS build system to use the provided FIT image and
it worked great, but since I'm not on the ChromeOS team these days
it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org


Douglas Anderson (7):
  scripts/dtc: Add fdtget.c and fdtput.c to sync script
  scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
  scripts/dtc: Build fdtget and fdtput host tools
  arm64: boot: Support building image.fit from a specified FIT_ITS
    script
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.its FIT image script
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script

 Makefile                                    |   2 +-
 arch/arm64/Makefile                         |   3 +
 arch/arm64/boot/Makefile                    |   9 +-
 arch/arm64/boot/dts/google/lga.its          |  68 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 scripts/Makefile.dtbs                       |  51 +-
 scripts/Makefile.lib                        |  67 +-
 scripts/dtc/.gitignore                      |   2 +
 scripts/dtc/Makefile                        |   6 +-
 scripts/dtc/checks.c                        |   2 +-
 scripts/dtc/fdtget.c                        | 207 +++---
 scripts/dtc/fdtput.c                        | 280 ++++++--
 scripts/dtc/libfdt/fdt_ro.c                 |   2 +
 scripts/dtc/libfdt/fdt_rw.c                 |  41 +-
 scripts/dtc/libfdt/fdt_sw.c                 |   3 +-
 scripts/dtc/libfdt/libfdt.h                 |  70 +-
 scripts/dtc/livetree.c                      |   2 +-
 scripts/dtc/update-dtc-source.sh            |   4 +-
 scripts/dtc/version_gen.h                   |   2 +-
 19 files changed, 1322 insertions(+), 227 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.its
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

-- 
2.56.0.212.g129ede20d9-goog

