Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851562;
	b=Jv53BXWZz9v0unxHoaJwbHzewqzHviI96Ob/eW1UEtadXKDIntPVP44e+bBGkuO9WLyn
	 s2IHcZdtd6i5opFeUjACgVJCt7ovLc+/ofPh9H2Wv6O0JSGvQ2wiMhyG1abVzLmCFsIdC
	 E4NAz/tX0JfVD/QfNLim56NvGXbY3AysgU6jqVmg2i0EM/FgO278m5TMS4hHB5TwH+sFj
	 drnOzoXseBOcb57qpmgIlfZBVgNd6oc3HzAPuWuMpMloHok79ug+1qZiE+N+JySmWFMpQ
	 y8uhWMfIngpCLMQxcqyuDB3PRKI6EBipsfE4JY5zPFz+zIVsWJJVMyUiL9zRd0YoyMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851562;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xb7tsDajzVXw+jyNIRt4e31d16FGhE2vHjlZgi63pw0=;
	b=1DFBJDYzRrNt5ETbqT+4p6YrN/W0So4xfAcV8kj6yp6n2aivgAgJF5dhS6KcKps8f0BQ
	 /j5iwHZhEJWymD7ET6lSD8/uflEAK32q8lcicdZi2hOmtiRZ0QfEFiRHySfzw+iLPLp8o
	 4bj52+DHV6OySs9Se2LailMrKmbW3GOG0SiezvUR5x6lJ1L+xvUm7bxjNy8CbaMh17F8v
	 ivo4y9DOZuYM6QyAmBgKz40RiCreB7ePycNXZIAZaSNWiVetWxQO+uTLi30fG5cawvi1G
	 0pqV3Scr56rBB3EwBVNCXIN8BZImiancnizUG4IFTWKczhqZOu0S7fAoVD5lkIyIbmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=h7zEJmM8;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECB606A898;
	Mon, 16 Nov 2026 17:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ECB606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=h7zEJmM8
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 490223F433;
	Mon, 16 Nov 2026 18:52:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 26AB81FBB5B;
	Mon, 16 Nov 2026 18:52:32 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id PhS7Qk6kvmB1; Mon, 16 Nov 2026 18:52:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C532D1FBB9B;
	Mon, 16 Nov 2026 18:52:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz C532D1FBB9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1794851550;
	bh=xb7tsDajzVXw+jyNIRt4e31d16FGhE2vHjlZgi63pw0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=h7zEJmM8NNLrS7TO/hnFu0F6EyoIIb468LmwLdY66DmTRwEv5kUcwKCrNiCPsl68F
	 XFp41slHnTsk2KVKfPu2cCuX0ke9r9vjHrS13L2PTerZ8P4YXPJQpSFHErs1kFMczu
	 sejcpV13QwTzK8B04IBT4DYi5whInLen87qCwPFnmhgrBcUncgYcWTHzEqJGDcWRSU
	 thuSHrrioFCmR6Yd4RiUKac9ZUu41tHOTZc4mAIgUPLjuMVsPuDEbfmui2otl0fIvs
	 MYfQkoJXhs9im7qAN6i/iYL0gfGwib1XmlHxlsWVr5LlSDhbQR8fbKtNULsBGnCnmF
	 YC1yl///yXL+A==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 9BfdUBNe52nu; Mon, 16 Nov 2026 18:52:30 +0100 (CET)
Received: from luis-Precision-5480.int.tngtech.com (unknown [193.30.133.7])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 3F0191FBB5B;
	Mon, 16 Nov 2026 18:52:30 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH v5 0/7] kbuild: record cmd-prereqs in .cmd files
Date: Mon, 16 Nov 2026 18:51:47 +0100
Message-ID: <20261116175215.1337416-1-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

KernelSbom (scripts/sbom/sbom.py) reconstructs the kernel build graph
from the .cmd files written by Kbuild. For most build outputs,
KernelSbom must infer the build inputs from the shell command stored in
savedcmd_*. This requires command-specific parsers, which add
unnecessary complexity and are difficult to maintain.

Kbuild already knows these inputs as $(real-prereqs), the non-phony
prerequisites of the Make rule. This series records them in .cmd files
using a new metadata field:

    make_prereqs_<target> :=3D <prerequisites>

KernelSbom is updated to read the new field instead of parsing the
shell command, and the obsolete command-specific parsers are removed.

The issue of manually parsing shell commands was originally mentioned
in https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech=
.com.
This series is a proposal to address that.

Cmd writers and consumers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The new field should not affect existing behavior.
Below is a summary of what I checked.

.cmd files are primarily written by cmd_and_savecmd and cmd_and_fixdep.
Both writers add make_prereqs.

The following rules append information to existing .cmd files.
None of these is affected by the new field:

- scripts/Makefile.lib: cmd_gen_objtooldep only appends new rule
  target: $(wildcard ./tools/objtool/objtool)
- scripts/Makefile.build: gen_symversions only appends comments
  #SYMVER <name> <crc>
- scripts/Makefile.lib: cmd_save_c_flags only appends a variable
  saved_c_flags_<target> :=3D <flags>
- rust/Makefile: cmd_gendwarfksyms only appends comments
  #SYMVER <name> <crc>
- kernel/Makefile: kheaders_data_dep appends a deps_* block
  deps_<target> :=3D <headers>.

This series updates the following .cmd file consumers:

- scripts/sbom/sbom/cmd_graph/cmd_file.py: CmdFile.create() is
  rewritten to parse the fields by name, including the new
  make_prereqs field.
- scripts/make_fit.py: process_dtb() previously read and split the
  complete .cmd file to find the fdtoverlay command. It is changed to
  read only the first line, so it keeps working once the new field is
  introduced.

The remaining consumers are not affected:

- Kbuild Makefiles: -include reads .cmd files as Makefile fragments. The
  new field is an ordinary variable assignment not used in any dependency
  rule.
- scripts/Makefile.thinlto: the saved_c_flags_* lookup only reads
  saved_c_flags_<target> :=3D <flags>.
- scripts/mod/modpost.c: extract_crcs_for_object() only reads comments
  #SYMVER <name> <crc>.
- scripts/mod/sumversion.c: parse_source_files() only reads
  source_<target> :=3D <source> and deps_<target> :=3D <dependencies>.
- scripts/clang-tools/gen_compile_commands.py: main() only reads the
  first line containing savedcmd_<target> :=3D <command>.
- scripts/generate_builtin_ranges.awk and
  scripts/verify_builtin_ranges.awk: get_module_info() only reads the
  first line and searches the saved command for DKBUILD_MODFILE or
  RUST_MODFILE.

Alternative: extending the deps_* field
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

An alternative to the new make_prereqs field is to merge $(real-prereqs)
into the existing deps_* field for both cmd_and_savecmd and cmd_and_fixde=
p.
This would avoid a new field and provide one dependency list. However, it
would broaden the meaning of deps_* from dependencies discovered through
generated .d files to include prerequisites already declared to Make.
This increases the risk of undesired side effects.

The writers listed above would need to ensure that each .cmd file
contains only one deps_* block. In particular, kheaders_data_dep would
need to merge its header dependencies into the block written by
cmd_and_savecmd instead of appending a second deps_* block.
cmd_and_fixdep, or fixdep.c depending on the implementation, would
likewise need to merge $(real-prereqs) with the generated dependencies.

Apart from KernelSbom, scripts/mod/sumversion.c is the only consumer
that explicitly reads deps_*. It uses selected dependency files to
calculate a module's srcversion. Extending deps_* could change this
module metadata. Such an unrelated change should probably be avoided.

Kbuild Makefiles also consume deps_* by including .cmd files. This
should not be an issue though, because $(real-prereqs) are already
present on the original target rule, so repeating them through deps_*
should not change rebuild behavior.

SBOM comparison
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I compared the SBOMs before and after the series for the same kernel
builds on x86 and arm64 allmodconfig. They are ~99% the same. The
following files are newly included in the SBOM because the manual
parsers did not cover them.

- Linker scripts: *.lds.S sources and the generated *.lds scripts.
  The old tool never extracted -T arguments, so the whole
  linker-script chain was missing.

- The intermediate vmlinux link steps: vmlinux.o,
  .vmlinux.export.c/.o, the realmode pasyms.h. Previously vmlinux.a
  was hardcoded as an input of scripts/link-vmlinux.sh. Now the real
  chain vmlinux link -> vmlinux.o -> vmlinux.a is included.

- Per-module .mod object lists: the old tool expanded the .mod file
  contents in place and recorded the objects directly as link inputs,
  without explicitly including the .mod file in the SBOM.

- Generated headers: the drm/xe and msm register tables, the aic7xxx
  sequence tables, the x32 syscall header, and module.lds.h. The old
  tool found a header only where a .c file actually includes it via
  the dep file; the new tool records the full make view, including
  headers that are never included at all.

- Config and header archives: kernel/config_data.gz and
  kernel/kheaders_data.tar.xz. The old tool missed them because their
  generation commands had no matching parser.

- Devicetree overlay sources: the .dtso files are now recorded as
  inputs of the dtb/dtbo build steps. The old tool saw only the
  temporary files those steps produce, never the sources themselves.

The following files are removed:

- dtc preprocessing scratch files: .dts.tmp, .d.pre.tmp,
  .d.dtc.tmp. The old tool recorded these temporary build by-products
  as inputs; the new tool records the real .dtso source instead. This
  is a cleanup, not a loss.

- Host tooling: the rust toolchain .md docs, the gen_smb1/2_mapping
  perl generators, and the dtc host tool's libfdt headers.
  Deliberately excluded. The SBOM should track what ends up in the image =
or
  modules, not the tooling that produces it.

Changes in v5:
- exclude .awk files from the SBOM
- add an explicit include list for genuine kernel inputs that are
  covered by the general exclusion rules, for example genuine kernel inpu=
t
  files under scripts/ and tools/ directories.

Changes in v4:
- fix a bug where excluding src tree dependencies only worked when the
  object tree was a direct child of the source tree
- fix a bug where non-normalized paths containing '..' segments bypassed
  the exclude list.=20

Changes in v3:
- split the changes into individual patches
- include the sbom changes directly in this series instead of deferring i=
t
- add the SBOM comparison section to the cover letter
- Assisted-by trailer follows
  Documentation/process/coding-assistants.rst

Changes in v2:
- filter depfile entries from make_prereqs in fixdep.c to ensure
  make_prereqs is consistent between clean and incremental builds.
  Filtering $(deps_$@) from previous builds is still required to not
  include deps that got removed in the current depfile.
---

Luis Augenstein (7):
  scripts/make_fit: limit .cmd file parsing to the savedcmd_ line
  kbuild: refactor fixdep to collect dependencies before printing
  scripts/sbom: skip make_prereqs lines when parsing .cmd files
  kbuild: record cmd-prereqs in .cmd files
  scripts/sbom: parse make_prereqs from .cmd files
  scripts/sbom: use make_prereqs to determine build inputs
  scripts/sbom: remove the command-specific parsers

 Documentation/tools/sbom/sbom.rst             |  23 +-
 scripts/Kbuild.include                        |  10 +-
 scripts/basic/fixdep.c                        | 163 +++++-
 scripts/make_fit.py                           |   2 +-
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 149 ++---
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |   6 +-
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py |  57 +-
 .../sbom/sbom/cmd_graph/dependency_filter.py  | 109 ++++
 .../sbom/cmd_graph/hardcoded_dependencies.py  |   1 -
 .../cmd_graph/savedcmd_parser/__init__.py     |   6 -
 .../command_parser_registry.py                | 516 ------------------
 .../savedcmd_parser/command_splitter.py       | 128 -----
 .../savedcmd_parser/savedcmd_parser.py        |  67 ---
 .../cmd_graph/savedcmd_parser/tokenizer.py    |  92 ----
 scripts/sbom/sbom/config.py                   |  14 -
 scripts/sbom/sbom/spdx_graph/kernel_file.py   |  63 ++-
 .../tests/cmd_graph/test_savedcmd_parser.py   | 468 ----------------
 17 files changed, 376 insertions(+), 1498 deletions(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/dependency_filter.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.=
py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_p=
arser_registry.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_s=
plitter.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_=
parser.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer=
.py
 delete mode 100644 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py

--=20
2.43.0

