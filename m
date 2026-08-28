Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019853CF942;
	Fri, 28 Aug 2026 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892729; cv=none; b=lNHrNCnk4lYvNOYgZs5Y4c22KjRbkqe4dyQJdbI5QbNr6hDP1mwawRY3ezDABbt6282WW2ti2glGtQSQ5fvZXPil+565zmqjx0o/qvHcY4MIcWTRVn4E5jbFI/+e/qTGwZWIrNgCN5EnJozB8tK77IrLTCM+f53WFmpSy3GpCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892729; c=relaxed/simple;
	bh=MoxkdQ1PZtbscQc+lhfZEsLtnTOuV5Kr1isBaLFfg/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUTbPwrWB6uslDwnM/HjBzTdS8FldjuRBh43efjKRlTxd/t27qr8YNPX69eg3bgUHzat41SIRrVmiN2IlAmR9riHg7JpCRDKN5tR9EN+DEs/O+v8BIYRbrgI0ivKVpmVMhQi/fVbtime3VZJWb1KBLS1k/zZ/SajSdGG4M4SX1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGYkbray; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGYkbray"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714311F00AC4;
	Fri, 28 Aug 2026 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892727;
	bh=oMAVVsJ+ySiw/1VP59+j9m215Ku23i+uiwwAe+dcMn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WGYkbrayep8wN20L0/XBZuHDOxbEe8AgyfYpOAlQmGtDY4yd9pzgOF0M4qLArdG7i
	 N6aXq3Mtbo/moiXKNw57N832d45cUx8mfO06h+83mJtquDfNKt/4KbweCPGfacu8V3
	 LU5Dl7KQD5vJo8LZMwoHko4Qa7jnlDuDxok96/1LBriEczUHq5wKvN1cZiekE4o/5i
	 RV73VYixMP4Jg32e4uif971h5QPx/k1plRf4vNPPzK39XnBXVs91yvbMWiKcQx/9Pn
	 RlsE8zRCQYNbPGXW71EGvZo/KZtuBlUvm/7cqPNjZ4E2JuxvdOX5KAEXPN2eGgRv6J
	 CxNoO7n/lbxBQ==
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
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 15/27] x86/xen: Ignore noreturn status of weak mem_map_via_hcall()
Date: Thu, 27 Aug 2026 21:51:44 -0700
Message-ID: <d38468fc69fa077c883d06012dd6084efbedda61.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike the non-weak version, the weak version of mem_map_via_hcall()
doesn't return.  Tell objtool to ignore that, as the protoype (and the
non-weak version) aren't noreturn so its callers can't assume it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608280214.c28GlIx6-lkp@intel.com/
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/platform/pvh/enlighten.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index f2053cbe9b0ce..9f227f06cbaf5 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -37,6 +37,7 @@ void __init __weak mem_map_via_hcall(struct boot_params *ptr __maybe_unused)
 	xen_raw_printk("Error: Could not find memory map\n");
 	BUG();
 }
+ANNOTATE_IGNORE_NORETURN(mem_map_via_hcall);
 
 static void __init init_pvh_bootparams(bool xen_guest)
 {
-- 
2.55.0

