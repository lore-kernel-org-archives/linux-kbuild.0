Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651007;
	b=zRmeXVBbT2IFTypj7998SlNCXMIEkHMJf7x5zpmUPErXK2534jg6vzX90kvMtlrDJe8U
	 YiGI4Ijyuepb+Lk1ffs4n2VNYvjijGw1Xy/7kJipUL+2kNk1Gt7H5GOjnrUTDcp1aml61
	 jlZw5rrYMdim8lTO3guX6LH2kDW6FnEjQJ+QgNFfQiVGiLDOYbFeNnGTSfPkykre2Wn8g
	 epfIOUs6VOFcoPWPfF+41GofECvSkXGLNKqXBFBiuIcFDMzpEdH7xH2495VihquWCIXlX
	 4u9Ygyg58QZKeB+gc7vt78QQD44UcYi++xzou6UspmEcCNCFLI39M94Igv8VTmLPnxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651007;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=m+1LG73YqolzuaQ2vafVT4bpYmkISpapWTVwICxw3Fs=;
	b=gg3zumek1RXegRBNpnrg8rbu4cjFxNj1CTn8PXSlg0bK6S8uTayyhtXuKcEmtbtEp6pa
	 qmY0K5BTeXDAsN51OcYoqAusoU/K37pmGu53t+4kEzk1GVnTYDsBUavJg3w0wUDUmHcB8
	 eRsgxMhjnjlGDnPq7ESdF/SQ2gndtn/KBgs8y815EHUcTfLRL6dpzsSQz0qZF1YtAg6Ip
	 iMmMWOYjmJ1lgHsfGZ5/1QmTnKvjNdGOQJStMe9mtsvZ46L17aYRfaGl5ahkko2ACPz5L
	 AWaKQiqiNFLPu0rktP/nQJZEhLgjgGRTxGOdhHXLFvdr1HkffUGSYJuGn/end7a1WEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=OApTRLPi;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E501606D81F;
	Mon,  2 Nov 2026 20:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E501606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=OApTRLPi
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id E7A83403F4;
	Mon,  2 Nov 2026 21:23:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id DEB8D1FBC54;
	Mon,  2 Nov 2026 21:23:19 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id zwkG3o3fGVlQ; Mon,  2 Nov 2026 21:23:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C04431FBBEE;
	Mon,  2 Nov 2026 21:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz C04431FBBEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1793650998;
	bh=m+1LG73YqolzuaQ2vafVT4bpYmkISpapWTVwICxw3Fs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OApTRLPiVnumecCvd55ztlYJHpgwH9QooaVeKqHHyPsUQlL6Z/d0+U6nIyq8WLdK3
	 Bb58e3PX/ZUTIl1RpLWAejahzJ+v8IcNFt3nmaQVD+ltj6iuNjrcM7wYpJfMSF0fCK
	 d9kmLQCkwHzJjn4avgmYtxsAQTUMYVEebFzrg56jvv+j7BHcZyNBFHbDwY6lfKOB9c
	 /oGfLZHdA/ynkbqmvEJc5zAcACl2VcVTfg/zxQ7vKXj+Dy82iZC6vxYbMgbrwKGiz4
	 7ILEkQdEWVHSvbJ0yfdvs6sV++FdwjoFxvmOLfFru7mPPaXNiCR/jIqN/zwtP6kuv5
	 aEy4j8qGaOzQg==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VYAzAYURjpv5; Mon,  2 Nov 2026 21:23:18 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 5EB001FBCD5;
	Mon,  2 Nov 2026 21:23:18 +0100 (CET)
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
Subject: [PATCH v4 6/7] scripts/sbom: use make_prereqs to determine build inputs
Date: Mon,  2 Nov 2026 21:22:59 +0100
Message-ID: <20261102202308.3209536-7-luis.augenstein@tngtech.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Build the list of file dependencies of a target from the
make_prereqs_<target> field and the deps_<target> entries of the .cmd
file instead of parsing the shell command stored in savedcmd_.

The prerequisites include more than KernelSbom wants to track: files
should be tracked if they end up in the kernel image or loadable
modules, but not each and every host tool or helper script used to
build them. Add a manually maintained exclude list for such
dependencies. It is still manual, but much easier to maintain than
the command-specific parsers that were needed to extract the relevant
inputs from each individual build command.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 47 ++-----------
 scripts/sbom/sbom/cmd_graph/cmd_graph.py      |  6 +-
 scripts/sbom/sbom/cmd_graph/cmd_graph_node.py | 56 ++++++++--------
 .../sbom/sbom/cmd_graph/dependency_filter.py  | 66 +++++++++++++++++++
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 64 +++++++++++-------
 5 files changed, 145 insertions(+), 94 deletions(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/dependency_filter.py

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
index cc576c7c6be..58ca6aa5946 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -5,7 +5,6 @@ import os
 import re
 from dataclasses import dataclass, field
 from sbom.cmd_graph.deps_parser import parse_cmd_file_deps
-from sbom.cmd_graph.savedcmd_parser import parse_inputs_from_commands
 import sbom.sbom_logging as sbom_logging
 from sbom.path_utils import PathStr
=20
@@ -71,65 +70,27 @@ class CmdFile:
=20
         return CmdFile(cmd_file_path, savedcmd, make_prereqs, deps)
=20
-    def get_dependencies(
-        self: "CmdFile", target_path: PathStr, obj_tree: PathStr, fail_o=
n_unknown_build_command: bool
-    ) -> list[PathStr]:
+    def get_dependencies(self: "CmdFile", obj_tree: PathStr) -> list[Pat=
hStr]:
         """
         Parses all dependencies required to build a target file from its=
 cmd file.
=20
         Args:
-            target_path: path to the target file relative to `obj_tree`.
             obj_tree: absolute path to the object tree.
             fail_on_unknown_build_command: Whether to fail if an unknown=
 build command is encountered.
=20
         Returns:
             list[PathStr]: dependency file paths relative to `obj_tree`.
         """
-        input_files: list[PathStr] =3D [
-            str(p) for p in parse_inputs_from_commands(self.savedcmd, fa=
il_on_unknown_build_command)
-        ]
+        input_files: list[PathStr] =3D list(self.make_prereqs)
+
         if self.deps:
             input_files +=3D [str(p) for p in parse_cmd_file_deps(self.d=
eps)]
-        input_files =3D _expand_resolve_files(input_files, obj_tree)
=20
         cmd_file_dependencies: list[PathStr] =3D []
         for input_file in input_files:
-            # input files are either absolute or relative to the object =
tree
+            # input files are either absolute or already relative to the=
 object tree
             if os.path.isabs(input_file):
                 input_file =3D os.path.relpath(input_file, obj_tree)
-            if input_file =3D=3D target_path:
-                # Skip target file to prevent cycles. This is necessary =
because some multi stage commands first create an output and then pass it=
 as input to the next command, e.g., objcopy.
-                continue
             cmd_file_dependencies.append(input_file)
         unique_cmd_file_dependencies =3D list(dict.fromkeys(cmd_file_dep=
endencies))
         return unique_cmd_file_dependencies
-
-
-def _expand_resolve_files(input_files: list[PathStr], obj_tree: PathStr)=
 -> list[PathStr]:
-    """
-    Expands resolve files which may reference additional files via '@' n=
otation.
-
-    Args:
-        input_files (list[PathStr]): List of file paths relative to the =
object tree, where paths starting with '@' refer to files
-                                     containing further file paths, each=
 on a separate line.
-        obj_tree: Absolute path to the root of the object tree.
-
-    Returns:
-        list[PathStr]: Flattened list of all input file paths, with any =
nested '@' file references resolved recursively.
-    """
-    expanded_input_files: list[PathStr] =3D []
-    for input_file in input_files:
-        if not input_file.startswith("@"):
-            expanded_input_files.append(input_file)
-            continue
-        resolve_file_path =3D os.path.join(obj_tree, input_file.removepr=
efix("@"))
-        if not os.path.exists(resolve_file_path):
-            sbom_logging.error(
-                "Skip resolving '{resolve_file_path}' because the respon=
se file does not exist.",
-                resolve_file_path=3Dresolve_file_path,
-            )
-            continue
-        with open(resolve_file_path, "rt", encoding=3D"utf-8") as f:
-            resolve_file_content =3D [line_stripped for line in f.readli=
nes() if (line_stripped :=3D line.strip())]
-        expanded_input_files +=3D _expand_resolve_files(resolve_file_con=
tent, obj_tree)
-    return expanded_input_files
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph.py b/scripts/sbom/sbom=
/cmd_graph/cmd_graph.py
index 2f57965237f..f511167de00 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_graph.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph.py
@@ -3,6 +3,7 @@
=20
 from collections import deque
 from dataclasses import dataclass, field
+import os
 from typing import Iterator
=20
 from sbom.cmd_graph.cmd_graph_node import CmdGraphNode, CmdGraphNodeConf=
ig
@@ -29,7 +30,10 @@ class CmdGraph:
             CmdGraph: A graph of all build dependencies for the given ro=
ot files.
         """
         node_cache: dict[PathStr, CmdGraphNode] =3D {}
-        root_nodes =3D [CmdGraphNode.create(root_path, config, node_cach=
e) for root_path in root_paths]
+        root_nodes =3D [
+            CmdGraphNode.create(os.path.realpath(os.path.join(config.obj=
_tree, root_path)), config, node_cache)
+            for root_path in root_paths
+        ]
         return CmdGraph(root_nodes)
=20
     def __iter__(self) -> Iterator[CmdGraphNode]:
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py b/scripts/sbom=
/sbom/cmd_graph/cmd_graph_node.py
index 61f3a8140ce..c608cb1ca82 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_graph_node.py
@@ -9,6 +9,7 @@ from typing import Iterator, Protocol
=20
 from sbom import sbom_logging
 from sbom.cmd_graph.cmd_file import CmdFile
+from sbom.cmd_graph.dependency_filter import should_include_dependency
 from sbom.cmd_graph.hardcoded_dependencies import get_hardcoded_dependen=
cies
 from sbom.cmd_graph.incbin_parser import parse_incbin_statements
 from sbom.path_utils import PathStr, has_link, is_relative_to
@@ -65,7 +66,7 @@ class CmdGraphNode:
         Dependencies are mainly discovered by parsing the `.<target_path=
.name>.cmd` file.
=20
         Args:
-            target_path: Path to the target file relative to obj_tree.
+            target_path: Absolute normalized path to the target file wit=
hout symbolic links.
             config: Config options
             cache: Tracks processed nodes to prevent cycles.
             depth: Internal parameter to track the current recursion dep=
th.
@@ -76,62 +77,65 @@ class CmdGraphNode:
         if cache is None:
             cache =3D {}
=20
-        target_path_absolute =3D (
-            os.path.realpath(p)
-            if has_link(p:=3Dos.path.join(config.obj_tree, target_path))
-            else os.path.normpath(p)
-        )
-
-        if target_path_absolute in cache:
-            return cache[target_path_absolute]
+        if target_path in cache:
+            return cache[target_path]
=20
         if depth =3D=3D 0:
             logging.debug(f"Build node: {target_path}")
=20
-        cmd_file_path =3D _to_cmd_path(target_path_absolute)
+        cmd_file_path =3D _to_cmd_path(target_path)
         cmd_file =3D CmdFile.create(cmd_file_path) if os.path.exists(cmd=
_file_path) else None
-        node =3D CmdGraphNode(target_path_absolute, cmd_file)
-        cache[target_path_absolute] =3D node
+        node =3D CmdGraphNode(target_path, cmd_file)
+        cache[target_path] =3D node
=20
-        if not os.path.exists(target_path_absolute):
+        if not os.path.exists(target_path):
             error_or_warning =3D (
                 sbom_logging.error
-                if is_relative_to(target_path_absolute, config.obj_tree)
-                or is_relative_to(target_path_absolute, config.src_tree)
+                if is_relative_to(target_path, config.obj_tree)
+                or is_relative_to(target_path, config.src_tree)
                 else sbom_logging.warning
             )
             error_or_warning(
-                "Skip parsing '{target_path_absolute}' because file does=
 not exist",
-                target_path_absolute=3Dtarget_path_absolute,
+                "Skip parsing '{target_path}' because file does not exis=
t",
+                target_path=3Dtarget_path,
             )
             return node
=20
-        # Search for dependencies to add to the graph as child nodes. Ch=
ild paths are always relative to the output tree.
-        def _build_child_node(child_path: PathStr) -> "CmdGraphNode":
-            return CmdGraphNode.create(child_path, config, cache, depth =
+ 1)
+        # Search for dependencies to add to the graph as child nodes.
+        def _build_child_node(child_path_absolute: PathStr) -> "CmdGraph=
Node":
+            return CmdGraphNode.create(child_path_absolute, config, cach=
e, depth + 1)
+
+        # Resolve a dependency path relative to the object tree to an ab=
solute path
+        def _to_absolute_path(child_path_relative: PathStr) -> PathStr:
+            path_absolute =3D os.path.join(config.obj_tree, child_path_r=
elative)
+            return os.path.realpath(path_absolute) if has_link(path_abso=
lute) else os.path.normpath(path_absolute)
=20
         node.hardcoded_dependencies =3D [
-            _build_child_node(hardcoded_dependency_path)
+            _build_child_node(_to_absolute_path(hardcoded_dependency_pat=
h))
             for hardcoded_dependency_path in get_hardcoded_dependencies(
-                target_path_absolute, config.obj_tree, config.src_tree
+                target_path, config.obj_tree, config.src_tree
             )
         ]
=20
         if cmd_file is not None:
             node.cmd_file_dependencies =3D [
-                _build_child_node(cmd_file_dependency_path)
-                for cmd_file_dependency_path in cmd_file.get_dependencie=
s(
-                    target_path, config.obj_tree, config.fail_on_unknown=
_build_command
+                _build_child_node(child_path_absolute)
+                for cmd_file_dependency_path in cmd_file.get_dependencie=
s(config.obj_tree)
+                if should_include_dependency(
+                    child_path_absolute :=3D _to_absolute_path(cmd_file_=
dependency_path), config.obj_tree, config.src_tree
                 )
             ]
=20
         if node.absolute_path.endswith(".S"):
             node.incbin_dependencies =3D [
                 IncbinDependency(
-                    node=3D_build_child_node(incbin_statement.path),
+                    node=3D_build_child_node(child_path_absolute),
                     full_statement=3Dincbin_statement.full_statement,
                 )
                 for incbin_statement in parse_incbin_statements(node.abs=
olute_path)
+                if should_include_dependency(
+                    child_path_absolute :=3D _to_absolute_path(incbin_st=
atement.path), config.obj_tree, config.src_tree
+                )
             ]
=20
         return node
diff --git a/scripts/sbom/sbom/cmd_graph/dependency_filter.py b/scripts/s=
bom/sbom/cmd_graph/dependency_filter.py
new file mode 100644
index 00000000000..5176cc748a9
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/dependency_filter.py
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+
+from sbom.path_utils import PathStr
+
+# Regex patterns for dependencies that should not be tracked in the depe=
ndency graph.
+# Paths relative to the object tree or source tree.
+_COMPILED_EXCLUDE_PATTERNS: tuple[re.Pattern[str], ...] =3D (
+    # scripts in source tree (except module-common.c, which is compiled =
into every module)
+    re.compile(r"^scripts/(?!module-common\.c$)"),
+    # scripts and tools in obj tree
+    re.compile(r"^tools/"),
+    re.compile(r"^arch/[^/]+/tools/"),
+    # Host helper scripts
+    re.compile(r".*\.sh$"),
+    re.compile(r".*\.py$"),
+    re.compile(r".*\.pl$"),
+    # Host-tool executables
+    re.compile(r"^certs/extract-cert$"),
+    re.compile(r"^security/selinux/genheaders$"),
+    re.compile(r"^usr/gen_init_cpio$"),
+    re.compile(r"^drivers/gpu/drm/radeon/mkregtable$"),
+    re.compile(r"^drivers/video/logo/pnmtologo$"),
+    re.compile(r"^lib/raid/raid6/mktables$"),
+    re.compile(r"^fs/smb/client/gen_smb1_mapping$"),
+    re.compile(r"^fs/smb/client/gen_smb2_mapping$"),
+    # Other
+    re.compile(r".*\.xsd$"),
+    re.compile(r".*purgatory\.chk$"),
+    re.compile(r".*\.genkey$"),
+    re.compile(r".*\.md$"),
+    re.compile(r"^include/config/"),
+    # x86
+    re.compile(r"^arch/x86/boot/compressed/mkpiggy$"),
+    re.compile(r"^arch/x86/boot/mkcpustr$"),
+    # arm
+    re.compile(r"^arch/arm/vdso/vdsomunge$"),
+    # arm64
+    re.compile(r"^arch/arm64/kvm/hyp/nvhe/gen-hyprel$"),
+    re.compile(r"^arch/arm64/kernel/pi/relacheck$"),
+)
+
+
+def should_include_dependency(path: PathStr, obj_tree: PathStr, src_tree=
: PathStr) -> bool:
+    """
+    Return whether a `.cmd` dependency should appear in the tracked depe=
ndency graph.
+
+    Track files that are inputs to compiling or linking artifacts that e=
nd up in the
+    kernel image or loadable modules (e.g. source =E2=86=92 object =E2=86=
=92 archive =E2=86=92 image/module).
+    Exclude host tools and helper scripts whose code is not linked into =
the kernel.
+
+    Args:
+        path: absolute path to the dependency.
+        obj_tree: absolute path to the object tree.
+        src_tree: absolute path to the source tree.
+
+    Returns:
+        True if the dependency should be included in the dependency grap=
h.
+    """
+    if path.startswith(obj_tree + "/") or not path.startswith(src_tree +=
 "/"):
+        filter_path =3D path.removeprefix(obj_tree + "/")
+    else:
+        filter_path =3D path.removeprefix(src_tree + "/")
+    return not any(pattern.match(filter_path) for pattern in _COMPILED_E=
XCLUDE_PATTERNS)
diff --git a/scripts/sbom/sbom/spdx_graph/kernel_file.py b/scripts/sbom/s=
bom/spdx_graph/kernel_file.py
index 505f25f66eb..cea14cb3538 100644
--- a/scripts/sbom/sbom/spdx_graph/kernel_file.py
+++ b/scripts/sbom/sbom/spdx_graph/kernel_file.py
@@ -245,7 +245,7 @@ def _get_primary_purpose(absolute_path: PathStr) -> S=
oftwarePurpose | None:
         return any(segment in absolute_path for segment in path_segments=
)
=20
     # Source code
-    if ends_with([".c", ".h", ".S", ".s", ".rs", ".pl", "gen_smb1_mappin=
g", "gen_smb2_mapping"]):
+    if ends_with([".c", ".h", ".S", ".s", ".rs"]):
         return "source"
=20
     # Libraries
@@ -271,45 +271,61 @@ def _get_primary_purpose(absolute_path: PathStr) ->=
 SoftwarePurpose | None:
     # Data files
     if ends_with(
         [
-            ".tbl",
-            ".relocs",
-            ".rmeta",
-            ".in",
+            ".awk",
             ".dbg",
-            ".x509",
-            ".pbm",
-            ".ppm",
             ".dtb",
-            ".uc",
-            ".inc",
+            ".dtbo",
             ".dts",
             ".dtsi",
-            ".dtbo",
-            ".xml",
+            ".dtso",
+            ".in",
+            ".inc",
+            ".json",
+            ".ld",
+            ".lds",
+            ".mod",
+            ".order",
+            ".pbm",
+            ".ppm",
+            ".relocs",
+            ".rmeta",
             ".ro",
-            "initramfs_inc_data",
-            "default_cpio_list",
-            "x509_certificate_list",
-            "utf8data.c_shipped",
+            ".tbl",
+            ".uc",
+            ".x509",
+            ".xml",
             "blacklist_hash_list",
-            "x509_revocation_list",
             "cpucaps",
-            "sysreg",
+            "default_cpio_list",
+            "initramfs_inc_data",
+            "kheaders.md5",
+            "kheaders-objlist",
+            "kheaders-srclist",
             "mach-types",
+            "sysreg",
+            "utf8data.c_shipped",
+            "x509_certificate_list",
+            "x509_revocation_list",
         ]
     ) or includes_path_segments(["drivers/gpu/drm/radeon/reg_srcs/"]):
         return "data"
=20
     # Configuration files
-    if ends_with([".pem", ".key", ".conf", ".config", ".cfg", ".bconf"])=
:
+    if ends_with([
+        ".pem",
+        ".key",
+        ".conf",
+        ".config",
+        ".cfg",
+        ".bconf",
+        "config_data",
+        ".genkey",
+        "bindgen_parameters",
+    ]):
         return "configuration"
=20
-    # Documentation
-    if ends_with([".md"]):
-        return "documentation"
-
     # Other / miscellaneous
-    if ends_with([".o", ".tmp"]):
+    if ends_with([".o"]):
         return "other"
=20
     sbom_logging.warning("Could not infer primary purpose for {absolute_=
path}", absolute_path=3Dabsolute_path)
--=20
2.43.0

