Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794375778;
	b=HNXzAFpawIJbt3QRxfIz2GeVXpSY/cf54OHPHaojFj+sYPtcsUS/p3NJ2CWsI2KNSb+0
	 jujMA59YF3sICmfN5KbdpsRl3AVNXiurYTM9+OCEO2MGheNdEr1C/HUHOj2eNqLI4E5rs
	 OncYz2PeuHOgOKYMWyKI0MStecZ/JjRPpdZOvS2mkPDKl1A2Jc7d5nyRW2Yo89xUp3ar4
	 WfbNYUCWSDtB3gbPlw/1bk/DK5ewmTr0DeDkemFKjAFEXEVw8E062Fz4puvtsQTYoCzK2
	 8IEPZOm5ltu7Tv3uLHKWxGL2LM4ut+pSw7gHwxRlDM2wrSO0NNSvzXihSFWJU0T4wrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375778;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dIt8jf7pS68tnZfBRePzwCOs3On5krP2QUyFK0K4FaY=;
	b=ZdFtrKr2xeu7s0XOUAarHF3RCRHaRfDTxDYlxVoCle14tUsLLr/HiyvVhejDkjm+h7vW
	 86HGTLdG8xR4udstwHNISALygAFvAuen0oTeeGWRGg4YouJvf51h0da0b5Q/Ik22WV/OU
	 WJpoFRVuSVtcRzXrgbPbmWgxixCR7hj7gg9bF82uUjqkJ01Xxkac5jxn1d99gqT5lSJb7
	 6n1XnPSIRttN419GCowz2LIF4yEAsJondVigi1KwC0dlQU13TpFKfRTUrTEcDuEB7rdtv
	 ZLBgP591UQsLiK1AGQAQXIn2RMc2276x0moqXs9QI6b4YWqhTwZlweVnnHC6Od6BPnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8vAha6l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F01C606A330;
	Wed, 11 Nov 2026 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8vAha6l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E411F0093C;
	Wed, 11 Nov 2026 05:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794375777;
	bh=dIt8jf7pS68tnZfBRePzwCOs3On5krP2QUyFK0K4FaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n8vAha6lPiR+cx1m+wIqRwerAxZlXVR+hC8GxNBWTlU7bSPnD+GNRnWA3Ed4xsKoD
	 FYtzBLSo5Ui4qd86SzQaS1YL2eDdmYZerpE9r6h1jeomf6LBa/ueGmUDSRwLHMTfb7
	 KtoMzU2F8IwfomkBJAZEUA64xTBhlWTy8dQloz1S3JvndaI4/PQD1gtuVJK3YCtWo8
	 kMi9tPWm8Wja0Q3FDkve2RkW18sQFXCGeluZcz5toRJWg4RBjlNa7Gwm6hZBrjjSg3
	 ehrbGXNxv1r700KovowERHA8oJnE2mUB2uk68XrjGW11oIfXL3Fh53BI7PrJIKeXWw
	 WrTxq1ho7kQHA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Nov 2026 23:42:40 -0600
Subject: [PATCH 1/4] scripts/Kconfig.toolchain: Remove
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
Message-Id: <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oOxsWSTCQnIC2745WcYl97NROIIn4ZPqhaEota0LJ4U=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfGCJyg1RmHLWYxvIrRPiPqOPHI5kWvPINiRavs9Ru8
 XZvm/Kmo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzEx4Dhv9fUVbtusuyyUngu
 bbNdtOnptCW10TaBzHN/n5FTO8wUzsTwV+Ljpj9zAzwYONeuc/rIq3re4p/Pd8VT8k9u/tpRWWz
 8mREA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

__attribute__((no_profile_instrument_function)) was first supported in
GCC 7 and clang-13, which is higher than both the minimum supported
versions of both compilers. This configuration is always 'y', thus it
can be removed.

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

