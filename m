Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670797;
	b=VolDlXobvyQ2BnFXmIAA/vnQ1Rnte61MKhHVkkAtrPkNRJj9e440+hua4wGKf0vS9S0R
	 NRAsTJvzJTKwxBmE3sz6Bj3zOfA3Kn6VV9Tp76qLUgkTYjqg82RnAbjo+W32Fm81k2snq
	 GWtZ5mvA8hcnc8LWWMy8lHJ8gDmu0T1ngRIIuGhq4lSTyK8Xk3zHoio8t2t6o5IfIFt80
	 xC8NxBywVxRoWY1rgcLJaYerXhORk3WbGJ90HChphCTfQsJLputgIcBLlcsBBQ5NthuoK
	 u0SLmrg1Ag39hM5/9Xqza77qfUzP7d1DXs9XVn6bgCA3bKQEHNYR45DFUhs8nnFucvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670797;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UlpUEFrenUvYGOwRKx3auMBSjT6iYF4syJuT0u+RjW4=;
	b=dVtSr9a13SKPD/Cilj3UCczhBgQmyJxLETOERKJHdXsdDf0WORHVvrVWPus2o7plRr5q
	 7LdsscUCYi6WW9kLBByZmjDN3FtWe/xPL9QkU/u69EU7b5O5v3pZyF/bI/rVmp08R9QJZ
	 +Y22zCBvUAtHsKR+EzjmRDJZ/32KVwMHnMJtaECB4/ooRzjvUExi1cxcuszuoD4sUHlhD
	 XeY+ABh0wzt/2j3iUKuvEp0M92E0LdxBHKduruTLb9jB0wOt8LiSNr7bxmme6/CORSYmu
	 co4bupKAtbG1StS5lZD+tW8P1iouzYSIxPtT+L2QyxRoIXDEezcEyymUFwFoi8L7WEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQy3OyJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C8606D82C;
	Tue,  3 Nov 2026 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQy3OyJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AEB1F00A02;
	Tue,  3 Nov 2026 01:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670796;
	bh=UlpUEFrenUvYGOwRKx3auMBSjT6iYF4syJuT0u+RjW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DQy3OyJVTqOgEEGeYKWN8K6hRtLOSHzcrMQUFugUpDcNeDGeUgvXq6JoOg4G+6YRv
	 3UxW89/KgrtCrmc25kE1IwyMSoCHLvShlwsGFwkbCeBFdeETMOdcojgrf8AzLNc2Vi
	 vCuH/C+JvaaXCBNSGEZ82v1RG4KliGyEE3wYBs6alREN57iYCkZEXHvyw1WfCFdLEG
	 gT+4CnYDdMlD8/TuBzLV6mwXvqQB4tCMO6r0Mf6DlXLZo0k+0rhbU/Akg1CnYn52gU
	 RC/zNyPuLTpQxATJNaHNQC/w0pHaWhfEOox6A6+Zo9QY1wmMX3bsW+S8AEQa8UhAJ2
	 R0KoVNJwehZZw==
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
Subject: [PATCH v2 18/20] kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
Date: Mon,  2 Nov 2026 20:52:36 -0500
Message-ID: <20261103015238.3780910-19-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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
index 2acbd40a38f16..76c1e794d1157 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -188,6 +188,9 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
 
+config CC_HAS_CONDITION_COVERAGE
+	def_bool $(cc-option,-fcondition-coverage)
+
 config LD_OPT_FORCE_GROUP_ALLOCATION
 	def_string "$(ld-option-str,--force-group-allocation)"
 
-- 
2.53.0

