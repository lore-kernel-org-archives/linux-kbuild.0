Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510649;
	b=fM8YJqoAd+gmAkkBgUleOfCSp+T4fCXUTx0lRr7OPkAu2DNQnIoRH0S4WE7PB2SmPMUG
	 0MQnjVypxN93fCwKOjwU5XdXyVDqdCQLFTLhHQZp/JJ1fU6sEd/krwRQKBZLPucflcPsr
	 +HbRI45ws8mKO2CtrLmM3Smz79lCiUCq8FY+KVIaOF7j7m92RMNjwq9FopkYnLI3MFD3W
	 bM/AAlrQ7ZgEsoXAhN1TpMkRcI3U8Oyz5hcgf8FIG1NPS8qJysmJ5f4M49hPtjTzRY7/1
	 bBY6M6sSB9xn8TxUKHpNr1PBOm2f9KORsb75xfgXjJ03Ro6tUMOgL1Htv75e4OfJcGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
	b=z5YSH6bAQzLxmYlb9dTAHonq7uSDX1+rkYockiFSHaibJz+lVqY9bgQj7DRMqsHv/FoZ
	 mT3GSCEZKcm1rT1tsFZgpMzoZ5o3LsBaKBqJBRdTuC2hSXA0+0FWfW1Wc51ZGMmBpSCzH
	 O3rgzGn8YwFi844RKUSWpuUylkFBxAHdU2kfjXTGXonEKvEirL1EG4KhfUCrhlHG1ohtv
	 PKNHuosda/BB596JauLNnSpbz2qnsCXu/tcpnS48kQ78oVEGz/QY/vdEV5ClUbQOaLGqc
	 pch3Agv68TaiF6UiiAYsv45skjA1hPy5Owm5uxhqOb5pSLA7tMcwouFgOcSynWfu6XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F45E606A31E
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F45E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35b2c599f43so990349eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=ZB0AmpTiEFpkYXp0+xLjk4W6R0qcTahYVXSVmFDgQXTNrUa4ZAw/D78slYkOG/1pqT
         WKBNuC9DZqypB0b8Rk2Ji9vE0p9+M71yqhsJS8VL89DlXOT/kJhPFZQebjojLdqPK6Ww
         0H9XY3j6gr6XmSqFQ0RJQN77Gy9M93W1ltSps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=UuBLlwrMvFTd6yW+VZXZ8wvausm3pTDNwLoAtCAthnupOhdkImWc52uJ9UETss9ccV
         NwE9HKN+nVe+hIg3WFXmEEj4X6Ac1PeZ0RgwhW+FEvtHP24lBEeNi8cmPRDCljF/m/Q2
         VvVm+451nc6CR+HU/AaBfYyjWPI89RYUF8xl/eEXLpFjpueOGQ3lnXyLyRzQXaaFD/zR
         Q0DTxG2GXJ4AysMBIQkbjZYK2w4KNyXTzSsv/zMpuptToLiZjhRrABFDla4/0WnMFVvX
         aEi7vdac9b5zYlb1LKfCkOysaSco/vGJIeDcISt/uRAJuDLZXlndviwGrsUkZmJ5R991
         2zZQ==
X-Gm-Message-State: AFq9FYLQFij6leSNXHa0+MiBvOCt1dwX39sR7Z0p68Z4aI/HKU+T0dZe
	xIRDgQLQAisY/Z7rV/Rm285CO+GFzLJeLwOjynFBLcuCl5Aq77Te5TTZl095lFmWhg==
X-Gm-Gg: AYBFou1rkxJPOiZBY5hkyQ2lnT3k5WuKlFCCRNV6RbHFRPKD/YFFXvFEIrCoM7yTgpK
	YuBv2N0A9MM5T4J4qElvWgGhVDDd8D8IOYpAArGTBsM7+mK9UjKNymqe+2mTgg7f1jRZR8xbItx
	46FdxL5DukalU+r5KUjQRFJ38gtyUXdkNYvymWWd2WG99NLCE6+A70V0fIxzKxd/K//P6D/ETI8
	SZJP+IxuOsRXYiUvHoN3Rq1rAxaZTY+xlZiUiM5a+zNhkS76O4UzW8YXszZKn1TII5DXcAcu+hN
	P2Oqoh2TChrmj8/NkfLCbORvwsbZyaxWC5t57h48DOaSGa3sKkKGmRVxHeGMofH7aLQwOhLOW/V
	H7qCX25AsCKaO0CXfTueAozIkJzv2N30yWwUg+PwF+qphEWt8Y3BCkoMIqfmG11IityQiekKgy2
	mmjDwMMikTFoszh8AUpGAXBw9UGJaRRSUff1lQ0V/O18eycl++7pgmxlm2+hSZqCBFVu995Irm6
	z5vnHwGKKe7amlrI1JLXe0nTFOqrIiouW/fkTG4G8lnOZhhOI3b+/Ai+OM=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
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
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog

