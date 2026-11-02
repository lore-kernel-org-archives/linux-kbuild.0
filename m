Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651008;
	b=2tk25PCTGwPGZvbYnEQzoao5WoZQHqmlO8/j/eb4WSvx36ij7kIEm6bMVRIwSA+Titux
	 RV9JpWEyfhrk8mKGqb8lN/0jAA5t4y6PLmp1OSqIUAtSBh8prZkTH9Bz+O7xLTHP3uqMf
	 LeYsf8KBmkCuoQgw4IIK11Nbe6pYaGCkpCmXiFFIOIB3Tdf7S32KdvJLzn/GMXTyisnDh
	 NfRN8alMIu+Kzb8T8QJCG9NAIB+azYLceeCWc2OXFq3TWqZuRcaGM+BaE6zjdSx0VcuRV
	 uVo0DCOxtFNhDkyYgshVUV1y33sohOYoAunF1iMC7h11jYGo79jOFxqEKQBP+QeOccw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651008;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMturZq9oZfqZZUZ+y3QTLp/r+X7E0AkmUC/p847nt4=;
	b=J/2CdLVkbJCLbDOLYd4snk5xQEBfQkE0wxV5xCGP/XMwNBd4GWNW9dIYHmsvUdbiMy3/
	 tLxwCv26S3jfsPAk/o/vQA5EiFTEEXrWpmNlt/evVK1k/pcOC0qDuDhWj0ZReg7gCOvbi
	 Jj+phjzO08D8niLUYBRlFIUnlWP6OlcRe9Z/dpdha9O+d+83MD3WRVfv+6Z+T9eoZr80U
	 8Oa1A2a8bpqtWKdt8+lcj/t9lDZiw6Cb/HIanHKjJbM0g6zAxmZst/UKKKetuhRR1aB4h
	 IFwnkK53eTO9dbgDIYD/q5/GQzjxTMn72qinKthEJRZb0qSabuv1MJAx7z0B+W7YwSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=X++MSlxW;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B5606D828;
	Mon,  2 Nov 2026 20:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1B5606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=X++MSlxW
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id AB70640440;
	Mon,  2 Nov 2026 21:23:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A3E6A1FBB81;
	Mon,  2 Nov 2026 21:23:22 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id QCbzE2KoenbW; Mon,  2 Nov 2026 21:23:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id F14FB1FBBEE;
	Mon,  2 Nov 2026 21:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz F14FB1FBBEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1793651000;
	bh=wMturZq9oZfqZZUZ+y3QTLp/r+X7E0AkmUC/p847nt4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=X++MSlxWT/xEdeiUHy27sleCoFaHZVSW4qBIokS1PsHqg2JDRaGGvM4sAbuY6s9oZ
	 hXlxEmP5Q08nfeN2xiI6PG4f+CDyCoGJ4ui+TSAkseodvzXucvuuZkYAgv4U2/ofuG
	 ZIyyYQCcLqAQwNZgKLSSKgpoRIW46+6SVqpZBILbIgbmisPLIYGmeGmyoAbFx9Z4Vi
	 Wb0qROFxE+YTIPhCsyTSStlK5lb7VZzz98BSt+MuIpa8Q3sIESqDsM+ImrjOXgr50i
	 UdGTeka+FstJrjI3sDa2aG7WIja9wEHwpRjvdbKxz95uKAAcDM1WYdwfIrOPafSjDm
	 1yl/0APlFA8dg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4OIzK64d3I51; Mon,  2 Nov 2026 21:23:19 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 6F4391FBCD5;
	Mon,  2 Nov 2026 21:23:19 +0100 (CET)
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
Subject: [PATCH v4 7/7] scripts/sbom: remove the command-specific parsers
Date: Mon,  2 Nov 2026 21:23:00 +0100
Message-ID: <20261102202308.3209536-8-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102202308.3209536-1-luis.augenstein@tngtech.com>
References: <20261102202308.3209536-1-luis.augenstein@tngtech.com>
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

With the build inputs taken from make_prereqs_ and deps_, the
command-specific parsers are no longer needed. Remove them, and with
them the --do-not-fail-on-unknown-build-command option, which only
existed to tolerate build commands that the parsers did not support.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 Documentation/tools/sbom/sbom.rst             |  22 +-
 scripts/sbom/sbom/cmd_graph/cmd_file.py       |   1 -
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py |   1 -
 .../sbom/cmd_graph/hardcoded_dependencies.py  |   1 -
 .../cmd_graph/savedcmd_parser/__init__.py     |   6 -
 .../command_parser_registry.py                | 516 ------------------
 .../savedcmd_parser/command_splitter.py       | 128 -----
 .../savedcmd_parser/savedcmd_parser.py        |  67 ---
 .../cmd_graph/savedcmd_parser/tokenizer.py    |  92 ----
 scripts/sbom/sbom/config.py                   |  14 -
 .../tests/cmd_graph/test_savedcmd_parser.py   | 468 ----------------
 11 files changed, 3 insertions(+), 1313 deletions(-)
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_par=
ser_registry.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_spl=
itter.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_pa=
rser.py
 delete mode 100644 scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py
 delete mode 100644 scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py

diff --git a/Documentation/tools/sbom/sbom.rst b/Documentation/tools/sbom/s=
bom.rst
index 029b08b6ad8..aada5f4875c 100644
--- a/Documentation/tools/sbom/sbom.rst
+++ b/Documentation/tools/sbom/sbom.rst
@@ -121,9 +121,9 @@ from multiple sources:
=20
 * **.cmd files**: The primary source is the ``.cmd`` file of the
   generated artifact, e.g., ``arch/x86/boot/.bzImage.cmd``. These files
-  contain the exact command used to build the artifact and often include
-  an explicit list of input dependencies. By parsing the ``.cmd``
-  file, the full list of dependencies can be obtained.
+  record the shell command used to build the artifact, the make
+  prerequisites (``make_prereqs_*``), and, for compiler-generated targets,
+  additional dependencies (``deps_*``) like header files.
=20
 * **.incbin statements**: The second source are include binary
   ``.incbin`` statements in ``.S`` assembly files.
@@ -188,19 +188,3 @@ In this scenario, KernelSbom does not produce a dedica=
ted
 artifacts are included together in ``sbom-build.spdx.json``, and
 ``sbom.used-files.txt`` lists all files referenced in the build document.
=20
-Unknown Build Commands
-~~~~~~~~~~~~~~~~~~~~~~
-
-Because the kernel supports a wide range of configurations and versions,
-KernelSbom may encounter build commands in ``.cmd`` files that it does
-not yet support. By default, KernelSbom will fail if an unknown build
-command is encountered.
-
-If you still wish to generate SPDX documents despite unsupported
-commands, you can use the ``--do-not-fail-on-unknown-build-command``
-option. KernelSbom will continue and produce the documents, although
-the resulting SBOM will be incomplete.
-
-This option should only be used when the missing portion of the
-dependency graph is small and an incomplete SBOM is acceptable for
-your use case.
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/cm=
d_graph/cmd_file.py
index 58ca6aa5946..648404efec3 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -76,7 +76,6 @@ class CmdFile:
=20
         Args:
             obj_tree: absolute path to the object tree.
-            fail_on_unknown_build_command: Whether to fail if an unknown b=
uild command is encountered.
=20
         Returns:
             list[PathStr]: dependency file paths relative to `obj_tree`.
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py b/scripts/sbom/s=
bom/cmd_graph/cmd_graph_node.py
index c608cb1ca82..dea257b2251 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
@@ -24,7 +24,6 @@ class IncbinDependency:
 class CmdGraphNodeConfig(Protocol):
     obj_tree: PathStr
     src_tree: PathStr
-    fail_on_unknown_build_command: bool
=20
=20
 @dataclass
diff --git a/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py b/script=
s/sbom/sbom/cmd_graph/hardcoded_dependencies.py
index 2eb04d30f4e..f911fc6f23a 100644
--- a/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
+++ b/scripts/sbom/sbom/cmd_graph/hardcoded_dependencies.py
@@ -10,7 +10,6 @@ from sbom.environment import Environment
 HARDCODED_DEPENDENCIES: dict[str, list[str]] =3D {
     # defined in linux/Kbuild
     "include/generated/rq-offsets.h": ["kernel/sched/rq-offsets.s"],
-    "kernel/sched/rq-offsets.s": ["include/generated/asm-offsets.h"],
     "include/generated/bounds.h": ["kernel/bounds.s"],
     "include/generated/asm-offsets.h": ["arch/{arch}/kernel/asm-offsets.s"=
],
 }
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py b/scri=
pts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py
deleted file mode 100644
index d13876af4df..00000000000
--- a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/__init__.py
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-from sbom.cmd_graph.savedcmd_parser.savedcmd_parser import parse_inputs_fr=
om_commands
-
-__all__ =3D ["parse_inputs_from_commands"]
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_reg=
istry.py b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_regis=
try.py
deleted file mode 100644
index a48040b2c13..00000000000
--- a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_parser_registry.py
+++ /dev/null
@@ -1,516 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-import re
-import shlex
-from typing import Callable, Iterator
-
-import sbom.sbom_logging as sbom_logging
-from sbom.environment import Environment
-from sbom.cmd_graph.savedcmd_parser.command_splitter import IfBlock, split=
_commands
-from sbom.cmd_graph.savedcmd_parser.tokenizer import (
-    CmdParsingError,
-    Option,
-    Positional,
-    tokenize_single_command,
-    tokenize_single_command_positionals_only,
-)
-from sbom.path_utils import PathStr
-
-CommandParser =3D Callable[[str], list[PathStr]]
-CommandParserRegistryEntry =3D tuple[re.Pattern[str], CommandParser]
-
-
-def _parse_dd_command(command: str) -> list[PathStr]:
-    match =3D re.match(r"dd.*?if=3D(\S+)", command)
-    if match:
-        return [match.group(1)]
-    return []
-
-
-def _parse_cat_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["cat", input1, input2, ...]
-    return [p for p in positionals[1:]]
-
-
-def _parse_compound_command(command: str) -> list[PathStr]:
-    compound_command_parsers: list[CommandParserRegistryEntry] =3D [
-        (re.compile(r"dd\b"), _parse_dd_command),
-        (re.compile(r"cat.*?\|"), lambda c: _parse_cat_command(c.split("|"=
)[0])),
-        (re.compile(r"cat\b[^|>]*$"), _parse_cat_command),
-        (re.compile(r"echo\b"), _parse_noop),
-        (re.compile(r"\S+=3D"), _parse_noop),
-        (re.compile(r"printf\b"), _parse_noop),
-        (re.compile(r"sed\b"), _parse_sed_command),
-        (
-            re.compile(r"(.*/)scripts/bin2c\s*<"),
-            lambda c: [input] if (input :=3D c.split("<")[1].split(">")[0]=
.strip()) !=3D "/dev/null" else [],
-        ),
-        (re.compile(r"^:$"), _parse_noop),
-    ]
-
-    match =3D re.match(r"\s*[\(\{](.*)[\)\}]\s*>", command, re.DOTALL)
-    if match is None:
-        raise CmdParsingError("No inner commands found for compound comman=
d")
-    input_files: list[PathStr] =3D []
-    inner_commands =3D split_commands(match.group(1))
-    for inner_command in inner_commands:
-        if isinstance(inner_command, IfBlock):
-            sbom_logging.error(
-                "Skip parsing inner command {inner_command} of compound co=
mmand because IfBlock is not supported",
-                inner_command=3Dinner_command,
-            )
-            continue
-
-        parser =3D next((parser for pattern, parser in compound_command_pa=
rsers if pattern.match(inner_command)), None)
-        if parser is None:
-            sbom_logging.error(
-                "Skip parsing inner command {inner_command} of compound co=
mmand because no matching parser was found",
-                inner_command=3Dinner_command,
-            )
-            continue
-        try:
-            input_files +=3D parser(inner_command)
-        except (CmdParsingError, IndexError) as e:
-            sbom_logging.error(
-                "Skip parsing inner command {inner_command} of compound co=
mmand because of command parsing error: {error_message}",
-                inner_command=3Dinner_command,
-                error_message=3Dstr(e),
-            )
-    return input_files
-
-
-def _parse_objcopy_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command, flag_options=3D["-S=
", "-w"])
-    positionals =3D [part.value for part in command_parts if isinstance(pa=
rt, Positional)]
-    # expect positionals to be ['objcopy', input_file] or ['objcopy', inpu=
t_file, output_file]
-    return [positionals[1]]
-
-
-def _parse_link_vmlinux_command(command: str) -> list[PathStr]:
-    """
-    For simplicity we do not parse the `scripts/link-vmlinux.sh` script.
-    Instead the `vmlinux.a` dependency is just hardcoded for now.
-    """
-    return ["vmlinux.a"]
-
-
-def _parse_cp_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["cp", input1, ..., destination]
-    return positionals[1:-1]
-
-
-def _parse_noop(command: str) -> list[PathStr]:
-    """
-    No-op parser for commands with no input files (e.g., 'rm', 'true').
-    Returns an empty list.
-    """
-    return []
-
-
-def _parse_ar_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ['ar', flags, output, input1, input2, ...]
-    flags =3D positionals[1]
-    if "r" not in flags:
-        # 'r' option indicates that new files are added to the archive.
-        # If this option is missing we won't find any relevant input files.
-        return []
-    return positionals[3:]
-
-
-def _parse_ar_piped_xargs_command(command: str) -> list[PathStr]:
-    printf_command, _ =3D command.split("|", 1)
-    positionals =3D tokenize_single_command_positionals_only(printf_comman=
d.strip())
-    # expect positionals to be ['printf', '{prefix_path}%s ', input1, inpu=
t2, ...]
-    prefix_path =3D positionals[1].removesuffix("%s ")
-    return [f"{prefix_path}{filename}" for filename in positionals[2:]]
-
-
-def _parse_gcc_or_clang_command(command: str) -> list[PathStr]:
-    parts =3D shlex.split(command)
-    # compile mode: expect last positional argument ending in a source fil=
e extension to be the input file
-    for part in reversed(parts):
-        if not part.startswith("-") and any(part.endswith(suffix) for suff=
ix in [".c", ".S", ".dts"]):
-            return [part]
-
-    # linking mode: expect all .o files to be the inputs
-    return [p for p in parts if p.endswith(".o")]
-
-
-def _parse_rustc_command(command: str) -> list[PathStr]:
-    parts =3D shlex.split(command)
-    # expect last positional argument ending in `.rs` to be the input file
-    for part in reversed(parts):
-        if not part.startswith("-") and part.endswith(".rs"):
-            return [part]
-    raise CmdParsingError("Could not find .rs input source file")
-
-
-def _parse_rustdoc_command(command: str) -> list[PathStr]:
-    parts =3D shlex.split(command)
-    # expect last positional argument ending in `.rs` to be the input file
-    for part in reversed(parts):
-        if not part.startswith("-") and part.endswith(".rs"):
-            return [part]
-    raise CmdParsingError("Could not find .rs input source file")
-
-
-def _parse_syscallhdr_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command.strip(), flag_option=
s=3D["--emit-nr"])
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["sh", path/to/syscallhdr.sh, input, output]
-    return [positionals[2]]
-
-
-def _parse_syscalltbl_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command.strip())
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["sh", path/to/syscalltbl.sh, input, output]
-    return [positionals[2]]
-
-
-def _parse_mkcapflags_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["sh", path/to/mkcapflags.sh, output, input=
1, input2]
-    return [positionals[3], positionals[4]]
-
-
-def _parse_orc_hash_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["sh", path/to/orc_hash.sh, '<', input, '>'=
, output]
-    return [positionals[3]]
-
-
-def _parse_xen_hypercalls_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["sh", path/to/xen-hypercalls.sh, output, i=
nput1, input2, ...]
-    return positionals[3:]
-
-
-def _parse_gen_initramfs_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command)
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["sh", path/to/gen_initramfs.sh, input1, in=
put2, ...]
-    return positionals[2:]
-
-
-def _parse_vdso2c_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ['vdso2c', raw_input, stripped_input, outpu=
t]
-    return [positionals[1], positionals[2]]
-
-
-def _parse_vdsomunge_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ['vdsomunge', input, output]
-    return [positionals[1]]
-
-
-def _parse_ld_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(
-        command=3Dcommand.strip(),
-        flag_options=3D[
-            "-shared",
-            "--no-undefined",
-            "--eh-frame-hdr",
-            "-Bsymbolic",
-            "-r",
-            "--no-ld-generated-unwind-info",
-            "--no-dynamic-linker",
-            "-pie",
-            "--no-dynamic-linker--whole-archive",
-            "--whole-archive",
-            "--no-whole-archive",
-            "--start-group",
-            "--end-group",
-        ],
-    )
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["ld", input1, input2, ...]
-    return positionals[1:]
-
-
-def _parse_sed_command(command: str) -> list[PathStr]:
-    command_parts =3D shlex.split(command)
-    # expect command parts to be ["sed", *, input]
-    input =3D command_parts[-1]
-    if input =3D=3D "/dev/null":
-        return []
-    return [input]
-
-
-def _parse_awk(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command)
-    options =3D [p for p in command_parts if isinstance(p, Option)]
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    has_script_file =3D any(p.name =3D=3D "-f" for p in options)
-    # With -f option: expect ["awk", input1, input2, ...]
-    # Without -f option: expect ["awk", inline_program, input1, input2, ..=
.]
-    return positionals[1:] if has_script_file else positionals[2:]
-
-
-def _parse_nm_piped_command(command: str) -> list[PathStr]:
-    nm_command, _ =3D command.split("|", 1)
-    command_parts =3D tokenize_single_command(
-        command=3Dnm_command.strip(),
-        flag_options=3D["-p", "--defined-only"],
-    )
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["nm", input1, input2, ...]
-    return [p for p in positionals[1:]]
-
-
-def _parse_pnm_to_logo_command(command: str) -> list[PathStr]:
-    command_parts =3D shlex.split(command)
-    # expect command parts to be ["pnmtologo", <options>, input]
-    return [command_parts[-1]]
-
-
-def _parse_relacheck(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["relacheck", input, log_reference]
-    return [positionals[1]]
-
-
-def _parse_gen_hyprel_command(command: str) -> list[PathStr]:
-    gen_hyprel_command, _ =3D command.split(">", 1)
-    command_parts =3D shlex.split(gen_hyprel_command)
-    # expect command_parts to be ["gen-hyprel", input]
-    return [command_parts[1]]
-
-
-def _parse_perl_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command.strip=
())
-    # expect positionals to be ["perl", input]
-    return [positionals[1]]
-
-
-def _parse_strip_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command, flag_options=3D["--=
strip-debug"])
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["strip", input1, input2, ...]
-    return positionals[1:]
-
-
-def _parse_mkpiggy_command(command: str) -> list[PathStr]:
-    mkpiggy_command, _ =3D command.split(">", 1)
-    positionals =3D tokenize_single_command_positionals_only(mkpiggy_comma=
nd)
-    # expect positionals to be ["mkpiggy", input]
-    return [positionals[1]]
-
-
-def _parse_relocs_command(command: str) -> list[PathStr]:
-    if ">" not in command:
-        # Only consider relocs commands that redirect output to a file.
-        # If there's no redirection, we assume it produces no output file =
and therefore has no input we care about.
-        return []
-    relocs_command, _ =3D command.split(">", 1)
-    command_parts =3D shlex.split(relocs_command)
-    # expect command_parts to be ["relocs", options, input]
-    return [command_parts[-1]]
-
-
-def _parse_mk_elfconfig_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["mk_elfconfig", "<", input, ">", output]
-    return [positionals[2]]
-
-
-def _parse_flex_command(command: str) -> list[PathStr]:
-    parts =3D shlex.split(command)
-    # expect last positional argument ending in `.l` to be the input file
-    for part in reversed(parts):
-        if not part.startswith("-") and part.endswith(".l"):
-            return [part]
-    raise CmdParsingError("Could not find .l input source file in command")
-
-
-def _parse_bison_command(command: str) -> list[PathStr]:
-    parts =3D shlex.split(command)
-    # expect last positional argument ending in `.y` to be the input file
-    for part in reversed(parts):
-        if not part.startswith("-") and part.endswith(".y"):
-            return [part]
-    raise CmdParsingError("Could not find input .y input source file in co=
mmand")
-
-
-def _parse_tools_build_command(command: str) -> list[PathStr]:
-    positionals =3D tokenize_single_command_positionals_only(command)
-    # expect positionals to be ["tools/build", "input1", "input2", "input3=
", "output"]
-    return positionals[1:-1]
-
-
-def _parse_extract_cert_command(command: str) -> list[PathStr]:
-    command_parts =3D shlex.split(command)
-    # expect command parts to be [path/to/extract-cert, input, output]
-    input =3D command_parts[1]
-    if not input:
-        return []
-    return [input]
-
-
-def _parse_dtc_command(command: str) -> list[PathStr]:
-    wno_flags =3D [command_part for command_part in shlex.split(command) i=
f command_part.startswith("-Wno-")]
-    command_parts =3D tokenize_single_command(command, flag_options=3Dwno_=
flags)
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be [path/to/dtc, input]
-    return [positionals[1]]
-
-
-def _parse_bindgen_command(command: str) -> list[PathStr]:
-    command_parts =3D shlex.split(command)
-    header_file_input_paths =3D [part for part in command_parts if part.en=
dswith(".h")]
-    return header_file_input_paths
-
-
-def _parse_gen_header(command: str) -> list[PathStr]:
-    command_parts =3D shlex.split(command)
-    # expect command parts to be ["python3", path/to/gen_headers.py, ..., =
"--xml", input]
-    i =3D next((i for i, token in enumerate(command_parts) if token =3D=3D=
 "--xml"), None)
-    if i is None:
-        raise CmdParsingError(f"Expected --xml input file in gen_headers c=
ommand but got {command}")
-    return [command_parts[i + 1]]
-
-def _parse_mkuboot_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command)
-    # mkuboot.sh passes all args to mkimage; -d specifies the data/input i=
mage file
-    for part in command_parts:
-        if isinstance(part, Option) and part.name =3D=3D "-d" and part.val=
ue is not None:
-            return [part.value]
-    raise CmdParsingError("Could not find -d (data file) option in mkuboot=
.sh command")
-
-
-def _parse_syscallnr_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command.strip())
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["sh", path/to/syscallnr.sh, input, output]
-    return [positionals[2]]
-
-
-def _parse_gen_kernel_hwcaps_command(command: str) -> list[PathStr]:
-    command_parts =3D tokenize_single_command(command.strip(), flag_option=
s=3D["-e"])
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    # expect positionals to be ["sh", path/to/gen-kernel-hwcaps.sh, input]
-    return [positionals[2]]
-
-
-class CommandParserRegistry:
-    """
-    Registry mapping command patterns to their input-file parsers.
-    """
-
-    def __init__(self, entries: list[CommandParserRegistryEntry]) -> None:
-        self._entries =3D entries
-
-    def __iter__(self) -> Iterator[CommandParserRegistryEntry]:
-        return iter(self._entries)
-
-    @staticmethod
-    def create() -> "CommandParserRegistry":
-        def env_or_default_pattern(env_value: str | None, default_pattern:=
 str) -> str:
-            if env_value is None or not env_value.strip():
-                return default_pattern
-            return rf"(?:{re.escape(env_value.strip())}|{default_pattern})"
-
-        cc_pattern =3D env_or_default_pattern(Environment.CC(), r"([^\s]+-=
)?(gcc|clang)")
-        ld_pattern =3D env_or_default_pattern(Environment.LD(), r"([^\s]+-=
)?ld")
-        ar_pattern =3D env_or_default_pattern(Environment.AR(), r"([^\s]+-=
)?ar")
-        nm_pattern =3D env_or_default_pattern(Environment.NM(), r"([^\s]+-=
)?nm")
-        objcopy_pattern =3D env_or_default_pattern(Environment.OBJCOPY(), =
r"([^\s]+-)?objcopy")
-        strip_pattern =3D env_or_default_pattern(Environment.STRIP(), r"([=
^\s]+-)?strip")
-
-        entries: list[CommandParserRegistryEntry] =3D [
-            # Compound commands
-            (re.compile(r"\(.*?\)\s*>", re.DOTALL), _parse_compound_comman=
d),
-            (re.compile(r"\{.*?\}\s*>", re.DOTALL), _parse_compound_comman=
d),
-            # Standard Unix utilities and system tools
-            (re.compile(r"^rm\b"), _parse_noop),
-            (re.compile(r"^mkdir\b"), _parse_noop),
-            (re.compile(r"^touch\b"), _parse_noop),
-            (re.compile(r"^cp\b"), _parse_cp_command),
-            (re.compile(r"^truncate\b"), _parse_noop),
-            (re.compile(r"^cat\b.*?[\|>]"), lambda c: _parse_cat_command(c=
.split("|")[0].split(">")[0])),
-            (re.compile(r"^echo[^|]*$"), _parse_noop),
-            (re.compile(r"^sed.*?>"), lambda c: _parse_sed_command(c.split=
(">")[0])),
-            (re.compile(r"^sed\b"), _parse_noop),
-            (re.compile(r"^awk.*?<.*?>"), lambda c: [c.split("<")[1].split=
(">")[0]]),
-            (re.compile(r"^awk.*?>"), lambda c: _parse_awk(c.split(">")[0]=
)),
-            (re.compile(r"^(/bin/)?true\b"), _parse_noop),
-            (re.compile(r"^(/bin/)?false\b"), _parse_noop),
-            (re.compile(r"^openssl\s+req.*?-new.*?-keyout"), _parse_noop),
-            # Compilers and code generators
-            # (C/LLVM toolchain, Rust, Flex/Bison, Bindgen, Perl, etc.)
-            (
-                re.compile(rf"^{cc_pattern}\b"),
-                lambda command: _parse_gcc_or_clang_command(re.sub(rf"^{cc=
_pattern}\b", "gcc", command, count=3D1)),
-            ),
-            (
-                re.compile(rf"^{ld_pattern}\b"),
-                lambda command: _parse_ld_command(re.sub(rf"^{ld_pattern}\=
b", "ld", command, count=3D1)),
-            ),
-            (
-                re.compile(rf"^printf\b.*\| xargs {ar_pattern}\b"),
-                lambda command: _parse_ar_piped_xargs_command(
-                    re.sub(rf"xargs {ar_pattern}\b", "xargs ar", command, =
count=3D1)
-                ),
-            ),
-            (
-                re.compile(rf"^{ar_pattern}\b"),
-                lambda command: _parse_ar_command(re.sub(rf"^{ar_pattern}\=
b", "ar", command, count=3D1)),
-            ),
-            (
-                re.compile(rf"^{nm_pattern}\b.*?\|"),
-                lambda command: _parse_nm_piped_command(re.sub(rf"^{nm_pat=
tern}\b", "nm", command, count=3D1)),
-            ),
-            (
-                re.compile(rf"^{objcopy_pattern}\b"),
-                lambda command: _parse_objcopy_command(re.sub(rf"^{objcopy=
_pattern}\b", "objcopy", command, count=3D1)),
-            ),
-            (
-                re.compile(rf"^{strip_pattern}\b"),
-                lambda command: _parse_strip_command(re.sub(rf"^{strip_pat=
tern}\b", "strip", command, count=3D1)),
-            ),
-            (re.compile(r".*?rustc\b"), _parse_rustc_command),
-            (re.compile(r".*?rustdoc\b"), _parse_rustdoc_command),
-            (re.compile(r"^flex\b"), _parse_flex_command),
-            (re.compile(r"^bison\b"), _parse_bison_command),
-            (re.compile(r"^bindgen\b"), _parse_bindgen_command),
-            (re.compile(r"^perl\b"), _parse_perl_command),
-            # Kernel-specific build scripts and tools
-            (re.compile(r"^(.*/)?link-vmlinux\.sh\b"), _parse_link_vmlinux=
_command),
-            (re.compile(r"sh (.*/)?syscallhdr\.sh\b"), _parse_syscallhdr_c=
ommand),
-            (re.compile(r"sh (.*/)?syscalltbl\.sh\b"), _parse_syscalltbl_c=
ommand),
-            (re.compile(r"sh (.*/)?mkcapflags\.sh\b"), _parse_mkcapflags_c=
ommand),
-            (re.compile(r"sh (.*/)?orc_hash\.sh\b"), _parse_orc_hash_comma=
nd),
-            (re.compile(r"sh (.*/)?xen-hypercalls\.sh\b"), _parse_xen_hype=
rcalls_command),
-            (re.compile(r"sh (.*/)?gen_initramfs\.sh\b"), _parse_gen_initr=
amfs_command),
-            (re.compile(r"sh (.*/)?checkundef\.sh\b"), _parse_noop),
-            (re.compile(r"(bash|sh) (.*/)?mkuboot\.sh\b"), _parse_mkuboot_=
command),
-            (re.compile(r"sh (.*/)?syscallnr\.sh\b"), _parse_syscallnr_com=
mand),
-            (re.compile(r"(/bin/)?sh (.*/)?gen-kernel-hwcaps\.sh\b"), lamb=
da c: _parse_gen_kernel_hwcaps_command(c.split(">")[0])),
-            (re.compile(r"(.*/)?vdso2c\b"), _parse_vdso2c_command),
-            (re.compile(r"(.*/)?vdsomunge\b"), _parse_vdsomunge_command),
-            (re.compile(r"^(.*/)?mkpiggy.*?>"), _parse_mkpiggy_command),
-            (re.compile(r"^(.*/)?relocs\b"), _parse_relocs_command),
-            (re.compile(r"^(.*/)?mk_elfconfig.*?<.*?>"), _parse_mk_elfconf=
ig_command),
-            (re.compile(r"^(.*/)?tools/build\b"), _parse_tools_build_comma=
nd),
-            (re.compile(r"^(.*/)?certs/extract-cert"), _parse_extract_cert=
_command),
-            (re.compile(r"^(.*/)?scripts/dtc/dtc\b"), _parse_dtc_command),
-            (re.compile(r"^(.*/)?pnmtologo\b"), _parse_pnm_to_logo_command=
),
-            (re.compile(r"^(.*/)?kernel/pi/relacheck"), _parse_relacheck),
-            (re.compile(r"^(.*/)?gen-hyprel\b"), _parse_gen_hyprel_command=
),
-            (re.compile(r"^drivers/gpu/drm/radeon/mkregtable"), lambda c: =
[c.split(" ")[1]]),
-            (re.compile(r"(.*/)?genheaders\b"), _parse_noop),
-            (re.compile(r"^(.*/)?mkcpustr\s+>"), _parse_noop),
-            (re.compile(r"^(.*/)polgen\b"), _parse_noop),
-            (re.compile(r"make -f .*/arch/x86/Makefile\.postlink"), _parse=
_noop),
-            (re.compile(r"^(.*/)?raid6/mktables\s+>"), _parse_noop),
-            (re.compile(r"^(.*/)?objtool\b"), _parse_noop),
-            (re.compile(r"^(.*/)?module/gen_test_kallsyms.sh"), _parse_noo=
p),
-            (re.compile(r"^(.*/)?gen_header.py"), _parse_gen_header),
-            (re.compile(r"^(.*/)?scripts/rustdoc_test_gen"), _parse_noop),
-        ]
-        return CommandParserRegistry(entries)
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter.p=
y b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter.py
deleted file mode 100644
index 4749f4bd669..00000000000
--- a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/command_splitter.py
+++ /dev/null
@@ -1,128 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-import re
-from dataclasses import dataclass
-
-
-# If Block pattern to match a simple, single-level if-then-fi block. Neste=
d If blocks are not supported.
-IF_BLOCK_PATTERN =3D re.compile(
-    r"""
-    ^if(.*?);\s*         # Match 'if <condition>;' (non-greedy)
-    then(.*?);\s*        # Match 'then <body>;' (non-greedy)
-    fi\b                 # Match 'fi'
-    """,
-    re.VERBOSE,
-)
-
-
-@dataclass
-class IfBlock:
-    condition: str
-    then_statement: str
-
-
-def _unwrap_outer_parentheses(s: str) -> str:
-    s =3D s.strip()
-    if not (s.startswith("(") and s.endswith(")")):
-        return s
-
-    count =3D 0
-    for i, char in enumerate(s):
-        if char =3D=3D "(":
-            count +=3D 1
-        elif char =3D=3D ")":
-            count -=3D 1
-            # If count is 0 before the end, outer parentheses don't match
-            if count =3D=3D 0 and i !=3D len(s) - 1:
-                return s
-
-    # outer parentheses do match, unwrap once
-    return _unwrap_outer_parentheses(s[1:-1])
-
-
-def _find_first_top_level_command_separator(
-    commands: str, separators: list[str] =3D [";", "&&"]
-) -> tuple[int | None, int | None]:
-    def is_escaped(index: int) -> bool:
-        preceding =3D commands[:index]
-        return (len(preceding) - len(preceding.rstrip("\\"))) % 2 =3D=3D 1
-
-    in_single_quote =3D False
-    in_double_quote =3D False
-    in_curly_braces =3D 0
-    in_braces =3D 0
-    for i, char in enumerate(commands):
-        if char =3D=3D "'" and not in_double_quote and not is_escaped(i):
-            # Toggle single quote state (unless inside double quotes or es=
caped)
-            in_single_quote =3D not in_single_quote
-        elif char =3D=3D '"' and not in_single_quote and not is_escaped(i):
-            # Toggle double quote state (unless inside single quotes or es=
caped)
-            in_double_quote =3D not in_double_quote
-
-        if in_single_quote or in_double_quote:
-            continue
-
-        # Toggle braces state
-        if char =3D=3D "{":
-            in_curly_braces +=3D 1
-        if char =3D=3D "}":
-            in_curly_braces -=3D 1
-
-        if char =3D=3D "(":
-            in_braces +=3D 1
-        if char =3D=3D ")":
-            in_braces -=3D 1
-
-        if in_curly_braces > 0 or in_braces > 0:
-            continue
-
-        # return found separator position and separator length
-        for separator in separators:
-            if commands[i : i + len(separator)] =3D=3D separator:
-                return i, len(separator)
-
-    return None, None
-
-
-def split_commands(commands: str) -> list[str | IfBlock]:
-    """
-    Splits a string of command-line commands into individual parts.
-
-    This function handles:
-    - Top-level command separators (e.g., `;` and `&&`) to split multiple =
commands.
-    - Conditional if-blocks, returning them as `IfBlock` instances.
-    - Preserves the order of commands and trims whitespace.
-
-    Args:
-        commands (str): The raw command string.
-
-    Returns:
-        list[str | IfBlock]: A list of single commands or `IfBlock` object=
s.
-    """
-    single_commands: list[str | IfBlock] =3D []
-    remaining_commands =3D _unwrap_outer_parentheses(commands)
-    while len(remaining_commands) > 0:
-        remaining_commands =3D remaining_commands.strip()
-
-        # if block
-        matched_if =3D IF_BLOCK_PATTERN.match(remaining_commands)
-        if matched_if:
-            condition, then_statement =3D matched_if.groups()
-            single_commands.append(IfBlock(condition.strip(), then_stateme=
nt.strip()))
-            full_matched =3D matched_if.group(0)
-            remaining_commands =3D remaining_commands.removeprefix(full_ma=
tched).lstrip("; \n")
-            continue
-
-        # command until next separator
-        separator_position, separator_length =3D _find_first_top_level_com=
mand_separator(remaining_commands)
-        if separator_position is not None and separator_length is not None:
-            single_commands.append(remaining_commands[:separator_position]=
.strip())
-            remaining_commands =3D remaining_commands[separator_position +=
 separator_length :].strip()
-            continue
-
-        # single last command
-        single_commands.append(remaining_commands)
-        break
-
-    return single_commands
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py=
 b/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py
deleted file mode 100644
index d2ca842a784..00000000000
--- a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py
+++ /dev/null
@@ -1,67 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-import sbom.sbom_logging as sbom_logging
-from sbom.cmd_graph.savedcmd_parser.command_splitter import IfBlock, split=
_commands
-from sbom.cmd_graph.savedcmd_parser.command_parser_registry import Command=
ParserRegistry
-from sbom.cmd_graph.savedcmd_parser.tokenizer import CmdParsingError
-from sbom.path_utils import PathStr
-
-DEFAULT_COMMAND_PARSER_REGISTRY =3D CommandParserRegistry.create()
-
-
-def parse_inputs_from_commands(
-    commands: str,
-    fail_on_unknown_build_command: bool,
-    registry: CommandParserRegistry | None =3D None,
-) -> list[PathStr]:
-    """
-    Extract input files referenced in a set of command-line commands.
-
-    Args:
-        commands (str): Command line expression to parse.
-        fail_on_unknown_build_command (bool): Whether to fail if an unknow=
n build command is encountered. If False, errors are logged as warnings.
-        registry (CommandParserRegistry | None): Registry of single comman=
d parsers.
-
-    Returns:
-        list[PathStr]: List of input file paths required by the commands.
-    """
-
-    def log_error_or_warning(message: str, /, **kwargs: str) -> None:
-        if fail_on_unknown_build_command:
-            sbom_logging.error(message, **kwargs)
-        else:
-            sbom_logging.warning(message, **kwargs)
-
-    if registry is None:
-        registry =3D DEFAULT_COMMAND_PARSER_REGISTRY
-
-    input_files: list[PathStr] =3D []
-    for single_command in split_commands(commands):
-        if isinstance(single_command, IfBlock):
-            inputs =3D parse_inputs_from_commands(single_command.then_stat=
ement, fail_on_unknown_build_command, registry)
-            if inputs:
-                log_error_or_warning(
-                    "Skipped parsing command {then_statement} because inpu=
t files in IfBlock 'then' statement are not supported",
-                    then_statement=3Dsingle_command.then_statement,
-                )
-            continue
-
-        matched_parser =3D next((parser for pattern, parser in registry if=
 pattern.match(single_command)), None)
-        if matched_parser is None:
-            log_error_or_warning(
-                "Skipped parsing command {single_command} because no match=
ing parser was found",
-                single_command=3Dsingle_command,
-            )
-            continue
-        try:
-            inputs =3D matched_parser(single_command)
-            input_files.extend(inputs)
-        except (CmdParsingError, IndexError, ValueError) as e:
-            log_error_or_warning(
-                "Skipped parsing command {single_command} because of comma=
nd parsing error: {error_message}",
-                single_command=3Dsingle_command,
-                error_message=3Dstr(e),
-            )
-
-    return [input.strip().rstrip("/") for input in input_files]
diff --git a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py b/scr=
ipts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py
deleted file mode 100644
index 1bf081f40be..00000000000
--- a/scripts/sbom/sbom/cmd_graph/savedcmd_parser/tokenizer.py
+++ /dev/null
@@ -1,92 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-import re
-import shlex
-from dataclasses import dataclass
-from typing import Union
-
-
-class CmdParsingError(Exception):
-    pass
-
-
-@dataclass
-class Option:
-    name: str
-    value: str | None =3D None
-
-
-@dataclass
-class Positional:
-    value: str
-
-
-_SUBCOMMAND_PATTERN =3D re.compile(r"\$\$\(([^()]*)\)")
-"""Pattern to match $$(...) blocks"""
-
-
-def tokenize_single_command(command: str, flag_options: list[str] | None =
=3D None) -> list[Union[Option, Positional]]:
-    """
-    Parse a shell command into a list of Options and Positionals.
-    - Positional: the command and any positional arguments.
-    - Options: handles flags and options with values provided as space-sep=
arated, or equals-sign
-        (e.g., '--opt val', '--opt=3Dval', '--flag').
-
-    Args:
-        command: Command line string.
-        flag_options: Options that are flags without values (e.g., '--verb=
ose').
-
-    Returns:
-        List of `Option` and `Positional` objects in command order.
-    """
-
-    #  Wrap all $$(...) blocks in double quotes to prevent shlex from spli=
tting them.
-    command_with_protected_subcommands =3D _SUBCOMMAND_PATTERN.sub(lambda =
m: f'"$$({m.group(1)})"', command)
-    tokens =3D shlex.split(command_with_protected_subcommands)
-
-    parsed: list[Option | Positional] =3D []
-    i =3D 0
-    while i < len(tokens):
-        token =3D tokens[i]
-
-        # Positional
-        if not token.startswith("-"):
-            parsed.append(Positional(token))
-            i +=3D 1
-            continue
-
-        # Option without value (--flag)
-        if (token.startswith("-") and i + 1 < len(tokens) and tokens[i + 1=
].startswith("-")) or (
-            flag_options and token in flag_options
-        ):
-            parsed.append(Option(name=3Dtoken))
-            i +=3D 1
-            continue
-
-        # Option with equals sign (--opt=3Dval)
-        if "=3D" in token:
-            name, value =3D token.split("=3D", 1)
-            parsed.append(Option(name=3Dname, value=3Dvalue))
-            i +=3D 1
-            continue
-
-        # Option with space-separated value (--opt val)
-        if i + 1 < len(tokens) and not tokens[i + 1].startswith("-"):
-            parsed.append(Option(name=3Dtoken, value=3Dtokens[i + 1]))
-            i +=3D 2
-            continue
-
-        raise CmdParsingError(f"Unrecognized token: {token} in command {co=
mmand}")
-
-    return parsed
-
-
-def tokenize_single_command_positionals_only(command: str) -> list[str]:
-    command_parts =3D tokenize_single_command(command)
-    positionals =3D [p.value for p in command_parts if isinstance(p, Posit=
ional)]
-    if len(positionals) !=3D len(command_parts):
-        raise CmdParsingError(
-            f"Invalid command format: expected positional arguments only b=
ut got options in command {command}."
-        )
-    return positionals
diff --git a/scripts/sbom/sbom/config.py b/scripts/sbom/sbom/config.py
index 6811f782943..08474c2bfc3 100644
--- a/scripts/sbom/sbom/config.py
+++ b/scripts/sbom/sbom/config.py
@@ -47,9 +47,6 @@ class KernelSbomConfig:
     debug: bool
     """Whether to enable debug logging."""
=20
-    fail_on_unknown_build_command: bool
-    """Whether to fail if an unknown build command is encountered in a .cm=
d file."""
-
     write_output_on_error: bool
     """Whether to write output documents even if errors occur."""
=20
@@ -141,15 +138,6 @@ def _parse_cli_arguments(parser: argparse.ArgumentPars=
er) -> dict[str, Any]:
     )
=20
     # Error handling settings
-    parser.add_argument(
-        "--do-not-fail-on-unknown-build-command",
-        action=3D"store_true",
-        default=3DFalse,
-        help=3D(
-            "Whether to fail if an unknown build command is encountered in=
 a .cmd file.\n"
-            "If set to True, errors are logged as warnings instead. (defau=
lt: False)"
-        ),
-    )
     parser.add_argument(
         "--write-output-on-error",
         action=3D"store_true",
@@ -245,7 +233,6 @@ def get_config() -> KernelSbomConfig:
     output_directory =3D os.path.realpath(args["output_directory"])
     debug =3D args["debug"]
=20
-    fail_on_unknown_build_command =3D not args["do_not_fail_on_unknown_bui=
ld_command"]
     write_output_on_error =3D args["write_output_on_error"]
=20
     created =3D datetime.fromtimestamp(
@@ -283,7 +270,6 @@ def get_config() -> KernelSbomConfig:
         used_files_file_name=3Dused_files_file_name,
         output_directory=3Doutput_directory,
         debug=3Ddebug,
-        fail_on_unknown_build_command=3Dfail_on_unknown_build_command,
         write_output_on_error=3Dwrite_output_on_error,
         created=3Dcreated,
         spdxId_prefix=3DspdxId_prefix,
diff --git a/scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py b/scripts=
/sbom/tests/cmd_graph/test_savedcmd_parser.py
deleted file mode 100644
index 93787a1cd15..00000000000
--- a/scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py
+++ /dev/null
@@ -1,468 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR MIT
-# Copyright (C) 2025 TNG Technology Consulting GmbH
-
-import os
-import unittest
-from unittest.mock import patch
-
-from sbom.cmd_graph.savedcmd_parser import parse_inputs_from_commands
-from sbom.cmd_graph.savedcmd_parser.command_parser_registry import Command=
ParserRegistry
-import sbom.sbom_logging as sbom_logging
-
-
-class TestSavedCmdParser(unittest.TestCase):
-    def _assert_parsing(self, cmd: str, expected: str, registry: CommandPa=
rserRegistry | None =3D None) -> None:
-        sbom_logging.init()
-        parsed =3D parse_inputs_from_commands(cmd, fail_on_unknown_build_c=
ommand=3DFalse, registry=3Dregistry)
-        target =3D [] if expected =3D=3D "" else expected.split(" ")
-        self.assertEqual(parsed, target)
-        errors =3D sbom_logging._error_logger._message_counts # type: igno=
re
-        self.assertEqual(errors, {})
-
-    # Error handling tests
-    def test_malformed_shell_quoting(self):
-        command =3D 'gcc "unterminated'
-        with patch.object(sbom_logging, "warning") as warning:
-            parsed =3D parse_inputs_from_commands(command, fail_on_unknown=
_build_command=3DFalse)
-
-        self.assertEqual(parsed, [])
-        warning.assert_called_once_with(
-            "Skipped parsing command {single_command} because of command p=
arsing error: {error_message}",
-            single_command=3Dcommand,
-            error_message=3D"No closing quotation",
-        )
-
-    def test_missing_positional_argument(self):
-        command =3D "objcopy"
-        with patch.object(sbom_logging, "warning") as warning:
-            parsed =3D parse_inputs_from_commands(command, fail_on_unknown=
_build_command=3DFalse)
-
-        self.assertEqual(parsed, [])
-        warning.assert_called_once_with(
-            "Skipped parsing command {single_command} because of command p=
arsing error: {error_message}",
-            single_command=3Dcommand,
-            error_message=3D"list index out of range",
-        )
-
-    # Compound command tests
-    def test_dd_cat(self):
-        cmd =3D "(dd if=3Darch/x86/boot/setup.bin bs=3D4k conv=3Dsync stat=
us=3Dnone; cat arch/x86/boot/vmlinux.bin) >arch/x86/boot/bzImage"
-        expected =3D "arch/x86/boot/setup.bin arch/x86/boot/vmlinux.bin"
-        self._assert_parsing(cmd, expected)
-
-    def test_manual_file_creation(self):
-        cmd =3D """{ symbase=3D__dtbo_overlay_bad_unresolved; echo '$(poun=
d)include <asm-generic/vmlinux.lds.h>'; echo '.section .rodata,"a"'; echo '=
.balign STRUCT_ALIGNMENT'; echo ".global $${symbase}_begin"; echo "$${symba=
se}_begin:"; echo '.incbin "drivers/of/unittest-data/overlay_bad_unresolved=
.dtbo" '; echo ".global $${symbase}_end"; echo "$${symbase}_end:"; echo '.b=
align STRUCT_ALIGNMENT'; } > drivers/of/unittest-data/overlay_bad_unresolve=
d.dtbo.S"""
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    def test_cat_xz_wrap(self):
-        cmd =3D "{ cat arch/x86/boot/compressed/vmlinux.bin | sh ../script=
s/xz_wrap.sh; printf \\130\\064\\024\\000; } > arch/x86/boot/compressed/vml=
inux.bin.xz"
-        expected =3D "arch/x86/boot/compressed/vmlinux.bin"
-        self._assert_parsing(cmd, expected)
-
-    def test_printf_sed(self):
-        cmd =3D r"""{  printf 'static char tomoyo_builtin_profile[] __init=
data =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)/\t"\1\\n"/' =
-- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_builtin_excepti=
on_policy[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\=
(.*\)/\t"\1\\n"/' -- ../security/tomoyo/policy/exception_policy.conf.defaul=
t; printf '\t"";\n';  printf 'static char tomoyo_builtin_domain_policy[] __=
initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)/\t"\1\\n=
"/' -- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_builtin_man=
ager[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/\(.*\)=
/\t"\1\\n"/' -- /dev/null; printf '\t"";\n';  printf 'static char tomoyo_bu=
iltin_stat[] __initdata =3D\n'; sed -e 's/\\/\\\\/g' -e 's/\"/\\"/g' -e 's/=
\(.*\)/\t"\1\\n"/' -- /dev/null; printf '\t"";\n'; } > security/tomoyo/buil=
tin-policy.h"""
-        expected =3D "../security/tomoyo/policy/exception_policy.conf.defa=
ult"
-        self._assert_parsing(cmd, expected)
-
-    def test_bin2c_echo(self):
-        cmd =3D """(echo "static char tomoyo_builtin_profile[] __initdata =
=3D"; ./scripts/bin2c </dev/null; echo ";"; echo "static char tomoyo_builti=
n_exception_policy[] __initdata =3D"; ./scripts/bin2c <../security/tomoyo/p=
olicy/exception_policy.conf.default; echo ";"; echo "static char tomoyo_bui=
ltin_domain_policy[] __initdata =3D"; ./scripts/bin2c </dev/null; echo ";";=
 echo "static char tomoyo_builtin_manager[] __initdata =3D"; ./scripts/bin2=
c </dev/null; echo ";"; echo "static char tomoyo_builtin_stat[] __initdata =
=3D"; ./scripts/bin2c </dev/null; echo ";") >security/tomoyo/builtin-policy=
.h"""
-        expected =3D "../security/tomoyo/policy/exception_policy.conf.defa=
ult"
-        self._assert_parsing(cmd, expected)
-
-    def test_cat_colon(self):
-        cmd =3D "{   cat init/modules.order;   cat usr/modules.order;   ca=
t arch/x86/modules.order;   cat arch/x86/boot/startup/modules.order;   cat =
kernel/modules.order;   cat certs/modules.order;   cat mm/modules.order;   =
cat fs/modules.order;   cat ipc/modules.order;   cat security/modules.order=
;   cat crypto/modules.order;   cat block/modules.order;   cat io_uring/mod=
ules.order;   cat lib/modules.order;   cat arch/x86/lib/modules.order;   ca=
t drivers/modules.order;   cat sound/modules.order;   cat samples/modules.o=
rder;   cat net/modules.order;   cat virt/modules.order;   cat arch/x86/pci=
/modules.order;   cat arch/x86/power/modules.order;   cat arch/x86/video/mo=
dules.order; :; } > modules.order"
-        expected =3D "init/modules.order usr/modules.order arch/x86/module=
s.order arch/x86/boot/startup/modules.order kernel/modules.order certs/modu=
les.order mm/modules.order fs/modules.order ipc/modules.order security/modu=
les.order crypto/modules.order block/modules.order io_uring/modules.order l=
ib/modules.order arch/x86/lib/modules.order drivers/modules.order sound/mod=
ules.order samples/modules.order net/modules.order virt/modules.order arch/=
x86/pci/modules.order arch/x86/power/modules.order arch/x86/video/modules.o=
rder"
-        self._assert_parsing(cmd, expected)
-
-    def test_cat_zstd(self):
-        cmd =3D "{ cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/=
compressed/vmlinux.relocs | zstd -22 --ultra; printf \\340\\362\\066\\003; =
} > arch/x86/boot/compressed/vmlinux.bin.zst"
-        expected =3D "arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/c=
ompressed/vmlinux.relocs"
-        self._assert_parsing(cmd, expected)
-
-    # cat command tests
-    def test_cat_redirect(self):
-        cmd =3D "cat ../fs/unicode/utf8data.c_shipped > fs/unicode/utf8dat=
a.c"
-        expected =3D "../fs/unicode/utf8data.c_shipped"
-        self._assert_parsing(cmd, expected)
-
-    def test_cat_piped(self):
-        cmd =3D "cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/co=
mpressed/vmlinux.relocs | gzip -n -f -9 > arch/x86/boot/compressed/vmlinux.=
bin.gz"
-        expected =3D "arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/c=
ompressed/vmlinux.relocs"
-        self._assert_parsing(cmd, expected)
-
-    # sed command tests
-    def test_sed(self):
-        cmd =3D "sed -n 's/.*define *BLIST_\\([A-Z0-9_]*\\) *.*/BLIST_FLAG=
_NAME(\\1),/p' ../include/scsi/scsi_devinfo.h > drivers/scsi/scsi_devinfo_t=
bl.c"
-        expected =3D "../include/scsi/scsi_devinfo.h"
-        self._assert_parsing(cmd, expected)
-
-    # awk command tests
-    def test_awk(self):
-        cmd =3D "awk -f ../arch/arm64/tools/gen-cpucaps.awk ../arch/arm64/=
tools/cpucaps > arch/arm64/include/generated/asm/cpucap-defs.h"
-        expected =3D "../arch/arm64/tools/cpucaps"
-        self._assert_parsing(cmd, expected)
-
-    def test_awk_with_input_redirection(self):
-        cmd =3D "awk -v N=3D1 -f ../lib/raid6/unroll.awk < ../lib/raid6/in=
t.uc > lib/raid6/int1.c"
-        expected =3D "../lib/raid6/int.uc"
-        self._assert_parsing(cmd, expected)
-
-    # openssl command tests
-    def test_openssl(self):
-        cmd =3D "openssl req -new -nodes -utf8 -sha256 -days 36500 -batch =
-x509 -config certs/x509.genkey -outform PEM -out certs/signing_key.pem -ke=
yout certs/signing_key.pem  2>&1"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # gcc/clang command tests
-    def test_gcc(self):
-        cmd =3D (
-            "gcc -Wp,-MMD,arch/x86/pci/.i386.o.d -nostdinc -I../arch/x86/i=
nclude -I./arch/x86/include/generated -I../include -I./include -I../arch/x8=
6/include/uapi -I./arch/x86/include/generated/uapi -I../include/uapi -I./in=
clude/generated/uapi -include ../include/linux/compiler-version.h -include =
../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__K=
ERNEL__ -fmacro-prefix-map=3D../=3D -Werror -std=3Dgnu11 -fshort-wchar -fun=
signed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mn=
o-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dbranch -fno-jump-tables -m64 -=
falign-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferre=
d-stack-boundary=3D3 -mskip-rax-setup -march=3Dx86-64 -mtune=3Dgeneric -mno=
-red-zone -mcmodel=3Dkernel -mstack-protector-guard-reg=3Dgs -mstack-protec=
tor-guard-symbol=3D__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronou=
s-unwind-tables -mindirect-branch=3Dthunk-extern -mindirect-branch-register=
 -mindirect-branch-cs-prefix -mfunction-return=3Dthunk-extern -fno-jump-tab=
les -fpatchable-function-entry=3D16,16 -fno-delete-null-pointer-checks -O2 =
-fno-allow-store-data-races -fstack-protector-strong -fomit-frame-pointer -=
fno-stack-clash-protection -falign-functions=3D16 -fno-strict-overflow -fno=
-stack-check -fconserve-stack -fno-builtin-wcslen -Wall -Wextra -Wundef -We=
rror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dretur=
n-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno=
-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissi=
ng-prototypes -Wframe-larger-than=3D2048 -Wno-main -Wvla-larger-than=3D1 -W=
no-pointer-sign -Wcast-function-type -Wno-array-bounds -Wno-stringop-overfl=
ow -Wno-alloc-size-larger-than -Wimplicit-fallthrough=3D5 -Werror=3Ddate-ti=
me -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wenum-co=
nversion -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -=
Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-str=
ingop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-ty=
pe-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-comp=
are -Wno-unused-parameter -I../arch/x86/pci -Iarch/x86/pci    -DKBUILD_MODF=
ILE=3D"
-            "arch/x86/pci/i386"
-            " -DKBUILD_BASENAME=3D"
-            "i386"
-            " -DKBUILD_MODNAME=3D"
-            "i386"
-            " -D__KBUILD_MODNAME=3Dkmod_i386 -c -o arch/x86/pci/i386.o ../=
arch/x86/pci/i386.c  "
-        )
-        expected =3D "../arch/x86/pci/i386.c"
-        self._assert_parsing(cmd, expected)
-
-    def test_gcc_linking(self):
-        cmd =3D "gcc   -o arch/x86/tools/relocs arch/x86/tools/relocs_32.o=
 arch/x86/tools/relocs_64.o arch/x86/tools/relocs_common.o"
-        expected =3D "arch/x86/tools/relocs_32.o arch/x86/tools/relocs_64.=
o arch/x86/tools/relocs_common.o"
-        self._assert_parsing(cmd, expected)
-
-    def test_gcc_without_compile_flag(self):
-        cmd =3D "gcc -Wp,-MMD,arch/x86/boot/compressed/.mkpiggy.d -Wall -W=
missing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu1=
1   -I ../scripts/include -I../tools/include  -I arch/x86/boot/compressed  =
 -o arch/x86/boot/compressed/mkpiggy ../arch/x86/boot/compressed/mkpiggy.c"
-        expected =3D "../arch/x86/boot/compressed/mkpiggy.c"
-        self._assert_parsing(cmd, expected)
-
-    def test_gcc_with_env_override(self):
-        with patch.dict(os.environ, {"CC": "ccache gcc"}):
-            registry =3D CommandParserRegistry.create()
-            cmd =3D "gcc   -o arch/x86/tools/relocs arch/x86/tools/relocs_=
32.o arch/x86/tools/relocs_64.o arch/x86/tools/relocs_common.o"
-            expected =3D "arch/x86/tools/relocs_32.o arch/x86/tools/relocs=
_64.o arch/x86/tools/relocs_common.o"
-            self._assert_parsing(cmd, expected, registry)
-            self._assert_parsing(f"ccache {cmd}", expected, registry)
-
-    def test_gcc_dts_preprocessing(self):
-        cmd =3D "gcc -E -Wp,-MMD,drivers/of/.empty_root.dtb.d.pre.tmp -nos=
tdinc -I ../scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with=
-cpp -o drivers/of/.empty_root.dtb.dts.tmp ../drivers/of/empty_root.dts"
-        expected =3D "../drivers/of/empty_root.dts"
-        self._assert_parsing(cmd, expected)
-
-    def test_clang(self):
-        cmd =3D """clang -Wp,-MMD,arch/x86/entry/.entry_64_compat.o.d -nos=
tdinc -I../arch/x86/include -I./arch/x86/include/generated -I../include -I.=
/include -I../arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I.=
./include/uapi -I./include/generated/uapi -include ../include/linux/compile=
r-version.h -include ../include/linux/kconfig.h -D__KERNEL__ --target=3Dx86=
_64-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dig=
nored-optimization-argument -Werror=3Doption-ignored -Werror=3Dunused-comma=
nd-line-argument -fmacro-prefix-map=3D../=3D -Werror -D__ASSEMBLY__ -fno-PI=
E -m64 -I../arch/x86/entry -Iarch/x86/entry    -DKBUILD_MODFILE=3D'"arch/x8=
6/entry/entry_64_compat"' -DKBUILD_MODNAME=3D'"entry_64_compat"' -D__KBUILD=
_MODNAME=3Dkmod_entry_64_compat -c -o arch/x86/entry/entry_64_compat.o ../a=
rch/x86/entry/entry_64_compat.S"""
-        expected =3D "../arch/x86/entry/entry_64_compat.S"
-        self._assert_parsing(cmd, expected)
-
-    # ld command tests
-    def test_ld(self):
-        cmd =3D r'ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-s=
tyle=3Dboth --build-id=3Dsha1 --no-undefined  --eh-frame-hdr -Bsymbolic -z =
noexecstack -m elf_x86_64 -soname linux-vdso.so.1 -z max-page-size=3D4096 -=
T arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/ent=
ry/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/=
vgetrandom.o arch/x86/entry/vdso/vgetrandom-chacha.o; if readelf -rW arch/x=
86/entry/vdso/vdso64.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (echo=
 >&2 "arch/x86/entry/vdso/vdso64.so.dbg: dynamic relocations are not suppor=
ted"; rm -f arch/x86/entry/vdso/vdso64.so.dbg; /bin/false); fi'
-        expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/=
vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vgetrand=
om.o arch/x86/entry/vdso/vgetrandom-chacha.o"
-        self._assert_parsing(cmd, expected)
-
-    def test_ld_with_env_override(self):
-        with patch.dict(os.environ, {"LD": "some-tool ld"}):
-            registry =3D CommandParserRegistry.create()
-            cmd =3D r'ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --ha=
sh-style=3Dboth --build-id=3Dsha1 --no-undefined  --eh-frame-hdr -Bsymbolic=
 -z noexecstack -m elf_x86_64 -soname linux-vdso.so.1 -z max-page-size=3D40=
96 -T arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86=
/entry/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/v=
dso/vgetrandom.o arch/x86/entry/vdso/vgetrandom-chacha.o; if readelf -rW ar=
ch/x86/entry/vdso/vdso64.so.dbg | grep -v _NONE | grep -q " R_\w*_"; then (=
echo >&2 "arch/x86/entry/vdso/vdso64.so.dbg: dynamic relocations are not su=
pported"; rm -f arch/x86/entry/vdso/vdso64.so.dbg; /bin/false); fi'
-            expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/v=
dso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vget=
random.o arch/x86/entry/vdso/vgetrandom-chacha.o"
-            self._assert_parsing(cmd, expected, registry)
-            self._assert_parsing(f"some-tool {cmd}", expected, registry)
-
-    def test_ld_whole_archive(self):
-        cmd =3D "ld -m elf_x86_64 -z noexecstack -r -o vmlinux.o   --whole=
-archive vmlinux.a --no-whole-archive --start-group  --end-group"
-        expected =3D "vmlinux.a"
-        self._assert_parsing(cmd, expected)
-
-    def test_ld_with_at_symbol(self):
-        cmd =3D "ld.lld -m elf_x86_64 -z noexecstack   -r -o fs/efivarfs/e=
fivarfs.o @fs/efivarfs/efivarfs.mod  ; ./tools/objtool/objtool --hacks=3Dju=
mp_label --hacks=3Dnoinstr --hacks=3Dskylake --ibt --orc --retpoline --reth=
unk --static-call --uaccess --prefix=3D16  --link  --module fs/efivarfs/efi=
varfs.o"
-        expected =3D "@fs/efivarfs/efivarfs.mod"
-        self._assert_parsing(cmd, expected)
-
-    def test_ld_if_objdump(self):
-        cmd =3D """ld -o arch/x86/entry/vdso/vdso64.so.dbg -shared --hash-=
style=3Dboth --build-id=3Dsha1  --eh-frame-hdr -Bsymbolic -z noexecstack -m=
 elf_x86_64 -soname linux-vdso.so.1 --no-undefined -z max-page-size=3D4096 =
-T arch/x86/entry/vdso/vdso.lds arch/x86/entry/vdso/vdso-note.o arch/x86/en=
try/vdso/vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso=
/vsgx.o && sh ./arch/x86/entry/vdso/checkundef.sh 'nm' 'arch/x86/entry/vdso=
/vdso64.so.dbg'; if objdump -R arch/x86/entry/vdso/vdso64.so.dbg | grep -E =
-h "R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE| R_386_GLOB_DAT|=
R_386_JMP_SLOT|R_386_RELATIVE"; then (echo >&2 "arch/x86/entry/vdso/vdso64.=
so.dbg: dynamic relocations are not supported"; rm -f arch/x86/entry/vdso/v=
dso64.so.dbg; /bin/false); fi"""
-        expected =3D "arch/x86/entry/vdso/vdso-note.o arch/x86/entry/vdso/=
vclock_gettime.o arch/x86/entry/vdso/vgetcpu.o arch/x86/entry/vdso/vsgx.o"
-        self._assert_parsing(cmd, expected)
-
-    # printf | xargs ar command tests
-    def test_ar_printf(self):
-        cmd =3D 'rm -f built-in.a;  printf "./%s " init/built-in.a usr/bui=
lt-in.a arch/x86/built-in.a arch/x86/boot/startup/built-in.a kernel/built-i=
n.a certs/built-in.a mm/built-in.a fs/built-in.a ipc/built-in.a security/bu=
ilt-in.a crypto/built-in.a block/built-in.a io_uring/built-in.a lib/built-i=
n.a arch/x86/lib/built-in.a drivers/built-in.a sound/built-in.a net/built-i=
n.a virt/built-in.a arch/x86/pci/built-in.a arch/x86/power/built-in.a arch/=
x86/video/built-in.a | xargs ar cDPrST built-in.a'
-        expected =3D "./init/built-in.a ./usr/built-in.a ./arch/x86/built-=
in.a ./arch/x86/boot/startup/built-in.a ./kernel/built-in.a ./certs/built-i=
n.a ./mm/built-in.a ./fs/built-in.a ./ipc/built-in.a ./security/built-in.a =
./crypto/built-in.a ./block/built-in.a ./io_uring/built-in.a ./lib/built-in=
.a ./arch/x86/lib/built-in.a ./drivers/built-in.a ./sound/built-in.a ./net/=
built-in.a ./virt/built-in.a ./arch/x86/pci/built-in.a ./arch/x86/power/bui=
lt-in.a ./arch/x86/video/built-in.a"
-        self._assert_parsing(cmd, expected)
-
-    def test_ar_printf_nested(self):
-        cmd =3D 'rm -f arch/x86/pci/built-in.a;  printf "arch/x86/pci/%s "=
 i386.o init.o mmconfig_64.o direct.o mmconfig-shared.o fixup.o acpi.o lega=
cy.o irq.o common.o early.o bus_numa.o amd_bus.o | xargs ar cDPrST arch/x86=
/pci/built-in.a'
-        expected =3D "arch/x86/pci/i386.o arch/x86/pci/init.o arch/x86/pci=
/mmconfig_64.o arch/x86/pci/direct.o arch/x86/pci/mmconfig-shared.o arch/x8=
6/pci/fixup.o arch/x86/pci/acpi.o arch/x86/pci/legacy.o arch/x86/pci/irq.o =
arch/x86/pci/common.o arch/x86/pci/early.o arch/x86/pci/bus_numa.o arch/x86=
/pci/amd_bus.o"
-        self._assert_parsing(cmd, expected)
-
-    # ar command tests
-    def test_ar_reordering(self):
-        cmd =3D "rm -f vmlinux.a; ar cDPrST vmlinux.a built-in.a  lib/lib.=
a arch/x86/lib/lib.a; ar mPiT $$(ar t vmlinux.a | sed -n 1p) vmlinux.a $$(a=
r t vmlinux.a | grep -F -f ../scripts/head-object-list.txt)"
-        expected =3D "built-in.a lib/lib.a arch/x86/lib/lib.a"
-        self._assert_parsing(cmd, expected)
-
-    def test_ar_default(self):
-        cmd =3D "rm -f lib/lib.a; ar cDPrsT lib/lib.a lib/argv_split.o lib=
/bug.o lib/buildid.o lib/clz_tab.o lib/cmdline.o lib/cpumask.o lib/ctype.o =
lib/dec_and_lock.o lib/decompress.o lib/decompress_bunzip2.o lib/decompress=
_inflate.o lib/decompress_unlz4.o lib/decompress_unlzma.o lib/decompress_un=
lzo.o lib/decompress_unxz.o lib/decompress_unzstd.o lib/dump_stack.o lib/ea=
rlycpio.o lib/extable.o lib/flex_proportions.o lib/idr.o lib/iomem_copy.o l=
ib/irq_regs.o lib/is_single_threaded.o lib/klist.o lib/kobject.o lib/kobjec=
t_uevent.o lib/logic_pio.o lib/maple_tree.o lib/memcat_p.o lib/nmi_backtrac=
e.o lib/objpool.o lib/plist.o lib/radix-tree.o lib/ratelimit.o lib/rbtree.o=
 lib/seq_buf.o lib/siphash.o lib/string.o lib/sys_info.o lib/timerqueue.o l=
ib/union_find.o lib/vsprintf.o lib/win_minmax.o lib/xarray.o"
-        expected =3D "lib/argv_split.o lib/bug.o lib/buildid.o lib/clz_tab=
.o lib/cmdline.o lib/cpumask.o lib/ctype.o lib/dec_and_lock.o lib/decompres=
s.o lib/decompress_bunzip2.o lib/decompress_inflate.o lib/decompress_unlz4.=
o lib/decompress_unlzma.o lib/decompress_unlzo.o lib/decompress_unxz.o lib/=
decompress_unzstd.o lib/dump_stack.o lib/earlycpio.o lib/extable.o lib/flex=
_proportions.o lib/idr.o lib/iomem_copy.o lib/irq_regs.o lib/is_single_thre=
aded.o lib/klist.o lib/kobject.o lib/kobject_uevent.o lib/logic_pio.o lib/m=
aple_tree.o lib/memcat_p.o lib/nmi_backtrace.o lib/objpool.o lib/plist.o li=
b/radix-tree.o lib/ratelimit.o lib/rbtree.o lib/seq_buf.o lib/siphash.o lib=
/string.o lib/sys_info.o lib/timerqueue.o lib/union_find.o lib/vsprintf.o l=
ib/win_minmax.o lib/xarray.o"
-        self._assert_parsing(cmd, expected)
-
-    def test_ar_llvm(self):
-        cmd =3D "llvm-ar mPiT $$(llvm-ar t vmlinux.a | sed -n 1p) vmlinux.=
a $$(llvm-ar t vmlinux.a | grep -F -f ../scripts/head-object-list.txt)"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # nm command tests
-    def test_nm(self):
-        cmd =3D """llvm-nm -p --defined-only rust/core.o | awk '$$2~/(T|R|=
D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf "EXPORT_SYMBOL_RUST_GPL(%s);\=
n",$$3 }' > rust/exports_core_generated.h"""
-        expected =3D "rust/core.o"
-        self._assert_parsing(cmd, expected)
-
-    def test_nm_vmlinux(self):
-        cmd =3D r"nm vmlinux | sed -n -e 's/^\([0-9a-fA-F]*\) [ABbCDGRSTtV=
W] \(_text\|__start_rodata\|__bss_start\|_end\)$/#define VO_\2 _AC(0x\1,UL)=
/p' > arch/x86/boot/voffset.h"
-        expected =3D "vmlinux"
-        self._assert_parsing(cmd, expected)
-
-    # objcopy command tests
-    def test_objcopy(self):
-        cmd =3D "objcopy --remove-section=3D'.rel*' --remove-section=3D!'.=
rel*.dyn' vmlinux.unstripped vmlinux"
-        expected =3D "vmlinux.unstripped"
-        self._assert_parsing(cmd, expected)
-
-    def test_objcopy_llvm(self):
-        cmd =3D "llvm-objcopy --remove-section=3D'.rel*' --remove-section=
=3D!'.rel*.dyn' vmlinux.unstripped vmlinux"
-        expected =3D "vmlinux.unstripped"
-        self._assert_parsing(cmd, expected)
-
-    # strip command tests
-    def test_strip(self):
-        cmd =3D "strip --strip-debug -o drivers/firmware/efi/libstub/mem.s=
tub.o drivers/firmware/efi/libstub/mem.o"
-        expected =3D "drivers/firmware/efi/libstub/mem.o"
-        self._assert_parsing(cmd, expected)
-
-    # cp command tests
-    def test_cp_truncate(self):
-        cmd =3D "cp arch/arm64/boot/Image arch/arm64/boot/vmlinux.bin; tru=
ncate -s $$(hexdump -s16 -n4 -e '\"%u\"' arch/arm64/boot/Image) arch/arm64/=
boot/vmlinux.bin"
-        expected =3D "arch/arm64/boot/Image"
-        self._assert_parsing(cmd, expected)
-
-    # rustc command tests
-    def test_rustc(self):
-        cmd =3D """OBJTREE=3D/workspace/linux/kernel_build rustc -Zbinary_=
dep_depinfo=3Dy -Astable_features -Dnon_ascii_idents -Dunsafe_op_in_unsafe_=
fn -Wmissing_docs -Wrust_2018_idioms -Wclippy::all -Wclippy::as_ptr_cast_mu=
t -Wclippy::as_underscore -Wclippy::cast_lossless -Wclippy::ignored_unit_pa=
tterns -Wclippy::mut_mut -Wclippy::needless_bitwise_bool -Aclippy::needless=
_lifetimes -Wclippy::no_mangle_with_rust_abi -Wclippy::ptr_as_ptr -Wclippy:=
:ptr_cast_constness -Wclippy::ref_as_ptr -Wclippy::undocumented_unsafe_bloc=
ks -Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc -W=
rustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks -Cpanic=3D=
abort -Cembed-bitcode=3Dn -Clto=3Dn -Cforce-unwind-tables=3Dn -Ccodegen-uni=
ts=3D1 -Csymbol-mangling-version=3Dv0 -Crelocation-model=3Dstatic -Zfunctio=
n-sections=3Dn -Wclippy::float_arithmetic --target=3D./scripts/target.json =
-Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Zcf-=
protection=3Dbranch -Zno-jump-tables -Ctarget-cpu=3Dx86-64 -Ztune-cpu=3Dgen=
eric -Cno-redzone=3Dy -Ccode-model=3Dkernel -Zfunction-return=3Dthunk-exter=
n -Zpatchable-function-entry=3D16,16 -Copt-level=3D2 -Cdebug-assertions=3Dn=
 -Coverflow-checks=3Dy -Dwarnings @./include/generated/rustc_cfg --edition=
=3D2021 --cfg no_fp_fmt_parse --emit=3Ddep-info=3Drust/.core.o.d --emit=3Do=
bj=3Drust/core.o --emit=3Dmetadata=3Drust/libcore.rmeta --crate-type rlib -=
L./rust --crate-name core /usr/lib/rust-1.84/lib/rustlib/src/rust/library/c=
ore/src/lib.rs --sysroot=3D/dev/null ;llvm-objcopy --redefine-sym __addsf3=
=3D__rust__addsf3 --redefine-sym __eqsf2=3D__rust__eqsf2 --redefine-sym __e=
xtendsfdf2=3D__rust__extendsfdf2 --redefine-sym __gesf2=3D__rust__gesf2 --r=
edefine-sym __lesf2=3D__rust__lesf2 --redefine-sym __ltsf2=3D__rust__ltsf2 =
--redefine-sym __mulsf3=3D__rust__mulsf3 --redefine-sym __nesf2=3D__rust__n=
esf2 --redefine-sym __truncdfsf2=3D__rust__truncdfsf2 --redefine-sym __unor=
dsf2=3D__rust__unordsf2 --redefine-sym __adddf3=3D__rust__adddf3 --redefine=
-sym __eqdf2=3D__rust__eqdf2 --redefine-sym __ledf2=3D__rust__ledf2 --redef=
ine-sym __ltdf2=3D__rust__ltdf2 --redefine-sym __muldf3=3D__rust__muldf3 --=
redefine-sym __unorddf2=3D__rust__unorddf2 --redefine-sym __muloti4=3D__rus=
t__muloti4 --redefine-sym __multi3=3D__rust__multi3 --redefine-sym __udivmo=
dti4=3D__rust__udivmodti4 --redefine-sym __udivti3=3D__rust__udivti3 --rede=
fine-sym __umodti3=3D__rust__umodti3 rust/core.o"""
-        expected =3D "/usr/lib/rust-1.84/lib/rustlib/src/rust/library/core=
/src/lib.rs rust/core.o"
-        self._assert_parsing(cmd, expected)
-
-    # rustdoc command tests
-    def test_rustdoc(self):
-        cmd =3D """OBJTREE=3D/workspace/linux/kernel_build rustdoc --test =
--edition=3D2021 -Zbinary_dep_depinfo=3Dy -Astable_features -Dnon_ascii_ide=
nts -Dunsafe_op_in_unsafe_fn -Wmissing_docs -Wrust_2018_idioms -Wunreachabl=
e_pub -Wclippy::all -Wclippy::as_ptr_cast_mut -Wclippy::as_underscore -Wcli=
ppy::cast_lossless -Wclippy::ignored_unit_patterns -Wclippy::mut_mut -Wclip=
py::needless_bitwise_bool -Aclippy::needless_lifetimes -Wclippy::no_mangle_=
with_rust_abi -Wclippy::ptr_as_ptr -Wclippy::ptr_cast_constness -Wclippy::r=
ef_as_ptr -Wclippy::undocumented_unsafe_blocks -Wclippy::unnecessary_safety=
_comment -Wclippy::unnecessary_safety_doc -Wrustdoc::missing_crate_level_do=
cs -Wrustdoc::unescaped_backticks -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=
=3Dn -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 -Csymbol-mangling-versio=
n=3Dv0 -Crelocation-model=3Dstatic -Zfunction-sections=3Dn -Wclippy::float_=
arithmetic --target=3Daarch64-unknown-none -Ctarget-feature=3D"-neon" -Cfor=
ce-unwind-tables=3Dn -Zbranch-protection=3Dpac-ret -Copt-level=3D2 -Cdebug-=
assertions=3Dy -Coverflow-checks=3Dy -Dwarnings -Cforce-frame-pointers=3Dy =
-Zsanitizer=3Dkernel-address -Zsanitizer-recover=3Dkernel-address -Cllvm-ar=
gs=3D-asan-mapping-offset=3D0xdfff800000000000 -Cpasses=3Dsancov-module -Cl=
lvm-args=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-=
trace-pc -Cllvm-args=3D-sanitizer-coverage-trace-compares @./include/genera=
ted/rustc_cfg -L./rust --extern ffi --extern pin_init --extern kernel --ext=
ern build_error --extern macros --extern bindings --extern uapi --no-run --=
crate-name kernel -Zunstable-options --sysroot=3D/dev/null  --test-builder =
./scripts/rustdoc_test_builder ../rust/kernel/lib.rs >/dev/null"""
-        expected =3D "../rust/kernel/lib.rs"
-        self._assert_parsing(cmd, expected)
-
-    def test_rustdoc_test_gen(self):
-        cmd =3D "./scripts/rustdoc_test_gen"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # flex command tests
-    def test_flex(self):
-        cmd =3D "flex -oscripts/kconfig/lexer.lex.c -L ../scripts/kconfig/=
lexer.l"
-        expected =3D "../scripts/kconfig/lexer.l"
-        self._assert_parsing(cmd, expected)
-
-    # bison command tests
-    def test_bison(self):
-        cmd =3D "bison -o scripts/kconfig/parser.tab.c --defines=3Dscripts=
/kconfig/parser.tab.h -t -l ../scripts/kconfig/parser.y"
-        expected =3D "../scripts/kconfig/parser.y"
-        self._assert_parsing(cmd, expected)
-
-    # bindgen command tests
-    def test_bindgen(self):
-        cmd =3D (
-            "bindgen ../rust/bindings/bindings_helper.h "
-            "--blocklist-type __kernel_s?size_t --blocklist-type __kernel_=
ptrdiff_t "
-            "--opaque-type xregs_state --opaque-type desc_struct --no-doc-=
comments "
-            "--rust-target 1.68 --use-core --with-derive-default -o rust/b=
indings/bindings_generated.rs "
-            "-- -Wp,-MMD,rust/bindings/.bindings_generated.rs.d -nostdinc =
-I../arch/x86/include "
-            "-include ../include/linux/compiler-version.h -D__KERNEL__ -fi=
ntegrated-as -fno-builtin -DMODULE; "
-            "sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub co=
nst \\1/g' rust/bindings/bindings_generated.rs"
-        )
-        expected =3D "../rust/bindings/bindings_helper.h ../include/linux/=
compiler-version.h"
-        self._assert_parsing(cmd, expected)
-
-    # perl command tests
-    def test_perl(self):
-        cmd =3D "perl ../lib/crypto/x86/poly1305-x86_64-cryptogams.pl > li=
b/crypto/x86/poly1305-x86_64-cryptogams.S"
-        expected =3D "../lib/crypto/x86/poly1305-x86_64-cryptogams.pl"
-        self._assert_parsing(cmd, expected)
-
-    # link-vmlinux.sh command tests
-    def test_link_vmlinux(self):
-        cmd =3D '../scripts/link-vmlinux.sh "ld" "-m elf_x86_64 -z noexecs=
tack" "-z max-page-size=3D0x200000 --build-id=3Dsha1 --orphan-handling=3Der=
ror --emit-relocs --discard-none" "vmlinux.unstripped";  true'
-        expected =3D "vmlinux.a"
-        self._assert_parsing(cmd, expected)
-
-    def test_link_vmlinux_postlink(self):
-        cmd =3D '../scripts/link-vmlinux.sh "ld" "-m elf_x86_64 -z noexecs=
tack --no-warn-rwx-segments" "--emit-relocs --discard-none -z max-page-size=
=3D0x200000 --build-id=3Dsha1 -X --orphan-handling=3Derror";  make -f ../ar=
ch/x86/Makefile.postlink vmlinux'
-        expected =3D "vmlinux.a"
-        self._assert_parsing(cmd, expected)
-
-    # syscallhdr.sh command tests
-    def test_syscallhdr(self):
-        cmd =3D "sh ../scripts/syscallhdr.sh --abis common,64 --emit-nr   =
../arch/x86/entry/syscalls/syscall_64.tbl arch/x86/include/generated/uapi/a=
sm/unistd_64.h"
-        expected =3D "../arch/x86/entry/syscalls/syscall_64.tbl"
-        self._assert_parsing(cmd, expected)
-
-    # syscalltbl.sh command tests
-    def test_syscalltbl(self):
-        cmd =3D "sh ../scripts/syscalltbl.sh --abis common,64 ../arch/x86/=
entry/syscalls/syscall_64.tbl arch/x86/include/generated/asm/syscalls_64.h"
-        expected =3D "../arch/x86/entry/syscalls/syscall_64.tbl"
-        self._assert_parsing(cmd, expected)
-
-    # mkcapflags.sh command tests
-    def test_mkcapflags(self):
-        cmd =3D "sh ../arch/x86/kernel/cpu/mkcapflags.sh arch/x86/kernel/c=
pu/capflags.c ../arch/x86/kernel/cpu/../../include/asm/cpufeatures.h ../arc=
h/x86/kernel/cpu/../../include/asm/vmxfeatures.h ../arch/x86/kernel/cpu/mkc=
apflags.sh FORCE"
-        expected =3D "../arch/x86/kernel/cpu/../../include/asm/cpufeatures=
.h ../arch/x86/kernel/cpu/../../include/asm/vmxfeatures.h"
-        self._assert_parsing(cmd, expected)
-
-    # orc_hash.sh command tests
-    def test_orc_hash(self):
-        cmd =3D "mkdir -p arch/x86/include/generated/asm/; sh ../scripts/o=
rc_hash.sh < ../arch/x86/include/asm/orc_types.h > arch/x86/include/generat=
ed/asm/orc_hash.h"
-        expected =3D "../arch/x86/include/asm/orc_types.h"
-        self._assert_parsing(cmd, expected)
-
-    # xen-hypercalls.sh command tests
-    def test_xen_hypercalls(self):
-        cmd =3D "sh '../scripts/xen-hypercalls.sh' arch/x86/include/genera=
ted/asm/xen-hypercalls.h ../include/xen/interface/xen-mca.h ../include/xen/=
interface/xen.h ../include/xen/interface/xenpmu.h"
-        expected =3D "../include/xen/interface/xen-mca.h ../include/xen/in=
terface/xen.h ../include/xen/interface/xenpmu.h"
-        self._assert_parsing(cmd, expected)
-
-    # gen_initramfs.sh command tests
-    def test_gen_initramfs(self):
-        cmd =3D "sh ../scripts/gen_initramfs.sh -o usr/initramfs_data.cpio=
 -l usr/.initramfs_data.cpio.d    ../usr/default_cpio_list"
-        expected =3D "../usr/default_cpio_list"
-        self._assert_parsing(cmd, expected)
-
-    # mkuboot.sh command tests
-    def test_mkuboot(self):
-        cmd =3D "bash ../scripts/mkuboot.sh -A arm -O linux -C none -T ker=
nel -a 0x8000 -e 0x8000 -n 'Linux-6.15.0' -d arch/arm/boot/zImage arch/arm/=
boot/uImage"
-        expected =3D "arch/arm/boot/zImage"
-        self._assert_parsing(cmd, expected)
-
-    # syscallnr.sh command tests
-    def test_syscallnr(self):
-        cmd =3D "sh ../arch/arm/tools/syscallnr.sh ../arch/arm/tools/sysca=
ll.tbl arch/arm/include/generated/asm/unistd-nr.h"
-        expected =3D "../arch/arm/tools/syscall.tbl"
-        self._assert_parsing(cmd, expected)
-
-    # gen-kernel-hwcaps.sh command tests
-    def test_gen_kernel_hwcaps(self):
-        cmd =3D "/bin/sh -e ../arch/arm64/tools/gen-kernel-hwcaps.sh ../ar=
ch/arm64/include/uapi/asm/hwcap.h > arch/arm64/include/generated/asm/kernel=
-hwcap.h"
-        expected =3D "../arch/arm64/include/uapi/asm/hwcap.h"
-        self._assert_parsing(cmd, expected)
-
-    # vdso2c command tests
-    def test_vdso2c(self):
-        cmd =3D "arch/x86/entry/vdso/vdso2c arch/x86/entry/vdso/vdso64.so.=
dbg arch/x86/entry/vdso/vdso64.so arch/x86/entry/vdso/vdso-image-64.c"
-        expected =3D "arch/x86/entry/vdso/vdso64.so.dbg arch/x86/entry/vds=
o/vdso64.so"
-        self._assert_parsing(cmd, expected)
-
-    # vdsomunge command tests
-    def test_vdsomunge(self):
-        cmd =3D "arch/arm64/kernel/vdso32/../../../arm/vdso/vdsomunge arch=
/arm64/kernel/vdso32/vdso.so.raw arch/arm64/kernel/vdso32/vdso32.so.dbg"
-        expected =3D "arch/arm64/kernel/vdso32/vdso.so.raw"
-        self._assert_parsing(cmd, expected)
-
-    # mkpiggy command tests
-    def test_mkpiggy(self):
-        cmd =3D "arch/x86/boot/compressed/mkpiggy arch/x86/boot/compressed=
/vmlinux.bin.gz > arch/x86/boot/compressed/piggy.S"
-        expected =3D "arch/x86/boot/compressed/vmlinux.bin.gz"
-        self._assert_parsing(cmd, expected)
-
-    # relocs command tests
-    def test_relocs(self):
-        cmd =3D "arch/x86/tools/relocs vmlinux.unstripped > arch/x86/boot/=
compressed/vmlinux.relocs;arch/x86/tools/relocs --abs-relocs vmlinux.unstri=
pped"
-        expected =3D "vmlinux.unstripped"
-        self._assert_parsing(cmd, expected)
-
-    def test_relocs_with_realmode(self):
-        cmd =3D (
-            "arch/x86/tools/relocs --realmode arch/x86/realmode/rm/realmod=
e.elf > arch/x86/realmode/rm/realmode.relocs"
-        )
-        expected =3D "arch/x86/realmode/rm/realmode.elf"
-        self._assert_parsing(cmd, expected)
-
-    # mk_elfconfig command tests
-    def test_mk_elfconfig(self):
-        cmd =3D "scripts/mod/mk_elfconfig < scripts/mod/empty.o > scripts/=
mod/elfconfig.h"
-        expected =3D "scripts/mod/empty.o"
-        self._assert_parsing(cmd, expected)
-
-    # tools/build command tests
-    def test_build(self):
-        cmd =3D "arch/x86/boot/tools/build arch/x86/boot/setup.bin arch/x8=
6/boot/vmlinux.bin arch/x86/boot/zoffset.h arch/x86/boot/bzImage"
-        expected =3D "arch/x86/boot/setup.bin arch/x86/boot/vmlinux.bin ar=
ch/x86/boot/zoffset.h"
-        self._assert_parsing(cmd, expected)
-
-    # extract-cert command tests
-    def test_extract_cert(self):
-        cmd =3D 'certs/extract-cert ""  certs/signing_key.x509'
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # dtc command tests
-    def test_dtc_cat(self):
-        cmd =3D "./scripts/dtc/dtc -o drivers/of/empty_root.dtb -b 0 -i../=
drivers/of/ -i../scripts/dtc/include-prefixes -Wno-unique_unit_address -Wno=
-unit_address_vs_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno=
-graph_child_address -Wno-simple_bus_reg   -d drivers/of/.empty_root.dtb.d.=
dtc.tmp drivers/of/.empty_root.dtb.dts.tmp ; cat drivers/of/.empty_root.dtb=
.d.pre.tmp drivers/of/.empty_root.dtb.d.dtc.tmp > drivers/of/.empty_root.dt=
b.d"
-        expected =3D "drivers/of/.empty_root.dtb.dts.tmp drivers/of/.empty=
_root.dtb.d.pre.tmp drivers/of/.empty_root.dtb.d.dtc.tmp"
-        self._assert_parsing(cmd, expected)
-
-    # pnmtologo command tests
-    def test_pnmtologo(self):
-        cmd =3D "drivers/video/logo/pnmtologo -t clut224 -n logo_linux_clu=
t224 -o drivers/video/logo/logo_linux_clut224.c ../drivers/video/logo/logo_=
linux_clut224.ppm"
-        expected =3D "../drivers/video/logo/logo_linux_clut224.ppm"
-        self._assert_parsing(cmd, expected)
-
-    # relacheck command tests
-    def test_relacheck(self):
-        cmd =3D "arch/arm64/kernel/pi/relacheck arch/arm64/kernel/pi/idreg=
-override.pi.o arch/arm64/kernel/pi/idreg-override.o"
-        expected =3D "arch/arm64/kernel/pi/idreg-override.pi.o"
-        self._assert_parsing(cmd, expected)
-
-    # gen-hyprel command tests
-    def test_gen_hyprel(self):
-        cmd =3D "arch/arm64/kvm/hyp/nvhe/gen-hyprel arch/arm64/kvm/hyp/nvh=
e/kvm_nvhe.tmp.o > arch/arm64/kvm/hyp/nvhe/hyp-reloc.S"
-        expected =3D "arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o"
-        self._assert_parsing(cmd, expected)
-
-    # mkregtable command tests
-    def test_mkregtable(self):
-        cmd =3D "drivers/gpu/drm/radeon/mkregtable ../drivers/gpu/drm/rade=
on/reg_srcs/r100 > drivers/gpu/drm/radeon/r100_reg_safe.h"
-        expected =3D "../drivers/gpu/drm/radeon/reg_srcs/r100"
-        self._assert_parsing(cmd, expected)
-
-    # genheaders command tests
-    def test_genheaders(self):
-        cmd =3D "security/selinux/genheaders security/selinux/flask.h secu=
rity/selinux/av_permissions.h"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # mkcpustr command tests
-    def test_mkcpustr(self):
-        cmd =3D "arch/x86/boot/mkcpustr > arch/x86/boot/cpustr.h"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # polgen command tests
-    def test_polgen(self):
-        cmd =3D "scripts/ipe/polgen/polgen security/ipe/boot_policy.c"
-        expected =3D ""
-        self._assert_parsing(cmd, expected)
-
-    # gen_header.py command tests
-    def test_gen_header(self):
-        cmd =3D "mkdir -p drivers/gpu/drm/msm/generated && python3 ../driv=
ers/gpu/drm/msm/registers/gen_header.py --no-validate --rnn ../drivers/gpu/=
drm/msm/registers --xml ../drivers/gpu/drm/msm/registers/adreno/a2xx.xml c-=
defines > drivers/gpu/drm/msm/generated/a2xx.xml.h"
-        expected =3D "../drivers/gpu/drm/msm/registers/adreno/a2xx.xml"
-        self._assert_parsing(cmd, expected)
-
-
-if __name__ =3D=3D "__main__":
-    unittest.main()
--=20
2.43.0

