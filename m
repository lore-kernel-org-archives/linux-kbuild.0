Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F9386566;
	Fri, 20 Mar 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024635; cv=none; b=JKYJssUCT5FkHKbzKMDvzc0suSBwTjfAgwxEfR0c1CA0fvjJqhEAcneDCE0aAvxdzRzyBW2jtt208Cie+MWoSXG7dHH4y5QNS7Cel+3bbdOZI+1Pjfc1WoY6fa3tKEVw4SLEGTOFsp4kCDLVNT9FqsO1WZDNHmpdig47Os1Bulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024635; c=relaxed/simple;
	bh=e6McUYj9uili4T5w20d2hsGH2TTMVNjpTwu+DWQBpaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bu6ZvFCL6G0KXKD1SUlk71Y0UseFf6Nit/CjItVMFQTZGIMeJaPak4H3mZBwIacw64a6MmP/kMfZEoNSM1ZYkv1vqKkoW4uuBh8y7M1N/arc6cpSpxOIrhIpMAKzVlLLQqBMluqwQuMR4eITclM+SCxgbq7WWmS4IPAQLvChA8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=mP1KIhKU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="mP1KIhKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774024624;
	bh=e6McUYj9uili4T5w20d2hsGH2TTMVNjpTwu+DWQBpaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mP1KIhKUER6OvZIp2m0qquAIUkira8mVDYMfDDmfp+2iIPmfTYkfmoCzHKK/LT3C6
	 4uL7ej2IDwtkzaPpPQPYHE6noz8tNumCrTiKPN2Z42khzAkXrn4+908hbjbjfJKTbI
	 DcPPghAFwQCRKxWmSCI+eqVrU3c2Hw0hvFA8Sf6Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 20 Mar 2026 17:36:54 +0100
Subject: [PATCH 2/4] kbuild: vdso_install: hide readelf warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-kbuild-vdso-install-v1-2-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
In-Reply-To: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024622; l=1141;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=e6McUYj9uili4T5w20d2hsGH2TTMVNjpTwu+DWQBpaY=;
 b=zE5nomV8k8SOPYiXANyBffsMGWnrMOZsvkbJKd9jskbxrrYJ6cUvWajzx3fcoFZv+wBPM0/SX
 s7XviS1e/t/CVUvqdgjnvLpHzUpLd/8Xgn8Pz9vcooTJmBdm/klY78H
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If 'readelf -n' encounters a note it does not recognize it emits a
warning. This for example happen when inspecting a compat vDSO for
which the main kernel toolchain was not used.
However the relevant build ID note is always readable, so the
warnings are pointless.

Hide the warnings to make it possible to extrace build IDs for more
architectures in the future.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.vdsoinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index 214c561651cf..aed153b3120b 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -21,7 +21,7 @@ $$(dest): $(1) FORCE
 
 # Some architectures create .build-id symlinks
 ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
-build-id-file := $$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 link := $(install-dir)/.build-id/$$(build-id-file).debug
 
 __default: $$(link)

-- 
2.53.0

