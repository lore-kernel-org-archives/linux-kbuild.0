Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188890;
	b=SDQv6cskBml8yVMRNzMFYAD+Zqd3gT8mfxggoVxgfdINho54/1vWfiwXwmA5EA5vOSkI
	 2WjhxLNgSy4qxOlcpdNeFO3On2YKGZq3BXvO/AOYmytzUy6/aktXULAk2Ckt0i8Vwes2O
	 xdEmWVhFfEt7YXyXraRm1pUhjwfaK4QtQTTPDhjYdqibzP+R8ys63nRLC5UK25mNrnmjp
	 0U/XHA7SSLz7vi0Aa9+eV2WVVo5GjYQZ5RGtZe6cmUEuHlrEjLHnDPlA1KB5mtThkwNB9
	 xOVREh75gI+NK/esHQzjvQysCPEzp5Z298cuiBpFMNcOGFkBQxhjCvD6Mse0AFEY2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188890;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uxccL6q+3ml/NhUFxZF9z4TZe/C5k0ibIGYFrtRTsV4=;
	b=NOmd/sXJdE7S2M6ikhuHC7msHrgKUIif9wrJ9JSuYoyy7PhIWAHo9kTdKaG0PBFl3KZX
	 JXibxXKEZq2NXTfY8l59uiFqULyBAWQDNqoGFgyozB3R8f+9JoKCWKuiZNHcWKFDpkjgt
	 7sSHgnUftWbdsP6Q17Yo2K/T/vQkpAGTYjr0+H0BzgWbl9IlBhY9bhA5QeAbIMwIvrJxk
	 H9+vHIzwmwHfvmqq2jsijpt6m44ZxkiDUzlkjgSaCM9kkeVHJ34yIWjDDGMuIHzehNNfS
	 lbCRuYDSsvBas8aRBGte9yGQX/lVF1Wv7IZCpxfw1EjO1/L4cO6xNS4t5N+Vxl5f1JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=by9OLef7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D61760A262E;
	Wed, 28 Oct 2026 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=by9OLef7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB001F031E5;
	Wed, 28 Oct 2026 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188889;
	bh=uxccL6q+3ml/NhUFxZF9z4TZe/C5k0ibIGYFrtRTsV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=by9OLef7Wg1yLp9jCTCiVqjBlH7DKHghM3k8z5arZN5D0H8yz0vdhtTPQmM6b/2GN
	 AUUrmzJQlR1pZdzapg52OyMsEXs+xNHFPWXDd7Fz1GBrpch8wUv7QTzZ/daE/rgoC0
	 Yv8zY0qcDdlJv7xU+joniVr9WbcbKr0iTF8enh1Djiveoup4Ky+3BltKn9dGFAnSL1
	 8p6j/cmP89bJgrsB8znrNxXgQzGHCIs2koKd0YLm0ThfLDfJ29NknQKQzMA1UA6/FG
	 ooeGGpXk/07JHGvDnoavZkD6NIoh7pr4jhsW6HVxeP4E3toa3x3Jn/T+UL4p2zs8rh
	 2l4D/G813QzHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 18/20] kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
Date: Wed, 28 Oct 2026 07:59:42 -0400
Message-ID: <20261028120034.871983-19-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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

Add a Kconfig symbol to detect compiler support for -fcondition-coverage,
which enables MC/DC (Modified Condition/Decision Coverage) instrumentation.
This flag is available since GCC 14.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Kconfig.toolchain | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 4b962831d62af..f66b6efacee6c 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -144,6 +144,9 @@ config CC_HAS_ASSUME
 config CC_HAS_NO_PROFILE_FN_ATTR
 	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 
+config CC_HAS_CONDITION_COVERAGE
+	def_bool $(cc-option,-fcondition-coverage)
+
 config CC_OPT_ZERO_INIT_PADDING_BITS
 	def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
 
-- 
2.53.0

