Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533153;
	b=jzhyhloj+RwJsellVq2lXkuFI1uhxldhwT2qNYXnGRndhXkHqEP4hCyFQ+VgyQQfKXWh
	 hViaECHAWOVHTQH8XfMUEHOaThYdfga+Vhm1j/6UNaZBGM5k675FglKkC4moWgGY1CTGT
	 Uw8zxv9CESrbsv+k/0xFBQLmcSj6iHngRrCRNpUuSSYfVj+aCPt2vO7eJaMxOi+qAyMh7
	 gApSc5y2qoth2OCrpnp2L803/x0yvoXjgSkV3FNEFuybycV5JAAYCmauuArTnEgvb0mOX
	 y0wsl9GSjY+l8uCenAddhtbakk+q9Wg4OYPOS3xx15T+vBZlg9Ate1oXhjKuh8ylh3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533153;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7S/r3nCqrPBJQnBWzVEH2BQBDOeVZBR50FG9XiS4wco=;
	b=IuXmfnYUcemRXMsSbMQoezDTe6Kb5422yB8kYkuDGPiL6knTohWpMrvoZSiZ2ymSvflt
	 NE2ILsw7Ts3RD6QXq/YtK/fp6Bx5wntQL/mTDi/fglwo6kNFWQt42nTVoGeUxv5DRbInD
	 UcIRvks++w9IcuJi31fQuQQNxT1WZk8+a6A5oDIICSzffrTl0rGd3Os/mi2Zlg4eTZxsa
	 38L/BNsozLZCuhUtegPPN8x7jvdxjg+NYAXKL0e0Ma6pljPAyYh4krOpL0UDH1bbFrNwj
	 tCJctSeTQvl1zerZ/57i4Ltt9ySrK1GVpU+Vn25dU43fywV9yo5n4/8Ut9YqVpnT+Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4Pb7I6x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93425606A32A;
	Tue, 20 Oct 2026 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4Pb7I6x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74191F000CB;
	Tue, 20 Oct 2026 21:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792533153;
	bh=7S/r3nCqrPBJQnBWzVEH2BQBDOeVZBR50FG9XiS4wco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g4Pb7I6x6cSqFoBc+autmrzcCOkpBoM2XuThUyOaf/ETt+LhDGkoIf6VH3ZhQiAmH
	 rhVUyqgMYa6bZb9R2TEpFY+E8fV13hEo7U3hPVCc/u5ZMNhiyHr4msQnE9m3vlAL0p
	 2fLjf9NfjKVT6hUMvO98g9adR9cB8nP+q9AaZvlW8ZrEWJPjz/i4w0b1FV+oacp+Ug
	 xhdFPpDQNKBSZaV/HZvB42Bw3R9+MGWKsFOPbskICN1eU/BLem+QIhAwSTKGtm9Hu1
	 NdsT5jVaNgDtMmpuhiBZHsSKtzVt+L2IRX/6DlGTdcpnmezjeLU6ihMiR0/O+9aQxP
	 ZGn8JU0KZDDbA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 20 Oct 2026 14:52:19 -0700
Subject: [PATCH 2/2] scripts/Kconfig.toolchain: Highlight cc-option
 differences between Kconfig and Kbuild
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
Message-Id: <20261020-kconfig-fix-mfentry-check-v1-2-428258bc0fc0@kernel.org>
References: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
In-Reply-To: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+PNZrEjPykP63QNBf5/g9JAUdPUKbbxqTVMbFSaOkYQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnXH82YqPn9fXsS34K7HD8PbMtPsI670raAfX/KkrYXd
 dIlr8s2dpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJPFzAyPD7eoFcS8Z9rw89
 u/u23P6aO//xr8T1xy/nqpzI2t+t1SXNyHCanXmL2sLbgaffiU26kqNYZzHvT9rsFWcvRnjqigg
 +eskBAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Performing cc-option checks in Kconfig instead of Kbuild can help speed
up incremental builds where the configuration does not change, as the
results of the probes can be easily cached. However, there are two
potential issues that folks need to consider when using cc-option in
Kconfig compared to Kbuild.

The first is that in Kbuild, cc-option additions are cumulative, so

  KBUILD_CFLAGS += $(call cc-option,-mfoo)
  KBUILD_CFLAGS += $(call cc-option,-mbar)

results in '-mbar' being tested with '-mfoo' if it was supported. In
Kconfig, '-mbar' would be tested without '-mfoo', which could change the
result if '-mbar' depends on '-mfoo' being present, so it would need to
test support with

  $(cc-option,-mbar -mfoo)

The second is that the Kconfig stage is where questions like "is the
target architecture 32-bit or 64-bit" or "is the target architecture big
or little endian" are answered, which very much matters for testing
compiler options. Toolchains may be configured for either option, so the
kernel needs to pass compiler flags like '-m32', '-m64',
'-mlittle-endian', and '-mbig-endian' to properly match a user's
configuration choices. Without these flags, '-mfoo' is tested against a
toolchain's configured default, resulting in an inconsistent answer to
whether the flag is actually supported for the requested configuration.
This could manifest as a build breakage from an unexpectedly included
but unsupported flag or missing functionality from an unexpected omitted
flag.

Add a big comment summarizing these two issues to help future travelers.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.toolchain | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 01b49fa5d6be..a99d875489ee 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -144,6 +144,25 @@ config CC_HAS_ASSUME
 config CC_HAS_NO_PROFILE_FN_ATTR
 	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 
+# Beware of two problems when using cc-option in Kconfig compared to Kbuild
+#
+# 1. cc-option in Kbuild tests the provided flags with all previously added
+#    CFLAGS, whereas cc-option in Kconfig only tests the provided flags with a
+#    small, constant set of additional flags.  If a flag (e.g., '-mfoo')
+#    depends on another (e.g, '-fbar') to function properly, the dependency
+#    must be included in the cc-option call (e.g, '-fbar -mfoo').
+#
+# 2. Bit and endianness flags ('-m32', '-m64', '-mbig-endian', and
+#    '-mlittle-endian') are not present in Kconfig cc-option checks because
+#    they may be included in KBUILD_CFLAGS / KBUILD_CPPFLAGS based on the
+#    finalized configuration result. This can result in inconsistent results
+#    when probing toolchains that support either option, as the toolchain's
+#    configured default tested in Kconfig may not support the tested flag but
+#    the post-configuration result in Kbuild would.
+#
+#    In general, prefer adding truly generic compiler flags to avoid this
+#    pitfall.
+
 config CC_OPT_ZERO_INIT_PADDING_BITS
 	def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
 

-- 
2.56.0

