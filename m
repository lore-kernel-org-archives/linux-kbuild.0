Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31779379EDA;
	Sat, 14 Mar 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497912; cv=none; b=h5efcFFPAR7ghO80QAr/OfuVKLtbVEikZ0hv0NXXfEXtogQZK+IL6Bg8jQRQk4mXxp9Y9Z4cbHuBkr6Dw/fHPqehsTzPsdChc8E6+lBPMNeaoi4BI28O7P64koZNslARjT1olHfXnoeKiyHAD0L4Z8v8xsJ/i3gSPxgJ+Ko06ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497912; c=relaxed/simple;
	bh=RgrUA5TJU4QzuOsX9G//7Vx9Q7W7ExiHVFw2qC39ujU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enmiKwipsAbKeWdHBfNFue0TyzkCtYV2GrzAGkeZQyzSOMIvmWSDNSPjIjH7uLHaPqJfNImglUxo7kykEd+Hm4KuAu8ydvXjEOsXo82x52Y1Ks+NQA+WKiOehI9tnW0B/j1odmecjxaub0MCTWyb/SShHjUQfdMc4XrpBZfHM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBJOagMD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBJOagMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C153C116C6;
	Sat, 14 Mar 2026 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773497911;
	bh=RgrUA5TJU4QzuOsX9G//7Vx9Q7W7ExiHVFw2qC39ujU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBJOagMDgJtOPruL8phc3IYViyRGJ00R671+/t2u+72aE7B4UA0l8E5+bIUtGDgqG
	 lv3LvW7jrmeYSs+nFg2Z1m4EcsPY+P+bZ3xi1kPNT+TfFTfZ5Z18nQrur3qe1K7x7V
	 QToBUOrshtqRXw3MHpofoGekwVFAy4xfhNiQQH0GL46VuWnmRRiVx4H291vz0qhcQe
	 HIS/DzRsOQIGCJBbTDe4E3qNVKUPyg+GJvOQr7NQ3zupJU2HJ8xF7wskLm7JpTxLm9
	 /GjtOi4r+elBw81GzMeUnICWAKZaCW4eV9a1dVKfLKA0K2KMp6xIwFGsDtmodE2B1W
	 UMd0BDTCkvovA==
From: Sasha Levin <sashal@kernel.org>
To: oberpar@linux.ibm.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 2/4] kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
Date: Sat, 14 Mar 2026 10:17:47 -0400
Message-ID: <20260314141749.3382679-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314141749.3382679-1-sashal@kernel.org>
References: <20260314141749.3382679-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Kconfig symbol to detect compiler support for -fcondition-coverage,
which enables MC/DC (Modified Condition/Decision Coverage) instrumentation.
This flag is available since GCC 14.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 init/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea674..38c8e06ad6d08 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -132,6 +132,9 @@ config CC_HAS_ASSUME
 config CC_HAS_NO_PROFILE_FN_ATTR
 	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 
+config CC_HAS_CONDITION_COVERAGE
+	def_bool $(cc-option,-fcondition-coverage)
+
 config CC_HAS_COUNTED_BY
 	bool
 	# clang needs to be at least 20.1.0 to avoid potential crashes
-- 
2.51.0

