Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13E3C585B;
	Fri, 28 Aug 2026 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892725; cv=none; b=n6V3TvmMpW1T5lxxlyuP1ILY89iqIYbE24EtjOv1FaRSlFEofyI31AmL2ypAnCT1Y5GfgjhUjHuTK9jnAu3ipF/eRgjRFo1upgqftcQcGjQHnTujVnUGbDF2cPXw0gTzNi6bPm9SkQynLB8onr0CZndF7EbiM8D2tBOkevW4MGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892725; c=relaxed/simple;
	bh=e6KyJKvQKFiNsK0tdk2JX64adzD69+Bkaek7Wzd0ogw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1KYRf3My5rRBMlSi8OR+y/hwzQF2e0mlK9UomcJUAHCHOl/9kkaOnY7MyJMEYtlYJUBMeXK28UbFxTbTW6ENYSehzQ95Z+TiJKfuUPZq1bKav74dJsjTl0zoxtnq3Vz3W9E1PAiGENNbzshREPy6/5sso46h8R/FbjvPrWuIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mu5St60y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mu5St60y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CA01F00A3E;
	Fri, 28 Aug 2026 04:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892723;
	bh=fdTvcze5X7ZfgZodtkOyMQipZQ892On/LSssO1gYaqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mu5St60ysGjtb7vgf22dbWtuzrnJTT36wxNRoX5kfS8hSdtHEAr5KO/2tABtNy7A4
	 +hXRVj0aJIzizpfEJTEGSpUrprh0gPjEOWmo7m8WZ+ZwGAM4gAu0M039JN9n9uhtkJ
	 yFCNlEau2hrqGAij/asGYSL+uPxEcYF9Qv9yDmfHAz/7oilK1aTQYZ5g3Dk3iaSpzv
	 kYVy7Yv0bGu2zuouYYghlCWjkvVPrKOxdI/ptEPdFcJQqa8ZTW4Gd2nbzTWJGVMof4
	 0nvUVqD7ciRUMKHMoWkNcBOJcY6VUl2g5CY1EiAIsRSSVPKt6SKLdqno9BCefuCrY0
	 kJlJm9FRdbjng==
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
Subject: [PATCH 08/27] efi/libstub: Drop .discard.addressable from the stub objects
Date: Thu, 27 Aug 2026 21:51:37 -0700
Message-ID: <5f2d4e4327a8bd94c47782076a91cf0ad050acf2.1787890035.git.jpoimboe@kernel.org>
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

On arm64, riscv and loongarch, the EFI stub objects are objcopy'd with
--prefix-alloc-sections=.init, which renames every allocatable section.

The .discard.addressable section is allocatable, so if
STACK_FRAME_NON_STANDARD() and __ADDRESSABLE() are used, the section
gets renamed and never discarded:

  ld: warning: orphan section `.init.discard.addressable' from `vmlinux.o' being placed in section `.init.discard.addressable'

In preparation for using STACK_FRAME_NON_STANDARD() in libstub code,
remove the section during objcopy.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f6..1344d08b420a2 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -155,6 +155,10 @@ STUBCOPY_FLAGS-$(CONFIG_LOONGARCH)	+= --prefix-alloc-sections=.init \
 					   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_LOONGARCH)	:= R_LARCH_MARK_LA
 
+# Drop the section created by __ADDRESSABLE() so it doesn't get prefixed.
+# Its job is already done.
+STUBCOPY_FLAGS-y			+= --remove-section=.discard.addressable
+
 $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,stubcopy)
 
-- 
2.55.0

