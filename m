Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA5530DE4;
	Mon, 21 Sep 2026 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029915; cv=none; b=KJ+BJl9W4oL4EPsXDtXCx9QK8ckcSPFh9jT11J3D7bYmMlZwgNsKrmQ1aKk7SiGRZx+bnkOxjp9CzMnaDN2FWrQ4o61Ea2hNd/XRxLIACBo1ouHiRZQ7Ybt48kznKzrOIXQajaWXjDm1cRFDokazt8w/HeKnpxZd4sO6m9S8QsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029915; c=relaxed/simple;
	bh=5bBRDLqdG3HoBqFDKpwYmEAP2bGtHwFMRcRRkTMHu64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tm+9w96VTC7wIN6ZZO/DxjsWvGg7arJnjtECy9U6x/Ibwbwoq+jQnS5vCgdvprzHLvdDWfRS1M+24Qz5iAW0JcfM16EWgsGED4+KcX6maLIfCupf+j9IXKRixSyEIvc4U8giFS7NB0xgu0u0zmf6VbgU9WNpGDiU+axNCTi1bXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ib/+Esbl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ib/+Esbl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511B81F00899;
	Mon, 21 Sep 2026 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029912;
	bh=8rAfUgTVZOinbM0Oj3dguGbjiGiZmL4cuZNgaPRrK6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ib/+Esbl6oqQu46MVyXOoFxsw4bgIYXvFYQskbrg0sqthK2/OLsvz0KbKq4bfl2fS
	 eXJaO/fAcC5oDZ2SIHbTyKFu+10XE1HIZQQHD/8Q4CDpLC2uoEbBTvtE0MD1FO8jp/
	 EXfdY8/9PXAaRAE8qWgwoOmUpUSE5bfYTlC8lI0ImjIzXHiLd80voBDNGMoGBaR3eT
	 YbMmJG4kpn9pr1b6OpWVWPjVioMBXGzMD4r1/FncsKuhTrlrd9RQaFFi2//bKH6JWW
	 QSznPxBq5h3FNRYK8KriyLoiTSWkiq7yERhDKNn9+7KyRe/JRqUDrERCwY9+8eBSQY
	 NfW2NbuUJfclQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 28/28] fixup! objtool: Add options to write/read exported noreturns to/from a file
Date: Mon, 21 Sep 2026 15:31:29 -0700
Message-ID: <e3487a76b311ac759bc68ff893a309548bc49169.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix resource leaks on error paths in write_noreturns(): free buf on
fopen() failure, and free buf + fclose fp on fwrite() failure.

Found by Sashiko review.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/check.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 626402023e4a3..8d1448cdb40ca 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -350,11 +350,14 @@ static int write_noreturns(struct objtool_file *file)
 	fp = fopen(opts.noreturns_write, "w");
 	if (!fp) {
 		ERROR_GLIBC("fopen");
+		free(buf);
 		return -1;
 	}
 
 	if (fwrite(buf, 1, len, fp) != len) {
 		ERROR_GLIBC("fwrite");
+		free(buf);
+		fclose(fp);
 		return -1;
 	}
 
-- 
2.55.0

