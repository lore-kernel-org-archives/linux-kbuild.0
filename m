Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794375780;
	b=xuffUF6oP1oAuEQJygV1EqqCS4iq2sMLeDeJZ/sinXajStNwbinMyMzLscomrmac7Sfa
	 YiQpviwraukQiVMF3Knvmic+/1xY+cFBGvdpUztTK1bYxUYwj/+c1T7ubhnDJHAylCiza
	 FoLEKKzFhZQjIG9+BDl4kcBvKwsQAHYyTWklxF/k8Q+sF1ecwFDk1M9fNm6TPFHVZl0I0
	 LgkfPjzba2ute30A2+eZNkrQsHJPs26Ag7TD30oVyUzBQ+yEtMhI2ErzZWHe8Tzbus0UF
	 1igFi6Q8zcaL38cuH8miNd7PMBYODvoqmHqLdwCLJkqywD63pJmfiKNygWLG55j80fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375780;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sEMipNdL18V884Oy4truFfCXDWucGh4bse8w0+q7sdk=;
	b=MDDND+33zmwZimJdhxYWfO8hxCP3hNODDaM+kuUvXLmZm7p8Ml+e++pXutfjX7VGoKxO
	 IEsFXQ0VHLejNop7p8va6xKDyKdMYI2IQa5KN2Mf02patDloZFaSUm5rP6dlHxdJgZARX
	 6DrEK0JNxP7XcwEQ4+24MWTcpo3zBLb+8WUBkWX6sSWJgY/2DZpUz+hGRBRH2iLy20Xkk
	 P5nEsCBwr/3QjbuBPjlLR+HaDSIJjYlwNfYqyxSxzXHGk0gmMUIuo9MX2Y2ecVrgtuy3E
	 OTpa+FREyCjvNwDaywHvwCTazopQV6jVBlk9dzFZHNa1/t0/7997ZnILeptB7fviEeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPF3j8DW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E2606A334;
	Wed, 11 Nov 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPF3j8DW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4200E1F0093C;
	Wed, 11 Nov 2026 05:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794375780;
	bh=sEMipNdL18V884Oy4truFfCXDWucGh4bse8w0+q7sdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hPF3j8DWuALZAMawn9KiEaYLt8m4OcPFtnuKmTJuRFqpL0ilTzAk94+6m++09PawY
	 LiKKe71HVSoCq1zHoHGbXFEQnPjJjiRisU6Df4Q42jzI1ZGUsu/VRnJ69UdBt062q1
	 Fukq/67C0Qq2sx3ATuFK/TsSHTpKfFoiClAUvNn48IUAqq4QgvrM0e6DvZJIZIwY54
	 I3vP84SbZLWaup3a46n4dibYANbqJ4za5a6CCNIxyEmjYyRkMTSAMJ+RgNG69zvGZt
	 zhgU3kyZ1sNVM8Ff+l2kJHfjLzXRnwLmCcCAyDZ3BWDNzHtNA5axJhvpzcM5Zn1hQ3
	 MeCdusvyZcR6g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Nov 2026 23:42:41 -0600
Subject: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe
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
Message-Id: <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=nathan@kernel.org;
 h=from:subject:message-id; bh=eo5Nzq00MsX8Vs44JjVEDxaQf3DViqAYJmIUa3HHReQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfGCJ2z2ZP3RRtfH7lOmGJJefl1R+Et0fGpOyccYJ/x
 6baPac5OkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEUv8x/DO98SSJna3kYp/2
 ju+dKUUHBN32u62782w5c9M9hRd8h7cz/OFcWP2sWi1ktfmcNzp7ZhtzTy+8qXplsuqNee7TfMK
 9s3kA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

'-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
section. This flag is supported by all supported versions of clang, so
convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.

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

