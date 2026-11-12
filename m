Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444745;
	b=TsbNv/jjIM8fSZASIEXpv1nRBrI2nJIrhsY4Y04GniFijDc50bsEcJ79wlT0Yc9IDT8+
	 nD7AsVHJGQup6IXGyaZZtXfZFlI1h/SprpkPWwVXsvJnNLGcY7O7VZdviIt8sOlZJb077
	 +25217liUuDPALqPdznPO7a7TW9d2duKeXQBCkGr6MUWSNCcm5nW1eHhAZD6a/gmFeiwK
	 w+cvmJdrSwXMsWm6vYJoYwmn50k/CQTujbNJjRLpkMBtEpNWiX5V4pMcRGMOnwhF6DBug
	 9pfWnwX9wXeeZXuO5RkM8JpYMnJZw+fDLEj95fUUjDdBrhvHYZIyXiOTmLIul1rxqkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444745;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E2ErmMIw7TlHNUFgLCxZbkPvqwJRagV1Oo1vF/XwGco=;
	b=GotGgCor1cMjTLfcjIeSSLV62tsjsBs6nATSzmsQgZF8V5pz6Um+d145EYy1o4ySxQbY
	 5QKmsHZHCTkEJsA7gFyqxeGlKmAGGZj7Kj0C1PV32G7UMy14fcJUcLL39O4jpm+mV7wWj
	 UoqMg1bKJ797TiNuJcz36lAkk5jXBLFaO2sDQ4wceaPIRPyRTu+Su43icAzyg/OgVN2Qd
	 QI6a4vup+brHOQzWt4t+2mBVAliWKYFKrXXSir4fcWK7q7Yj5uEK+tDuXMl7/6qdCnpIS
	 Bs+FV7ssoecuHBRZxNB87fDGf2QLcL6dc+fZJqgSpd8weEqm56KL+T/AnyXfAOQAlyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JOwz9zW/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A90606A33A;
	Thu, 12 Nov 2026 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOwz9zW/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FF21F00A06;
	Thu, 12 Nov 2026 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444744;
	bh=E2ErmMIw7TlHNUFgLCxZbkPvqwJRagV1Oo1vF/XwGco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JOwz9zW/UcuAxFoEeThBZrmF/7qpicsZOrqUSltUzvnuHwJ97AYHqhMf86VbJKmba
	 ZwCiHv1r65/Xy7oLHGzmreZ0qm9nN/zD1nNgKtrOOOQhL3wlK1aPKLAwiaMLDCnwtx
	 Jwgg+tfNIRojoEB3mcGeFbJTSa5Xg7+Xac3kB+m2GtgcR2khFNa7eU8xmy2D7G6RAn
	 FlXvUF1WCRTLuBqSrI9ir+5yw0LSt1WGPs7QoyvcKMR4yZMbHSSwrdPAejnBDDIqag
	 O3OfwyRIDGPLp616cRoKaFPGruzN83B0iXs+w12o/zdlsYWtJ5oJo28DpZltRcaFrO
	 qGIkuxBuH/r6Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:03 -0700
Subject: [PATCH v2 1/6] scripts/Kconfig.toolchain: Remove
 CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-kconfig-toolchain-updates-v2-1-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=nathan@kernel.org;
 h=from:subject:message-id; bh=fbXDpLcCNp9CjHqtSS0ovApzX2k0R6y6bSB0k3uMO1o=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefddinnip7aUQUZK01rr6Zet/p+/bZmy4lvO/YR5p
 V8my2vad5SyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJTOZn+O9srBO6+jJnX8Tq
 PfE2JxLNgqaJ857OPj7j3X/vlR9FmyQZGb7e8n432Wa6Wru5Wsc8d7eCD8uq2luUWWfGPDE9dOB
 BJxcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

__attribute__((no_profile_instrument_function)) was first supported in
GCC 7 and clang-13, which is higher than both the minimum supported
versions of both compilers. This configuration is always 'y', thus it
can be removed.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/gcov/Kconfig       | 1 -
 scripts/Kconfig.toolchain | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
index 04f4ebdc3cf5..f62de2dea8a3 100644
--- a/kernel/gcov/Kconfig
+++ b/kernel/gcov/Kconfig
@@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
 config GCOV_KERNEL
 	bool "Enable gcov-based kernel profiling"
 	depends on DEBUG_FS
-	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
 	select CONSTRUCTORS
 	default n
 	help
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 2acbd40a38f1..666d44cc6ba8 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -141,9 +141,6 @@ config CC_HAS_ASSUME
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106654
 	default y if CC_IS_GCC && GCC_VERSION >= 130100
 
-config CC_HAS_NO_PROFILE_FN_ATTR
-	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
-
 # Beware of two problems when using cc-option in Kconfig compared to Kbuild
 #
 # 1. cc-option in Kbuild tests the provided flags with all previously added

-- 
2.56.0

