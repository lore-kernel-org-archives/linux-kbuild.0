Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8753AD51C;
	Tue,  8 Sep 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899669; cv=none; b=Ki4BoIp/MOvPw5owyFZJeqzQRYRAXJgty5pvcEdVxoHJManXUtgTy6ucNmOK9J2kzLFKnSJ9jnp3ZliCLsvmSfa7rFhnf8+v99iupqrclsBQtGR7U5V+9e7M6ZSHBJacHYScPonu8EwiqAaodlS71gqhUxDOkUbR+xjYlZepVv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899669; c=relaxed/simple;
	bh=i2WUqestzEV+CQZTM2vaVu6zEsLumMc9aLqWUXeG64o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VL/FWoEjmQEMgKxrrbDjqoI3fWT6Eygs6dPBNSKOGvuv94oUD5kGiWmIXu/qARLfxdqNdZRuFIl33dtmvB/2JNIkE6aQhHzx8EUTUI1nulSVD/VoYH+SDG9hsWKCIAbYi9zqiu0WkDw5LLTIR9JAdrAjkejNRg93yiMXn7KHiFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkqiX6n2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkqiX6n2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC321F00A3A;
	Tue,  8 Sep 2026 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899667;
	bh=P0t5klcuGPOZqVzgT74rAAnNeq5d/EWeiRAWMV72lLE=;
	h=From:To:Cc:Subject:Date;
	b=PkqiX6n2s04YkmZZLUAVi3EvVcneX6hGlDBvg8iOxLhyJueFIotihcsr1+2o/VuwN
	 fYBc3MLazF/MAoE+8rLPs88F8cbCAxbDkxfArI29YFIUEP1oxf+cdUpa0sAkqACf32
	 7d7TboIlCOC7hLOx81yLlinvXe5WYHzcyO01KAuT6NRH2BLgWlp8FYbnjfM7Bxaj6G
	 PLAQcXv2hWrPmqUw1ZlmIyGGBhgbtnNQkkWifKP5jSIbubZt2+y9vdlbS21LobG3rH
	 Kg9Z2SElkWLR0ks2bx4G3CfSjmjnmfMh0O/sehUSmROfTw7yJtfOIIgefmdrnilqBT
	 vMrkblB3swoNA==
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
Subject: [PATCH v2 00/27] objtool: dynamically detect noreturns
Date: Tue,  8 Sep 2026 13:33:12 -0700
Message-ID: <cover.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes since v1 (https://lore.kernel.org/cover.1787890035.git.jpoimboe@kernel.org):
- improve commit log for "kbuild: Defer running objtool to link time for all CFG features"
- rebase on v7.3-rc2 to get a proper Sashiko review

The C and rust manual noreturn lists are a maintenance nightmare.  Get
rid of them by taking advantage of the fact that objtool can run on
linked objects (vmlinux.o and modules) and can thus detect noreturns
dynamically:

  1) When features are enabled which require the noreturn knowledge
     (i.e., control flow analysis) always defer objtool to run on linked
     objects.  That obsoletes most of noreturns.h. (patch 12)

  2) For noreturn functions which are exported by vmlinux, dynamically
     write their names to a file which is then read by objtool running
     on modules.  That obsoletes most of the remaining noreturns.h
     entries and the entirety of is_rust_noreturn(). (patch 24)

  3) For the (four) noreturn functions which are exported by modules,
     manually annotate them at their declaration sites with a new
     ANNOTATE_EXPORTED_NORETURN().  That removes the last few stragglers
     in noreturns.h. (patch 26)

Josh Poimboeuf (27):
  objtool: Remove obsolete noreturns.h entries
  kbuild: Add CONFIG_OBJTOOL_DEFERRED
  kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
  objtool: Fix dead end detection for sibling calls
  objtool: Refactor the noreturn/dead-end detection
  objtool: Ignore traps after noreturn calls in STT_CODE
  objtool: Make .discard.stack_frame_non_standard non-allocatable
  efi/libstub: Drop .discard.addressable from the stub objects
  efi/loongarch: Mark loongarch efi_boot_kernel() non-standard for
    objtool
  objtool: Add ANNOTATE_IGNORE_NORETURN()
  LoongArch: Annotate reboot and kexec paths as returnable
  kbuild: Defer running objtool to link time for all CFG features
  rust: Annotate the intrinsic stubs as returnable
  panic: Mark abort() __noreturn
  x86/xen: Ignore noreturn status of weak mem_map_via_hcall()
  objtool: Detect noreturns in weak functions
  x86/entry: Make rewind_stack_and_make_dead() a real function
  x86/xen: Make xen_cpu_bringup_again() a real function
  x86/xen: Make xen_start_kernel() noreturn
  x86/boot: Rework how pi startup symbols get exposed to vmlinux
  objtool: Fix noreturn detection for non-sibling jumps to SYM_CODE
  objtool: Add options to write/read exported noreturns to/from a file
  kbuild: Do the per-module objtool pass right before linking
  kbuild: Generate the noreturn list and validate modules against it
  objtool: Add ANNOTATE_EXPORTED_NORETURN()
  objtool: Annotate all module-exported noreturns and remove noreturns.h
  objtool: Warn about missing/stale ANNOTATE_EXPORTED_NORETURN() usage

 Makefile                                 |   8 +
 arch/arc/kernel/traps.c                  |   4 +-
 arch/arm/kernel/traps.c                  |   2 +-
 arch/loongarch/kernel/machine_kexec.c    |   2 +
 arch/loongarch/kernel/reset.c            |   4 +
 arch/x86/boot/startup/Makefile           |  16 +-
 arch/x86/boot/startup/exports.h          |  14 -
 arch/x86/boot/startup/unprefix.syms      |  13 +
 arch/x86/entry/entry_64.S                |   7 +-
 arch/x86/kernel/vmlinux.lds.S            |   2 -
 arch/x86/platform/pvh/enlighten.c        |   1 +
 arch/x86/xen/enlighten_pv.c              |   5 +-
 arch/x86/xen/xen-head.S                  |   5 +-
 arch/x86/xen/xen-ops.h                   |   2 +-
 drivers/firmware/efi/libstub/Makefile    |   4 +
 drivers/firmware/efi/libstub/loongarch.c |   8 +
 drivers/message/fusion/mptbase.h         |   2 +
 include/kunit/test.h                     |   1 +
 include/kunit/try-catch.h                |   2 +
 include/linux/annotate.h                 |  24 ++
 include/linux/objtool.h                  |  13 +-
 include/linux/objtool_types.h            |   1 +
 include/linux/panic.h                    |   2 +-
 include/linux/rtc/ds1685.h               |   2 +
 kernel/exit.c                            |   2 +-
 lib/Kconfig.debug                        |  14 +
 lib/Kconfig.ubsan                        |   2 +-
 rust/.gitignore                          |   1 +
 rust/Makefile                            |  17 +
 scripts/.gitignore                       |   1 +
 scripts/Makefile.build                   |  31 +-
 scripts/Makefile.lib                     |   4 +-
 scripts/Makefile.modfinal                |  35 +-
 scripts/Makefile.vmlinux_o               |  13 +-
 scripts/link-vmlinux.sh                  |   3 +-
 scripts/livepatch/klp-build              |   4 +-
 tools/include/linux/objtool_types.h      |   1 +
 tools/objtool/Documentation/objtool.txt  |  30 +-
 tools/objtool/builtin-check.c            |  12 +
 tools/objtool/check.c                    | 437 +++++++++++++++++------
 tools/objtool/include/objtool/builtin.h  |   2 +
 tools/objtool/include/objtool/elf.h      |   4 +
 tools/objtool/klp-diff.c                 |  32 ++
 tools/objtool/noreturns.h                |  56 ---
 44 files changed, 584 insertions(+), 261 deletions(-)
 delete mode 100644 arch/x86/boot/startup/exports.h
 create mode 100644 arch/x86/boot/startup/unprefix.syms
 delete mode 100644 tools/objtool/noreturns.h

-- 
2.55.0

