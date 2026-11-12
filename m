Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444747;
	b=5DwwR7rZJ3IBFC97lVzuAIeUGvZfyuv8bQkAngI3AIxrW7LvAjYppxq2GsY1oSct/YkA
	 A+NPSXocl/hnXsC/uSpF0HSqcjGkYk+C4FT4qCCfKauYhOfIKBqjmcD8yjbnONjZ+mxRo
	 z/iKdNe1AmpSYUB+TOhyY4oIYqSk1S7HEYL/6GN6hq5QRQlu9XKLaRp3kFth0jcCjJcIb
	 NSvhAnKcXZaxN0Rm22y0jPNRaDg6or878taG1ZL0i9+OfIglCsueP0RJGi+OWEZLp1RWj
	 FcqR2RoiDJ2yPsM3BQ/C9Pyodu8clszk15l3PwZzFKnZQc9FGNaGvF6sZycrW4OZTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444747;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=P9ZuztlUPoctnqcHf/2Ym1t6tNXL8VOARRpsBJYkGr0=;
	b=nhIl5+pMDXvo486CjUdkTfHh0Z8PM2pyqnUU6PG//ZtcQ3/uq8UWxcUHjmODHW7F3DxO
	 SWr5cn5MXVRRMhBmgPw7AeEP98EkqLM/pqguU1KRCLgZ6or7yq6P8xjdSzR52TfWmqwMN
	 3sG/GVodAMpedEuT7jY+Xzl3UQAC45ZmfZq6pvVMTaucyhRPlbi87AmaRLRnU1G5aJr9t
	 8+rplmn7/NxlymnECSi1EWa3iKcFn8kTkfJPlm6FCU4ZJHDYeNFiLHnyNakAciVdJ+YcI
	 7ZrCoHWoWiJlseyP/GtArFFnw97Bc1M+zFkZLtXcb6XsNgSuw30OGDR8t9COKsV9bYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kcyg97AW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB59606A88A;
	Thu, 12 Nov 2026 00:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kcyg97AW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FEF1F00A0A;
	Thu, 12 Nov 2026 00:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444747;
	bh=P9ZuztlUPoctnqcHf/2Ym1t6tNXL8VOARRpsBJYkGr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kcyg97AWIgx965vJesXBnh46PhKC7UGXaWiXfy+bOtCNvw7syFC9kuNQ3jgyxXoKa
	 mtMZ3JcvsENOmsBldNC/lCjX3rjLyqjq9HN8Zrd5UL32Wljds8a+xapsRreYNWkmTM
	 av4LrSGVfKXnvt3iLqw5rjTxVZ0Uf12OBZ7g26ov1bfzR7ZODTrWSyv3bV9IbjrUTu
	 bGCzuue/jUOU/vqr2do8EE9HWQR2zCeZ53u6zMGqzEVlWIREDgU3Uqz2o00NNU6MPj
	 qj4RCYW0wlIn3V62/tRJRxF9UoX2x49o3x2hr04s34djoBKHjFsyceoJflC+fVDTJ1
	 MMAO+a0GHMx0g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:04 -0700
Subject: [PATCH v2 2/6] scripts/Kconfig.toolchain: Do not dynamically probe
 '-fno-addrsig'
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
Message-Id: <20261111-kconfig-toolchain-updates-v2-2-b2d9415c1757@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063; i=nathan@kernel.org;
 h=from:subject:message-id; bh=c36ACcGFS9SpK9Is3XYNZQCupebZON88Go6ISpoOm9o=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefetumTmVG29SHNFvvEea8Folv2Z+xZZH9QwYtqxs
 ivE2Sa9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExk6zqGv9IbT+t0nHobkBOq
 eFn8xxNHlxb9NX0i9RwWAcHJ2/PmtzP8M6p22PVr1WvxF1UTyrvaXa5IP7jY3cRwr63GaGZCg+w
 RdgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

'-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
section. This flag is supported by all supported versions of clang, so
convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.toolchain | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 666d44cc6ba8..570c5a31016c 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -164,7 +164,8 @@ config CC_OPT_ZERO_INIT_PADDING_BITS
 	def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
 
 config CC_OPT_NO_ADDRSIG
-	def_string "$(cc-option-str,-fno-addrsig)"
+	# supported in clang, not needed for gcc
+	def_string "-fno-addrsig" if CC_IS_CLANG
 
 config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
 	def_string "$(cc-option-str,-fdiagnostics-show-context=2)"

-- 
2.56.0

