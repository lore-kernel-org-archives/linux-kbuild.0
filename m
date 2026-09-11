Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2B43DECF;
	Fri, 11 Sep 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123375; cv=none; b=FuDeyZVEWBMz1R7NFMpoza/69ltSDQcI6GS45KF8cdU/n7DxL4v5miGzEKwfDWiIeY/zs0gtuvuZPaQyZMfy9/ZVlrbp+h26hSkUAq4/vj1xwZhD3ExCLK2lZvhAA+wdgT6JJtXTUOyLK5aNYwl3aTA+LgNkS5IB0y5SgPkJN5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123375; c=relaxed/simple;
	bh=4nVA4SAKjBOLpO7ge2wl4wOd7oOi00DVj8Gl0oC1Amo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ICwHOix8RHHiGTzP6/0pmk/TOhuOkBDZe7zS3+4oL2Ww8Ugv3/xuc4DHwHOHI2Oc1RKzezrasRT874YWDSEIPfj8pBW1zA8cGxgZ0UePsV+VGUUuqWclVy7A7dYuUN6j8Ve0cFcsgsdAwZfFpITvlJo5BOoloCc2Xn99MeyveXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uqIErwTC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uqIErwTC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA9BE1A01B2;
	Fri, 11 Sep 2026 10:42:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97069601DE;
	Fri, 11 Sep 2026 10:42:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8654911C7AFA8;
	Fri, 11 Sep 2026 12:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789123368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HBvc3mFZJ9sFbHfrO7MHgqSVuCslWxTn7cxWKQ2gLck=;
	b=uqIErwTC2aelOjApGjFPN8Wh0r4SJp3m0Nf3WUy3Ogy23qLcr7rWM4uCi/ZsFBP4/V+Ef5
	DS0YrY9DjxI9hPTVwct+EV22eh+OpiObtUgnu8646Eoev2QVdp0ObQXIxc7sv6luOdkc/T
	SJp1vUkIZjFxmKohLWCojciz3f8il2aUJsXnzXmQ4yW7OztZ3Ym7lJ6W8KiwkOGu0Va8ot
	SiEMPHRspw9+0xx5jEzOr6+0By4efsUC67qRiDPFZd76/QgmmDuRuRspXRPoIzhmm4ECfE
	FmjiJDPgwJo0A8sz8x20CqcXVqMyhw+qN41/UDKnCCTH2WTZ7i9CB/zqhd3ISA==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 11 Sep 2026 12:42:33 +0200
Subject: [PATCH] kbuild: drop dependency on .config for tools/
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-tools-build-output-v1-1-4f9938a4f83c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqEMAxA0V+RrCdgiq+ZXxlc+IiaQaw0rQjiv
 1vH5Vnce4CyE1b4JAc43kTFLhH0SqCbmmVklD4aTGqK9E2E3tpZsQ0y92iDX4NHqigvOTcZUQY
 xXB0Psv+n3/qxhvbHnb9PcJ4XY+RbfXYAAAA=
X-Change-ID: 20260911-tools-build-output-18157e524114
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: ebpf@linuxfoundation.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

When trying to build some tooling from tools/ in an unconfigured kernel
tree, the build fails to start because of missing .config:

  $ make tools/bpf
  ***
  *** Configuration file ".config" not found!
  ***
  *** Please run some configurator (e.g. "make oldconfig" or
  *** "make menuconfig" or "make xconfig").
  ***
  /home/alexis/src/linux/Makefile:810: include/config/auto.conf: No such file or directory
  make[1]: *** [/home/alexis/src/linux/Makefile:892: .config] Error 1
  make: *** [Makefile:248: __sub-make] Error 2

The failure is due to the tools/<foo> targets having need-config=1 set.
With a proper .config present, a standard `make tools/bpf` works, but:
  - those tools don't need a .config to build and run, they are built
    independently of the kernel configuration
  - when trying to build some tools in a specific output directory
    (O=foo), we still end up having to configure a kernel first in this
    directory

Rather than having to systematically configure the kernel to only build
those tools, add the tools/% pattern to the no-dot-config-targets listing.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 570f0c68aadd..eb4bdf4a52cc 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,8 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 run-command
+			 run-command \
+			 tools/%
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/

---
base-commit: 51794b107d54b3c9a8ebbe12a3b81d8495bd482c
change-id: 20260911-tools-build-output-18157e524114

Best regards,
--  
Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>

