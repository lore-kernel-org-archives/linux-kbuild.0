Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54645583AC6;
	Tue,  8 Sep 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899677; cv=none; b=cMnMV5FMQPyrS12dQS0UGvMGhcnmPLdq+mkjQHMkSQHjmXNSpSILB1sH4bw3IWDkDX9gJphZelLQVMS1T6nXmbWPg3zHXWhiM4r1t9WEHFfnOdw4VowieX8DMNx/M54IhR1x3OC6WhTSKzZZYZJJlwPyRMAUF4ZRIMvJ0jZwAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899677; c=relaxed/simple;
	bh=MoxkdQ1PZtbscQc+lhfZEsLtnTOuV5Kr1isBaLFfg/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ovdp8thz60H6aCLKM4IIemXkRv97IsYgaQ8ZnpIpMQWXNMx/z0dQNBb6LZXKq0NOaSU5I0xVV2C1XFvu4pJ0M84CZ+5uwXj4nZh6qbBfjMMeMG1T2Jd33ZiO0MDsawzVGyzzRRUn1EdnqGgvKM/4DUU4nVblusFV9KXwczi+Oyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixOWwXE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixOWwXE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7B51F00A3E;
	Tue,  8 Sep 2026 20:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899676;
	bh=oMAVVsJ+ySiw/1VP59+j9m215Ku23i+uiwwAe+dcMn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ixOWwXE/raQf8YJQF8qzjRzz4yZ+nnWs+/eNKosvDLYBD0s/gM/+ymaHI0LcIi3pO
	 cp3Xu+TiIGoi0JpUWQ2KogZ6CAZqhf9Es1PJyNw3G0JgMiI7anoxqx6CHUCzyaHoAP
	 ABxJ0H4NU3vDGiPvMjfEWLqSLPnK7SWmxUvdEs7BAD3TnOL1DVJ045FH0mjXkClkBU
	 3UFcIsqxQJorNSstWhSbFMv9s9lawWti4K54RlOE4JECtnxzccl6z42qekykJ1NoTN
	 TENVB7H2DHk3ncSx3+S2NuKP2H1tdCicGq6KVNb1KyvvTAf8aPIklWXpK0Iz+6VWD/
	 qRbW6qKbEPSFQ==
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
Subject: [PATCH v2 15/27] x86/xen: Ignore noreturn status of weak mem_map_via_hcall()
Date: Tue,  8 Sep 2026 13:33:27 -0700
Message-ID: <238f5da77d70fb2ae6428c201be9b547479f798d.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
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

