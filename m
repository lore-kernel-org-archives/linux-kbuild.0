Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572412;
	b=rNESibwINw3XA41XfZGtaz6KtuUWUIHfCAk+KaY949C5EZJ/B7j4hQSRCY8E7M9AIcVt
	 Xa3xMsIo9f+SzamLkpH1dJK2OBEakLK4nb7IhY6+srXU944Lsp6voTGsrJ0VpAVmey+l9
	 619YMsX1BcqSffXhvyFBrm5HoQqvSdlx7NXl17muMj9eFMsTR08EneXQXVwy8AwF4oWr3
	 7Pp1vS0jFeoyjfEOJtBarQE+SWLi/s50fFUoA1/mMdL4uOMi3WQFvDEhl9iMBaPhDqSX/
	 wKn1v+cG55MQdMF7SI5KaZbR0/KQL9rgxIBFeoZ8fsqNT0oeClCP+m15VYXvNvfm4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572412;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=iNtN9KGTIQKbiiuxbum6DdOI9gPPlvKGxzSwL4r8vnU=;
	b=haMtjkwCsUKV/KKe76CHkYLwTB+S9LURDiKxz14ge3k1lN/fKMLIXLfcl5FjpEhANUkv
	 JIDmwoYaLj+m6V2NuXp0wG8TSO4uoeFC7ipyi+npGrSxRmrbRPsKGXnLVXfm/dQ3ANPCh
	 vY8kh/ByV+WAWLHACjDED3PUpc2F2/yLNTYq6FT8zLvhZ7r7kkAQjvYsK2by69zH4XiEf
	 J5PpImApioF4eJ/uGF8LMmc5/hfwFzWKzQ2oW4hMtgbx1xowdvgCG4x5z+GlGYSg8tf+h
	 g+y+DUFmXkKVynwp5mrYJA4CJDMf+xjc1xjzTY25qGGFvnWvYQjIEGx202ERT6bNLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxcX3CdI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0FB606A686;
	Wed, 25 Nov 2026 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XxcX3CdI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6151B1F000D2;
	Wed, 25 Nov 2026 02:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572411;
	bh=iNtN9KGTIQKbiiuxbum6DdOI9gPPlvKGxzSwL4r8vnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XxcX3CdIzDMH0kSKCgUetltdjeZv4VhbNu+Q6GZvauML+Xk2mJaQSh1moCHxvZRz+
	 CxkeOwnX00epTeZw9JnlLkH634mWjus3fATSgvxwpB5HaPwmmJQoVLf6HFRbyCYMbZ
	 fB4BkGR2F/ziboTTh1wjLIRgY6CccNzQM3Q8eGn5zbSGLUa7eyi2W65XX/Yy7sdQSK
	 rpDZflW/+/xcJEPwtrxzh8OJvbR8AFfg3fNSpZLUbsL/Ul/v+zPM0rsUPRAIwEoLA0
	 CcGem9TLZDfYk4g9qTGPX47tQlohJlffNrbp6bPOR3hNKOcU9LI2lHjYsCNMKHGZms
	 ZVZ0CUtTi4feQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Chuck Wolber <chuck@wolber.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 17/19] kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
Date: Tue, 24 Nov 2026 21:06:01 -0500
Message-ID: <20261125020603.3934222-18-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
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
 scripts/Kconfig.toolchain | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 8571cd16a2edd..661db9e7a89ee 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -193,6 +193,11 @@ config CC_OPT_WNO_PGO_COVERAGE
 	# gcc: not supported
 	def_string "$(cc-option-str,-Wno-pgo-coverage)"
 
+config CC_HAS_CONDITION_COVERAGE
+	# gcc-14: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=08a52331803f66a4aaeaedd278436ca8eac57b50
+	# clang: not supported
+	def_bool $(cc-option,-fcondition-coverage)
+
 config LD_OPT_FORCE_GROUP_ALLOCATION
 	def_string "$(ld-option-str,--force-group-allocation)"
 
-- 
2.53.0

