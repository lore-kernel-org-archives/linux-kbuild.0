Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A925221CD;
	Mon, 21 Sep 2026 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029902; cv=none; b=kx+J/NUczI+4UeGqlvJx1YbusTCx69++M8ghEddY+EOHzHZbPTTCiFNaMyvZdlZ+ISs9QaQ6bRt7mdOz6jUMLkNn99aqp0pY7QXil+Vq0vf3PQp5acJtY7MozfGvaaNRYBjEW5jdmeUtkm2nrOZIqNySsJ48/LdArM1fvGt/XHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029902; c=relaxed/simple;
	bh=JlNHcKy84toxA3F/QODe9s2E25bY0rtEGf8hPjb1p4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWMTab3iwTJ1mg7zULGi2HbkSHfqF9QwJFf7U3nkFgSfoTU8Q/6SGYcGdzmB1UvRhl3nzJ0PZU54AjOvnfWBjqF/cJiD2wK2CXHVia4V4r7QT0KoLEkJfz5JLzF53SP7+O/9rbGqOiqqhzIQBuPge5LUt1jikm9ceMlcuPWzNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnAwChiJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnAwChiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923981F00899;
	Mon, 21 Sep 2026 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029901;
	bh=UYuVqrd/jN+ZBhEgyr15URZxAUdCHsFFz1C246Rxdwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fnAwChiJVvNcu4xqJ5to5IGrPfT9W1hMYYuqXpSBZOmtkDoxKbps6r7vEXBOWDFhv
	 xI/u/MW7edjY9Wd5ywb3LthTuT4/+o2yVRJUTfn/l5sVHq6xZ4a0SPvUB5oF/TJIyJ
	 PfpwG85wklQ166bb7VVR13pQP5susD1gBGwspGGq13d/VtwD0rfKawyXSu3jck1kgg
	 siRvXOJ/EmUoUCql+u/iqqnBWP4e6QsbWNpWdhWGnAwgzvEy8Zv0//crkMxOK5r5Bb
	 Zaa1C7p9z4RR6GRVYGPVrC1KS9GYf0jVlUDniQleybxUO45MxoYr/AURA9pRfhyH84
	 pp1+m0JnDHpbw==
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
Subject: [PATCH v3 08/28] efi/libstub: Drop .discard.addressable from the stub objects
Date: Mon, 21 Sep 2026 15:31:09 -0700
Message-ID: <3800f3cb9e7ff835bf30e9a7981518b680e2fbef.1790028654.git.jpoimboe@kernel.org>
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

On arm64, riscv and loongarch, the EFI stub objects are objcopy'd with
--prefix-alloc-sections=.init, which renames every allocatable section.

The .discard.addressable section is allocatable, so if
STACK_FRAME_NON_STANDARD() and __ADDRESSABLE() are used, the section
gets renamed and never discarded:

  ld: warning: orphan section `.init.discard.addressable' from `vmlinux.o' being placed in section `.init.discard.addressable'

The section is also a problem for the stub's absolute relocation check
on some arches.

In preparation for using STACK_FRAME_NON_STANDARD() in libstub code,
remove the section for both cases.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 77a2b2d74f3f6..0d5d99c3cacdd 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -155,6 +155,11 @@ STUBCOPY_FLAGS-$(CONFIG_LOONGARCH)	+= --prefix-alloc-sections=.init \
 					   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_LOONGARCH)	:= R_LARCH_MARK_LA
 
+# Drop the section created by __ADDRESSABLE() from the absolute symbol check
+# and the objcopy, otherwise it gets prefixed and doesn't get discared.
+STUBCOPY_RM_SECTIONS			:= --remove-section=.discard.addressable
+STUBCOPY_FLAGS-y			+= $(STUBCOPY_RM_SECTIONS)
+
 $(obj)/%.stub.o: $(obj)/%.o FORCE
 	$(call if_changed,stubcopy)
 
@@ -166,7 +171,7 @@ $(obj)/%.stub.o: $(obj)/%.o FORCE
 #
 quiet_cmd_stubcopy = STUBCPY $@
       cmd_stubcopy =							\
-	$(STRIP) --strip-debug -o $@ $<;				\
+	$(STRIP) --strip-debug $(STUBCOPY_RM_SECTIONS) -o $@ $<;	\
 	if $(OBJDUMP) -r $@ | grep $(STUBCOPY_RELOC-y); then		\
 		echo "$@: absolute symbol references not allowed in the EFI stub" >&2; \
 		/bin/false;						\
-- 
2.55.0

