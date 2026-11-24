Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517761;
	b=mr7Xc66rTuzFrz5Lrn1cX4qH3nncNiwJE/qtb9EoOq29PnTkg8y6huVkLULiKYjoYPix
	 LCZq0RhhGGFWa0NSz6yxnUHr3KKf/5iujXRRRFHdJYLJASRPSowiWAXEl+aUvkqSVcu7k
	 8qeB7zlwFQgINDW8fZBGX1hf+ckJN6icdfSkyU6/ET1Pla4GxbIPg5oXBtB1LmhbGT3lz
	 uQcVzoUu4XWF/YKOWWj0+32vfBdBD15Yep2+3xNnyoYktUhSQ+hA1Hj5ciaI242L3zcIz
	 xLCi7CbSbimBPq42XbBbV5GleajRsfcI87oLjHNXbSOW6o2pujtFMPC/xNcMUGwdZog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517761;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=S2tNmjbHbXihDyQvhwnGgSo720BubGjr/0hf+WyLAzU=;
	b=o59YP0U79GUeyBc4Lr7d2PHBDsoY0mcqwHBAteuiNfjigpQXYIEH0RMtbg3gV8CGIwIZ
	 k2t730MCq9Y5exa/dcusO0Iua4bVc889TVqMwF4avWDjUaRe7TVPE4YQCtwB+xHcj93nG
	 DGaKg1tuEebEg1jWxfZJEpAr2YvIkDuIcKSRuKC/FiaWLRQVQJkPnMN8BRk6DuBQgw6/U
	 F8U9Y20fhg0ipI3NaZT9kFArv9Ek20KlGZpBi6s8Ax0wKWAmi81srO8ymoBKffbAHYnFf
	 FwJITYnuR81mDPm2kTd/gs0tHbSsUbVKNW0Xlv4/vwLeIxgnRYQKbRvkqtxP65Vb3zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=QfUT3OHK;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05343606A327
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 10:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05343606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=QfUT3OHK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795517707;
	bh=S2tNmjbHbXihDyQvhwnGgSo720BubGjr/0hf+WyLAzU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QfUT3OHKtRTd42cJd/P9zAHo3L5zLU2TYYLhbsvPstBDR7CyTTAk8Hbri5vyVoRsu
	 WS7a9qjgGwQ1pnZyUHOgF6eiCXRk27nLmYudsKyFabri6gpfDC9NeB1eBZdSqw4Z1o
	 hVbLMFcvXcb23i2eGK5WVXmw1Gsq0F1Jd9HHZ9co=
X-QQ-mid: esmtpsz19t1795517690tf6a9809a
X-QQ-Originating-IP: tack00IUInozFJUlLf1Z5WpUEH/D5Y+SjtPpOVje3r4=
Received: from localhost.localdomain ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 18:54:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6100977041111537589
EX-QQ-RecipientCnt: 7
From: Wentao Guan <guanwentao@uniontech.com>
To: nathan@kernel.org
Cc: chenhuacai@kernel.org,
	guanwentao@uniontech.com,
	linux-kbuild@vger.kernel.org,
	loongarch@lists.linux.dev,
	charlie@rivosinc.com,
	masahiroy@kernel.org
Subject: [RFC PATCH v2] kbuild: modinst: drop orphaned local labels from stripped modules
Date: Tue, 24 Nov 2026 18:54:09 +0800
Message-ID: <6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124035942.GB2738970@ax162>
References: <20261124035942.GB2738970@ax162>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M3ziZXKDk+iOq7w38GVz7vR4mMUT9A/U75Xhk/1ky7gqEGK1xpIDOcMJ
	rGUJYgI/Ep21K3fSI15qxv5yOXuWKDWgWWRSngeAoP0ypAmSidX6T2hM6swsTm7L3OtdKd/
	Uf30pIwXMcp8KEfMhz0fiv63Guwjkb2A+pG9zUBLu1h8ePejJTOMph4fM9ykE/UxcdKGwMg
	iZfdTcsm8lFYnlwLrIlucfw79G3Rpv7jDW/qyuAJfF1F4dmoamURpVlZyigW6zWAFW50iNC
	yHNS5cGCbnwGKnYxoKjejn3CmdLXkqnrOgunxCw8S+Xfu7YNTc2YRkL7fX1blol0FEulIod
	2znCVwQV02xanmeexKB2aiuZRtdJ9vV4rdtwD4xC/iabJ70qxPvczu4ZJ9+Oau1o8zCY+mj
	piaAgrJPeDqQO2MUq3/k3C22fITq1UFOThceAIsz591qKQD0MltTMccoPxx8mDAwv8cYByq
	B0/FH5OXqPOEgIQFDgxp311IYxY0iQDkoTfzUBr+UgPHCIYCZu/uPgMJiMJ93/XBWynHNBc
	Hbv9OrKS5im1M9NLYPws3VAprmYT3yyqJgAR21q/JlTSHtLsBijLZBYzShFr8TQq3LN8ufD
	CIaAk2qmi34PR1Teg9RgqtV23AbguYTpcSY9p7Llrv/B858HNkQ9o92I2XLgsjb3Xw9MRh7
	pwOSRgweq5SlUHztGQrxXWtKE4gT+m2sa+1rcwIhyo3zMD0R5ywAAA2J0OZoztMaWNY4bnl
	DrevmXZgFpJWC17im1xZZHbm4v4yAZxoQMyTyNve3JZJoLAiuOEyo0OYLq8F0w1E4UEhivZ
	RkSOD10o2oyyoZyyvHyS4DCJwsaykAPZgJmBQSlNpp37as57fGj1I+wtLlAZ2DGy0Pyv2Tf
	0HM/6mAZemqo1WW6ZVFTZPj3Xiki79z4IIGx9DNtqYAZYbAdjL3soEsMDH6qXH8oKnWu27A
	XlhE4K1F7pU7TnoV+EfKGmD03pDZpxqa+3qjhmLFzscWWyJDMz1YpaqH1S1xrZ5X6g8vFPO
	KjXtLo2E9nZhNdy9sT47UhPYs3YpwgsCnBq23Hgrl/rYD4V1G1+nLg1hOsdL+uDmlbwuLDq
	ZSR68g1R16x
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

INSTALL_MOD_STRIP=1 maps to "strip --strip-debug", which is a section
operation: it removes .debug_* and .rela.debug_* but leaves the symbol
table alone.  When the assembler has to name gcc's -g labels in the
relocations it emits for debug data, those labels stay in .symtab and
survive the strip as orphans.  Whether that happens is a property of the
target's assembler, not of the kernel: the x86-64 and arm64 assemblers
resolve the DWARF references against the section symbol with an addend,
so the labels never reach .symtab, while the LoongArch assembler names
them:

    R_LARCH_64          .LFB1 + 0
    R_LARCH_ADD_ULEB128 .LVL0 + 0

and the .LVL, .LBI, .LBB, .LFB and .LPFE labels of every object survive
the strip as orphans.

On a 7.2.2-based LoongArch distribution build such labels are 86.7% of
the symbol entries in a stratified sample of 295 of the 5712 modules.
Dropping them shrinks the module payload by 22% (176 MB to 136 MB) and
the linux-image package by 20% (195 MB to 156 MB).

Add --discard-locals to the default.  binutils removes a local symbol
only when its name follows the assembler's local label convention and no
relocation in the output names it, so what the module loader needs
survives: the relocation set of every module is byte-for-byte identical
before and after, .LC constants, .LPFE and the
-fpatchable-function-entry labels stay, and exactly one SHT_SYMTAB
remains as elf_validity_cache_index_sym() requires.  Source-level
symbols are kept as well, which is where this differs from
--strip-unneeded, proposed for the riscv module bloat by Charlie Jenkins
[1]; Masahiro Yamada objected that it also removes real symbols such as
abm_settings from kallsyms.

Keep LLVM builds on plain --strip-debug: llvm-strip refuses to strip a
symbol that a relocation still names and aborts the whole install, and a
clang-built LoongArch module carries such labels, the .L.str of its
string constants:

    llvm-strip: error: 'fc.ko': not stripping symbol '.L.str.1' because
    it is named in a relocation

so probe $(STRIP) for binutils.  Nothing is lost on LLVM builds: clang
emits none of the debug labels that bloat the package.

Placing the option in the INSTALL_MOD_STRIP=1 default also covers the
other in-tree users of the variable, the rpm and Arch packaging under
scripts/package/.

Boot tested with qemu-system-loongarch64 (EDK2 firmware, vmlinuz.efi,
test modules loaded from the initramfs with finit_module()): modules
stripped with --strip-debug, --discard-locals and --strip-unneeded all
load with rc=0, while --strip-all is rejected with "module has no
symbols (stripped?)".

Link: https://lore.kernel.org/all/CAK7LNAQ809M8VKAOBfqSn_Sc8iPgTMVu5icOgnddH_YKDvOpzA@mail.gmail.com/ [1]
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
Changes in v2:
as Nathan Chancellor suggested.
- Move the option from the Debian packaging to the INSTALL_MOD_STRIP=1
  default in scripts/Makefile.modinst, so that the rpm and Arch
  packaging and plain "make modules_install" get the same treatment.
- Drop the LoongArch condition: whether the labels exist is a property
  of the target's assembler, and on x86-64 and arm64 the option removes
  nothing to speak of, so one generic default is safe everywhere.
- Replace the projected package numbers with a measured full bindeb-pkg
  run: the linux-image package shrinks from 195 MB to 156 MB.
- Reference the earlier riscv discussion of --strip-unneeded and its
  kallsyms objection.
- Rebase onto v7.4-rc3.
v1 Link: https://lore.kernel.org/loongarch/E73BE2D8A39F2EBF+20261123121554.2559667-2-guanwentao@uniontech.com/

 scripts/Makefile.modinst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 9ba45e5b32b18..57fdfeda9130d 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -81,6 +81,12 @@ ifdef INSTALL_MOD_STRIP
 
 ifeq ($(INSTALL_MOD_STRIP),1)
 strip-option := --strip-debug
+# llvm-strip fails the install when --discard-locals hits a symbol that
+# a relocation still names; GNU strip keeps it, so limit the option to
+# binutils.
+ifneq ($(shell $(STRIP) --version 2>/dev/null | grep -qs '^GNU strip' && echo y),)
+strip-option += --discard-locals
+endif
 else
 strip-option := $(INSTALL_MOD_STRIP)
 endif

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

