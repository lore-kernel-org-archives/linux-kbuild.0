Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AC3B1014;
	Mon, 12 Oct 2026 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840854; cv=none; b=T72mT4L8prx1xhm76EdyRuXf5iu25ftuDUcO2TOf4i5I8Cq3tA+oXvBuggBrxS6InT9BlA1nHqQCZ5qlHo1cwdQinhpF4smu8IW4nzwUkyfZxZzMWBreTUMsXFWNRjCMsG5BIMF9wfaS7qsau9qwwn5GmvTMUBCtUuaYdAQMfHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840854; c=relaxed/simple;
	bh=8n3m2GaofEM751bqm8VSag2QYaeGgPRG9+4FANhM1Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOxFfjFddcICakN34uorsO7VpYIzMCuOt97hokwYLw+amP+AsHAGTLmzQz4exCaCg0ibaK+5IeJVK9bAwCjEtRmita/MXGs0KcKssUJ1/+1ESsIgNw7hGRIbzHJstELx+w8IcSt9NCZX4m5/v1pIiABEqs1zoAvW+0UGDmvAc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=D3Kh1+Wg; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="D3Kh1+Wg"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 5671340872;
	Mon, 12 Oct 2026 23:34:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 4947F1F9691;
	Mon, 12 Oct 2026 23:34:07 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id gluUomYqpNVj; Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id CE7481F8B81;
	Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz CE7481F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840841;
	bh=O0HT2uO2dQUHBGtTflZIrdiSJriKh9q1D6EOZdgpEkM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=D3Kh1+WgNVkOOFQJaEuDtXgcULTKQ7jN7tpzxB9wU4TNXgVkvQzcejvazwjaFSRa/
	 zdUimqDwr+7O7ubl8wBHYNqFGj7uqSC6z55ViqVqzWqnUtUn1bUpH8e1oAx9xbDe0B
	 uPa3EECuhin1onOdxdSsZYs1UVi66k12+IbIy9VAdTwLIExuJ9T/nxZvcU0e3+UJ2x
	 NxzW0LsZoacUHibSgrxQNGsVzTv/+DZdnF9CovEzQQLhl5uQ/iJ49P/JKLQXk8wWtJ
	 01x2b+DZQzIFS2gIrcgIR9CJL4Kg+4DeOpj6XQS/7Ge3ltCrM8YyFPuNdP3N84d2rw
	 EPrZo/bH2EPfA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id YcLVIhNi12WL; Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 61C321F9691;
	Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
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
Subject: [PATCH v3 6/7] scripts/sbom: use make_prereqs to determine build inputs
Date: Mon, 12 Oct 2026 23:33:21 +0200
Message-ID: <20261012213337.2466524-7-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
References: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
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
 scripts/sbom/sbom/cmd_graph/cmd_file.py       | 46 ++-----------
 .../sbom/sbom/cmd_graph/dependency_filter.py  | 59 +++++++++++++++++
 scripts/sbom/sbom/spdx_graph/kernel_file.py   | 64 ++++++++++++-------
 3 files changed, 105 insertions(+), 64 deletions(-)
 create mode 100644 scripts/sbom/sbom/cmd_graph/dependency_filter.py

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
index cc576c7c6be..ab4b00b252b 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -5,7 +5,7 @@ import os
 import re
 from dataclasses import dataclass, field
 from sbom.cmd_graph.deps_parser import parse_cmd_file_deps
-from sbom.cmd_graph.savedcmd_parser import parse_inputs_from_commands
+from sbom.cmd_graph.dependency_filter import should_include_dependency
 import sbom.sbom_logging as sbom_logging
 from sbom.path_utils import PathStr
=20
@@ -85,51 +85,17 @@ class CmdFile:
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
-            cmd_file_dependencies.append(input_file)
+            if should_include_dependency(input_file):
+                cmd_file_dependencies.append(input_file)
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
diff --git a/scripts/sbom/sbom/cmd_graph/dependency_filter.py b/scripts/s=
bom/sbom/cmd_graph/dependency_filter.py
new file mode 100644
index 00000000000..f1fdc2cb965
--- /dev/null
+++ b/scripts/sbom/sbom/cmd_graph/dependency_filter.py
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import re
+
+from sbom.path_utils import PathStr
+
+# Regex patterns for dependencies that should not be tracked in the depe=
ndency graph.
+_COMPILED_EXCLUDE_PATTERNS: tuple[re.Pattern[str], ...] =3D (
+    # scripts in source tree (except module-common.c, which is compiled =
into every module)
+    re.compile(r"^\.\./scripts/(?!module-common\.c$)"),
+    # scripts and tools in obj tree
+    re.compile(r"^scripts/"),
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
+    re.compile(r"^\.\./fs/smb/client/gen_smb1_mapping$"),
+    re.compile(r"^\.\./fs/smb/client/gen_smb2_mapping$"),
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
+def should_include_dependency(path: PathStr) -> bool:
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
+        path: Dependency path relative to the object tree.
+
+    Returns:
+        True if the dependency should be included in the dependency grap=
h.
+    """
+    return not any(pattern.match(path) for pattern in _COMPILED_EXCLUDE_=
PATTERNS)
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

