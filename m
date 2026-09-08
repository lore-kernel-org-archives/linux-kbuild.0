Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31E3B71D2;
	Tue,  8 Sep 2026 20:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899673; cv=none; b=l/OPA3E5LxAdSrIDeA7/Xzc96RZZOZPcIUvVj4g3SHMdewnMN2k3dYFqzAvWV8li9TxcPY0n45Q642sLTre1dr55A1ucdq8MFLDp9OMTsP/V3z7lmkRGoXzmTiFJ3P8H0o/7YBddvZm8ObCOt2C4mTzID7uC337joe43z3qnFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899673; c=relaxed/simple;
	bh=e6KyJKvQKFiNsK0tdk2JX64adzD69+Bkaek7Wzd0ogw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6WrKPC42X08zs0zaarFs7LokJz2ukEOKAWb2KPW74fc5pcftc0EQjxOrjbHDgvT4MUMR6xXi4XErwh2FJ7zjvrhW/Il/SOChq52dopsrVdjIKtaElwDDbE45TDqTEpCQZ+80u+KwkOl2lIxKNYolYgbQJN8DfhACzlItBO0YKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSeXbv7H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSeXbv7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58681F00ACA;
	Tue,  8 Sep 2026 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899672;
	bh=fdTvcze5X7ZfgZodtkOyMQipZQ892On/LSssO1gYaqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nSeXbv7Hm86jWgW4t5Fq36kiYBRB5IF8dstyqJWPT+XVW5zcjuQijd5TJK4UCOwzH
	 eezBBUuBfHfFHh5hUS4/ZEuD7MzvZTXHuFm/lULkd0YLGc0jZs4WVDd6RwxOGyPU8B
	 Z8PvVTDchyBuE1i7vVjlj/KPRBZlYD4vVevM5fu6ia6N2oy/HVdhFa/jS+GvfBfPxk
	 m6lBdkGB7xSS3aACLtgTA8TbE9KS+kG72bU/mTzITui8sZTckeZMprxyiy0mdHe/7Q
	 MH1loRMOXEIPTbLSp0haAySZH5+3ejVYHvtO77A2wiCaYJWEBK37iTIt32LW+39/K4
	 /RhL8UXURki6A==
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
Subject: [PATCH v2 08/27] efi/libstub: Drop .discard.addressable from the stub objects
Date: Tue,  8 Sep 2026 13:33:20 -0700
Message-ID: <7523022447bd218c6ab556308eb4b03a74528033.1788899473.git.jpoimboe@kernel.org>
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

