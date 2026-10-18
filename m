Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F139448F;
	Sun, 18 Oct 2026 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295904; cv=none; b=D8JIrB2gicRuHVIV4Pl15IUaeX5MHe4N9IarmdfTRFItVoTUZIPc0vXaIp2qpXQ/0tV5dgAd4JeKt8AurBXmh545DGY3aUn9ONpG1JLwYQDqagFVLbKUmm4uJdedCRr14Ul0sVTsQB49XNpuhKU+Zfx0Ks+OgyvfTyStMV4wmdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295904; c=relaxed/simple;
	bh=R5LxgwmBzFMijoqODUbsnjxx9u0ViAm3kfqNsFOs7gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLQWLDuxiCnclv06779viFdKJHgL5SPzO6sM4Q7SQ07S0r72u8y+Ed7j3Eg8zRSLVC/irzPU7U9m7uYJj3+LQBaAjocIIIN8swKW7sHluUYi3k7MOg+9Yp9O1CQJZ63G+ShAEeuIZuWhgXLlNTHT0CO38vPns+vAhUEcVXlanhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e++wEngT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e++wEngT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781961F000C5;
	Sun, 18 Oct 2026 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792295901;
	bh=jWxr8Sh9v5TViGkO54WngISxjMy9mLjVU3SN2JkvKTk=;
	h=Date:From:To:Cc:Subject;
	b=e++wEngTaay6lHPWisoWJLt5dw6aPTRpbw8ZA0XlXYCTorx+E6zs4wUPt2iNQVcyL
	 flSk6uICG5YxUWvqTo8OPdc3nPoWsOmLsTV3yJv7TOTQ1STBjRRI98JN4C6gYzpL9E
	 nOD67HdI0CHy35+flak1wOvEOeyKUPszOzotjxUArDr9CaEm8ehq1mQC6qDCUxK2rd
	 pbE9YGPpaXIqv7v2nUi+oV9Zttb/gOmyx+E1fpS9mhzq/mA2IOyJUrXyStZFSBYsPL
	 j/cVk3REptbEdjKwKkAiFoGmGwX3/lvKzm/k9RyUfv9p5eiuhmUoLvx/epILPNKQzh
	 EooQRNAUAB8Kg==
Date: Sat, 17 Oct 2026 20:58:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild / Kconfig updates for 7.4
Message-ID: <20261018035817.GA2365306@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the following Kbuild and Kconfig updates for 7.4, with
full details available in the signed tag.

You will see an immediate conflict in init/Kconfig between

  eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing reserved parameter")

that went into 7.3-rc6 and

  f85147b291e3 ("kbuild: move the toolchain checks into scripts/Kconfig.toolchain")

in my tree. The solution in init/Kconfig should be obvious but make sure
to reapply eb13a1ff271b in scripts/Kconfig.toolchain, which I have been
doing in -next easily with:

  $ git show eb13a1ff271b init/Kconfig | sed 's;init/Kconfig;scripts/Kconfig.toolchain;g' | git apply -3v

My latest merge is at

  https://git.kernel.org/kbuild/c/2a5a1c2fab91358d44198eb16bf83e4989f73333

for reference if necessary.

There are a few other conflicts that I have been notified about in
-next, which all appear to be minor.

  - Makefile from the rust tree:
    https://lore.kernel.org/asl8rgrKtHW3_-Yc@sirena.co.uk/

  - drivers/firmware/efi/libstub/Makefile from the efi tree:
    https://lore.kernel.org/aslflbcgByI1rH2_@sirena.co.uk/

  - scripts/kallsyms.c from the -mm tree:
    https://lore.kernel.org/arz2wQWcnS9499di@sirena.org.uk/

  - scripts/remove-stale-files from the rust tree:
    https://lore.kernel.org/asN8ejNILKW2YWep@sirena.co.uk/

If there are any issues or concerns, please let me know.

Cheers,
Nathan

The following changes since commit 59351365ac271b5e0eb180f211c531476a36221f:

  scripts/mksysmap: fix escape of '$' in the __pi_ pattern (2026-09-12 20:01:19 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.4-1

for you to fetch changes up to 997208ce9f43f01febac956cf9aeffe89945e3c1:

  Merge branch 'kbuild-next-speedups' into kbuild-next (2026-10-17 15:20:23 -0700)

----------------------------------------------------------------
Kbuild / Kconfig updates for 7.4

Kbuild:

- Suppress compiler flags in debug info for external module builds

- Use '-fmacro-prefix-map' in more places in the build

- Merge initial set of changes from Lorenzo's speed up series, along
  with some fixes found through testing

  - Avoid allocating .modinfo in vmlinux

  - Speed up kallsyms by indexing symbols by token and outputting binary
    data to disk directly then including in assembly via .incbin

  - Don't sort $(NM) output when unnecessary

  - Only emit relocations on the final vmlinx link

  - Reimplement mksysmap in C

  - Move many cc-option and ld-option calls into the Kconfig stage to
    cache their results

  - Use pigz for gzip compression when available

- Move gen_init_cpio and gen_initramfs.sh from usr/ to scripts/

- Add a TOML configuration to scripts/container and update documentation
  accordingly

- Add a generic, opt-in mechanism for checking that headers can compile
  standalone

- Update machine function splitting argument for LLVM 24 rename in
  AutoFDO build

- Miscellaneous minor clean ups, fixes, and hardening, mostly
  found/fixed via LLMs

Kconfig:

- Turn recursive ranges into an error

- Fix savedefconfig for defaults that were adjusted for being out of
  range and revert a previously applied workaround

- Improvements and hardening around integer and hexadecimal values

- Emit a warning when selecting or implying a choice symbol, which has no
  effect

- Emit a warning when KCONFIG_PROBABILITY is malformed

- Introduce def_string / def_int / def_hex to mirror the existing
  def_bool / def_tristate to succinctly set a value and type at the same
  time.

- Add cc-option-str and ld-option-str macros to act like Kbuild's
  cc-option and ld-option, returning the string when the option is
  supported, allowing many checks to be moved into Kconfig

- Minor usability improvements to Kconfig tests

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Aaron Tomlin (1):
      localmodconfig: Explicitly report boolean configs during integrity check

Aayansh Ranjan (1):
      kbuild: fix grammar in output Makefile .gitignore generation comment

Bhaskar Chowdhury (1):
      scripts/mkcompile_h: Update LINUX_COMPILE_HOST command substitution syntax

Brigham Campbell (1):
      .gitignore: ignore pacman package signatures

Dmitrii Tulnov (1):
      kconfig: warn about malformed KCONFIG_PROBABILITY values

Erkan Erdem (1):
      docs: kconfig: fix shell function syntax in caveats

Guillaume Tucker (3):
      scripts: add TOML config to container tool
      Documentation: dev-tools: update container.rst with config file
      Documentation: dev-tools: refer to user ID rather than id

Hemanth Selam (1):
      kbuild: fix typo "funtions" in comment

Jaihind Yadav (1):
      scripts/gcc-plugins: suppress recorded GCC switches for extmod builds

Jan Stancek (1):
      .gitignore: drop Module.markers

Jani Nikula (1):
      kbuild: add header check facility as a manually run static analyzer

Julian Braha (9):
      kconfig: error out for recursive range
      kconfig: fix extra output from savedefconfig on out-of-range defaults
      kconfig: promote invalid numeric reference from warning to error
      kconfig: check for out-of-bounds numeric constants
      kconfig: check for hex and int mismatches
      kconfig: prevent out-of-bounds user input for numeric options
      kconfig: use unsigned integers for hex range checks
      tee: remove TZMEM_MODE_GENERIC
      kconfig: cleanup stale comment about 'keys' array

Kees Cook (5):
      kconfig: Add "def_string", "def_int" and "def_hex"
      kconfig: Replace "cc-option-bit" with "cc-option-str"
      kconfig: Add "ld-option-str"
      kbuild: Mark the gzip recipes as recursive
      kbuild: Mark the initcall ordering recipe as recursive

Leizhen Zhang (3):
      gen_init_cpio: stop parsing on lines with a missing argument list
      kconfig: fix infinite loop in conf_choice() when no choice value is visible
      kconfig: use the value argument in sym_get_near_range_bound()

Lorenzo Stoakes (ARM) (11):
      kbuild: do not allocate .modinfo in vmlinux
      kallsyms: index symbols by token to speed up table compression
      kallsyms: output binary data to speed output and kallsyms assembly
      sorttable: parse nm output correctly
      kbuild: do not sort nm output where the order is irrelevant
      kbuild: only emit vmlinux relocations when required
      elf-parse: add section flags, symbol binding and mapping helpers
      kallsyms: reimplement mksysmap in C
      kbuild: move the toolchain checks into scripts/Kconfig.toolchain
      kbuild: avoid re-running compiler and linker probes
      kbuild: compress the kernel with pigz if available

Nathan Chancellor (8):
      erofs: Revert "Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic"
      Merge tag 'kbuild-tzmem-kconfig-7.4' into kbuild-next
      Merge tag 'kbuild-fixes-7.3-1' into kbuild-next
      kbuild: Remove alignment on .modinfo section
      scripts/Kconfig.toolchain: Drop compiler symbols from dependencies
      kconfig: Improve ergonomics around disabling warnings with cc-option
      kbuild: AutoFDO: Update split machine function argument for upstream rename
      Merge branch 'kbuild-next-speedups' into kbuild-next

Nicolas Schier (7):
      kconfig: Warn on dead select or imply for choice values
      kbuild: Mark usr_gen_init_cpio as no-dot-config-target
      kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
      kconfig: tests: Reset all KCONFIG_* env variables by default
      kconfig: tests: Provide defconfig outfile for savedefconfig
      kconfig: tests: warn_changed_input: Simplify by reusing the extra env
      kconfig: tests: {old,save}defconfig: Forward dynamic keyword arguments

Sasha Levin (1):
      kbuild: keep .modinfo when vmlinux is linked with --gc-sections

Thomas Weißschuh (1):
      kbuild: use prefix-map for host and user progs

Ting-Han Hou (3):
      checkkconfigsymbols.py: Parse Git status output line by line
      clang-tools: Import os for broken pipe handling
      scripts/make_fit: Ignore schema checks when decomposing DTBs

Yuntao Wang (1):
      setlocalversion: make tag local to try_tag()

 .gitignore                                         |   3 +-
 Documentation/dev-tools/container.rst              | 118 ++++++-
 .../early-userspace/early_userspace_support.rst    |  16 +-
 .../filesystems/ramfs-rootfs-initramfs.rst         |  10 +-
 Documentation/kbuild/kbuild.rst                    |  17 +
 Documentation/kbuild/kconfig-language.rst          |  13 +-
 Documentation/kbuild/kconfig-macro-language.rst    |   8 +-
 Documentation/kbuild/makefiles.rst                 |   7 +-
 Documentation/process/changes.rst                  |   8 +
 MAINTAINERS                                        |   2 +
 Makefile                                           |  76 +++--
 arch/alpha/boot/Makefile                           |   4 +-
 arch/arc/boot/Makefile                             |   2 +-
 arch/arm/boot/compressed/Makefile                  |   2 +-
 arch/arm64/boot/Makefile                           |   2 +-
 arch/arm64/kernel/pi/Makefile                      |   2 +-
 arch/csky/boot/Makefile                            |   2 +-
 arch/microblaze/boot/Makefile                      |   2 +-
 arch/mips/boot/Makefile                            |   2 +-
 arch/mips/boot/compressed/Makefile                 |   2 +-
 arch/nios2/boot/Makefile                           |   2 +-
 arch/parisc/boot/compressed/Makefile               |   2 +-
 arch/riscv/boot/Makefile                           |   2 +-
 arch/riscv/kernel/pi/Makefile                      |   2 +-
 arch/s390/boot/Makefile                            |   2 +-
 arch/sh/boot/Makefile                              |   2 +-
 arch/sh/boot/compressed/Makefile                   |   2 +-
 arch/sparc/boot/Makefile                           |   4 +-
 arch/x86/Kconfig                                   |  17 +
 arch/x86/Makefile                                  |  12 +-
 arch/x86/boot/Makefile                             |   2 +-
 arch/x86/boot/compressed/Makefile                  |   4 +-
 arch/xtensa/boot/Makefile                          |   2 +-
 drivers/firmware/efi/libstub/Makefile              |   2 +-
 drivers/firmware/efi/libstub/Makefile.zboot        |   2 +-
 drivers/firmware/qcom/Kconfig                      |  26 +-
 drivers/firmware/qcom/qcom_tzmem.c                 |   4 +-
 fs/erofs/Kconfig                                   |   8 +-
 include/asm-generic/vmlinux.lds.h                  |   2 +-
 init/Kconfig                                       | 197 +----------
 kernel/Makefile                                    |   6 +-
 scripts/.gitignore                                 |   1 +
 scripts/Kconfig.include                            |  29 +-
 scripts/Kconfig.toolchain                          | 272 +++++++++++++++
 scripts/Makefile                                   |   8 +-
 scripts/Makefile.autofdo                           |   2 +-
 scripts/Makefile.build                             |  21 ++
 scripts/Makefile.gcc-plugins                       |   4 +
 scripts/Makefile.lib                               |   4 +-
 scripts/Makefile.package                           |   2 +-
 scripts/Makefile.vmlinux                           |  20 +-
 scripts/Makefile.vmlinux_o                         |   2 +-
 scripts/Makefile.warn                              |  28 +-
 scripts/check-function-names.sh                    |   3 +-
 scripts/checkkconfigsymbols.py                     |   2 +-
 scripts/clang-tools/run-clang-tools.py             |   1 +
 scripts/container                                  |  86 ++++-
 scripts/elf-parse.c                                | 103 +++++-
 scripts/elf-parse.h                                |  54 +++
 {usr => scripts}/gen_init_cpio.c                   |   1 +
 {usr => scripts}/gen_initramfs.sh                  |   4 +-
 scripts/jobserver-exec                             |   3 +-
 scripts/kallsyms-sysmap.c                          | 248 ++++++++++++++
 scripts/kallsyms.c                                 | 379 +++++++++++++++------
 scripts/kallsyms.h                                 |  44 +++
 scripts/kconfig/conf.c                             |  19 +-
 scripts/kconfig/confdata.c                         |   6 +
 scripts/kconfig/kconfig-sym-check.pl               |   2 +-
 scripts/kconfig/lexer.l                            |   3 +
 scripts/kconfig/lkc.h                              |   2 +-
 scripts/kconfig/lkc_proto.h                        |   1 +
 scripts/kconfig/lxdialog/textbox.c                 |   2 -
 scripts/kconfig/menu.c                             |  66 +++-
 scripts/kconfig/parser.y                           |   8 +-
 scripts/kconfig/streamline_config.pl               |  20 +-
 scripts/kconfig/symbol.c                           | 106 ++++--
 scripts/kconfig/tests/conftest.py                  |  27 +-
 scripts/kconfig/tests/def_type/Kconfig             |  28 ++
 scripts/kconfig/tests/def_type/__init__.py         |  18 +
 scripts/kconfig/tests/def_type/expected_guard_n    |   9 +
 scripts/kconfig/tests/def_type/expected_guard_y    |  11 +
 scripts/kconfig/tests/def_type/guard_n.config      |   1 +
 scripts/kconfig/tests/def_type/guard_y.config      |   1 +
 scripts/kconfig/tests/err_num_bounds/Kconfig       |  79 +++++
 scripts/kconfig/tests/err_num_bounds/__init__.py   |  12 +
 .../kconfig/tests/err_num_bounds/expected_stderr   |  10 +
 scripts/kconfig/tests/err_num_mismatch/Kconfig     |  38 +++
 scripts/kconfig/tests/err_num_mismatch/__init__.py |   9 +
 .../kconfig/tests/err_num_mismatch/expected_stderr |   4 +
 .../kconfig/tests/err_num_non_numeric_ref/Kconfig  |  75 ++++
 .../tests/err_num_non_numeric_ref/__init__.py      |   9 +
 .../tests/err_num_non_numeric_ref/expected_stderr  |  16 +
 scripts/kconfig/tests/err_recursive_dep/Kconfig    |  24 ++
 .../tests/err_recursive_dep/expected_stderr        |  13 +
 .../kconfig/tests/randconfig_probability/Kconfig   |  12 +
 .../tests/randconfig_probability/__init__.py       | 130 +++++++
 scripts/kconfig/tests/savedefconfig_range/Kconfig  |  67 ++++
 .../kconfig/tests/savedefconfig_range/__init__.py  |   8 +
 scripts/kconfig/tests/savedefconfig_range/config   |   8 +
 .../tests/savedefconfig_range/expected_defconfig   |   0
 scripts/kconfig/tests/warn_changed_input/Kconfig   |   5 +
 .../kconfig/tests/warn_changed_input/__init__.py   |  21 +-
 .../tests/warn_changed_input/expected_config       |   1 +
 scripts/kconfig/tests/warn_num_bounds/Kconfig      |  24 ++
 scripts/kconfig/tests/warn_num_bounds/__init__.py  |  25 ++
 scripts/kconfig/tests/warn_num_bounds/config       |   7 +
 .../kconfig/tests/warn_num_bounds/expected_config  |  11 +
 .../tests/warn_num_bounds/expected_config_stderr   |   3 +
 .../tests/warn_num_bounds/expected_frontend_config |  11 +
 .../tests/warn_num_bounds/expected_frontend_stderr |   0
 scripts/link-vmlinux.sh                            |  24 +-
 scripts/make_fit.py                                |   3 +-
 scripts/mkcompile_h                                |   2 +-
 scripts/mksysmap                                   |  94 -----
 scripts/remove-stale-files                         |   2 +
 .../sbom/tests/cmd_graph/test_savedcmd_parser.py   |   2 +-
 scripts/setlocalversion                            |   3 +-
 scripts/sorttable.c                                |  15 +-
 scripts/ver_linux                                  |   1 +
 tools/lib/python/jobserver.py                      |  13 +
 tools/testing/selftests/kho/vmtest.sh              |   2 +-
 tools/testing/selftests/liveupdate/vmtest.sh       |   4 +-
 tools/testing/selftests/nolibc/Makefile.nolibc     |   2 +-
 usr/.gitignore                                     |   4 +-
 usr/Kconfig                                        |   2 +-
 usr/Makefile                                       |   6 +-
 126 files changed, 2374 insertions(+), 678 deletions(-)
 create mode 100644 scripts/Kconfig.toolchain
 rename {usr => scripts}/gen_init_cpio.c (99%)
 rename {usr => scripts}/gen_initramfs.sh (97%)
 create mode 100644 scripts/kallsyms-sysmap.c
 create mode 100644 scripts/kallsyms.h
 create mode 100644 scripts/kconfig/tests/def_type/Kconfig
 create mode 100644 scripts/kconfig/tests/def_type/__init__.py
 create mode 100644 scripts/kconfig/tests/def_type/expected_guard_n
 create mode 100644 scripts/kconfig/tests/def_type/expected_guard_y
 create mode 100644 scripts/kconfig/tests/def_type/guard_n.config
 create mode 100644 scripts/kconfig/tests/def_type/guard_y.config
 create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
 create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
 create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/Kconfig
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/__init__.py
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/config
 create mode 100644 scripts/kconfig/tests/savedefconfig_range/expected_defconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr
 delete mode 100755 scripts/mksysmap
