Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943A4C227A;
	Mon, 12 Oct 2026 21:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840844; cv=none; b=mYyLHJvTwg6L79Dtzyyabl7pp7qvJ55UtD9LyqrVKXZAFXsTc/IQ90Bv8DSRa0N8GNG/D7e1Y7k+u8ulVZ8nRXW+XEAze4CGSCzUn/ikX759JLq5ulA82T/OKRQoRapFakVcmGvefoAcYMN28IHg7T1dxuP5ckMhFxB9oybc28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840844; c=relaxed/simple;
	bh=Uv9KnZEx1gNpfLNbFHexy3CZh5XLR2mGbA5VY/z6A8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LaejScZU9zSwvQDkzXW8Th8ZXMjQWYrulxxDmvbuvJjS4qY0T7SOg56DjdbjPInQtI+WMUTm5XfalA6iFFl9wwWzI82i0z3nvCnYleAcY55/E4Rkn9IHOKdFhTbNHAIG+cxr5Aa8kC/na2jSxluTi4ZG0iHDpm39Zhk3p4IDJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=hSdlTKyX; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="hSdlTKyX"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 7185B40872;
	Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 66D4A1FBB13;
	Mon, 12 Oct 2026 23:34:01 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1Qv9z5-zLEFU; Mon, 12 Oct 2026 23:34:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 6EECD1F926A;
	Mon, 12 Oct 2026 23:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 6EECD1F926A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840840;
	bh=Cp4amg3RgLgQYI5lK9GIOUW99mWFn3alw5lseBajUpo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hSdlTKyXoh+LkbIoFlMOSwj4WrZzINLtxrGSTEHifpfUYGtAvWETe5o40FsL1K5ou
	 adI52GsbV5seJu2rIzMvFpCnetV+u7RZQBVslRI/fLSfmXSNPzqHwt+vH4g346o66j
	 5MV+/WU+guPAIabXQbagWijagBmUy4fpgenR5aA1kdOAvOmrofViTbR4AWw01pxwxV
	 nXBvMBo9ZMk+ZvlybFQm3hNHIETGJpuJudPWJqddZ8dCQNzHkFcAslLUhojKxkHVcb
	 iZERl496xDGl41NkoPz4Y1NrOibGMJoTCfl3pKDQHjDKxabEjv4hiMb4IG33H3Ua1z
	 bLukkHLH2nJ/Q==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id XIizdiVugK1q; Mon, 12 Oct 2026 23:34:00 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 0D6E21F8B42;
	Mon, 12 Oct 2026 23:34:00 +0200 (CEST)
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
Subject: [PATCH v3 5/7] scripts/sbom: parse make_prereqs from .cmd files
Date: Mon, 12 Oct 2026 23:33:20 +0200
Message-ID: <20261012213337.2466524-6-luis.augenstein@tngtech.com>
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

Add support for parsing the make_prereqs_<target> field recorded by
kbuild in .cmd files.

Refactor CmdFile.create() to collect the required fields by name
instead of deriving the file structure from the number of lines and
the position.

The source_ entry is no longer parsed, because it is always also
included in make_prereqs_<target> and therefore redundant for
KernelSbom.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/cmd_graph/cmd_file.py | 103 +++++++++---------------
 1 file changed, 36 insertions(+), 67 deletions(-)

diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
index 08819b4d117..cc576c7c6be 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -10,97 +10,66 @@ import sbom.sbom_logging as sbom_logging
 from sbom.path_utils import PathStr
=20
 SAVEDCMD_PATTERN =3D re.compile(r"^(saved)?cmd_.*?:=3D\s*(?P<full_comman=
d>.+)$")
-SOURCE_PATTERN =3D re.compile(r"^source.*?:=3D\s*(?P<source_file>.+)$")
+MAKE_PREREQS_PATTERN =3D re.compile(r"^make_prereqs_.*?:=3D\s*(?P<prereq=
s>.+)$")
+DEPS_ASSIGNMENT_PATTERN =3D re.compile(r"^deps_.*?:=3D")
=20
=20
 @dataclass
 class CmdFile:
     cmd_file_path: PathStr
     savedcmd: str
-    source: PathStr | None =3D None
+    make_prereqs: list[str] =3D field(default_factory=3Dlist)
     deps: list[str] =3D field(default_factory=3Dlist)
-    make_rules: list[str] =3D field(default_factory=3Dlist)
=20
     @classmethod
     def create(cls, cmd_file_path: PathStr) -> "CmdFile | None":
-        """
-        Parses a .cmd file.
-        .cmd files are assumed to have one of the following structures:
-        1. Full Cmd File
-            (saved)?cmd_<output> :=3D <command>
-            source_<output> :=3D <main_input>
-            deps_<output> :=3D \
-            <dependencies>
-            <output> :=3D $(deps_<output>)
-            $(deps_<output>):
-
-        2. Command Only Cmd File
-            (saved)?cmd_<output> :=3D <command>
-
-        3. Single Dependency Cmd File
-            (saved)?cmd_<output> :=3D <command>
-            <output> : <dependency>
+        r"""
+        Parse the following fields from a `.cmd` file:
+
+        * `(saved)?cmd_<target> :=3D <shell command>` (required) =E2=80=94
+          the shell command Kbuild ran to produce the build target.
+        * `make_prereqs_<target> :=3D <prerequisites>` (required but can=
 be empty) =E2=80=94
+          the non-phony make prerequisites.
+        * `deps_<target> :=3D \` (optional) =E2=80=94
+          additional dependencies not covered by make prerequisites, e.g=
., headers.
=20
         Args:
-            cmd_file_path (Path): absolute Path to a .cmd file
+            cmd_file_path (Path): absolute Path to a `.cmd` file.
=20
         Returns:
-            cmd_file (CmdFile): Parsed cmd file.
+            cmd_file (CmdFile): Parsed `.cmd` file or `None` if no `save=
dcmd` line was found.
         """
         with open(cmd_file_path, "rt", encoding=3D"utf-8") as f:
             lines =3D [line.strip() for line in f.readlines() if line.st=
rip() !=3D "" and not line.startswith("#")]
=20
-        # make_prereqs_* is recorded for future use. Ignore it for now t=
o
-        # preserve the existing parser behavior.
-        lines =3D [line for line in lines if not line.startswith("make_p=
rereqs_")]
+        savedcmd: str | None =3D None
+        make_prereqs: list[str] =3D []
+        deps: list[str] =3D []
+
+        for i, line in enumerate(lines):
+            match =3D SAVEDCMD_PATTERN.match(line)
+            if match is not None:
+                savedcmd =3D match.group("full_command")
+                continue
+
+            match =3D MAKE_PREREQS_PATTERN.match(line)
+            if match is not None:
+                make_prereqs =3D match.group("prereqs").split()
+                continue
=20
-        # savedcmd
-        match =3D SAVEDCMD_PATTERN.match(lines[0] if lines else "")
-        if match is None:
+            if DEPS_ASSIGNMENT_PATTERN.match(line):
+                j =3D i + 1
+                while j < len(lines) and lines[j].endswith("\\"):
+                    deps.append(lines[j].removesuffix("\\").strip())
+                    j +=3D 1
+
+        if savedcmd is None:
             sbom_logging.error(
                 "Skip parsing '{cmd_file_path}' because no 'savedcmd_' c=
ommand was found.", cmd_file_path=3Dcmd_file_path
             )
             return None
-        savedcmd =3D match.group("full_command")
-
-        # Command Only Cmd File
-        if len(lines) =3D=3D 1:
-            return CmdFile(cmd_file_path, savedcmd)
-
-        # Single Dependency Cmd File
-        if len(lines) =3D=3D 2:
-            parts =3D lines[1].split(":", 1)
-            if len(parts) !=3D 2:
-                sbom_logging.error(
-                    "Skip parsing '{cmd_file_path}'. Expected dependency=
 line '<output>: <dependency>' but got {second_line}", cmd_file_path=3Dcm=
d_file_path, second_line=3Dlines[1]
-                )
-                return None
-            dep =3D parts[1].strip()
-            return CmdFile(cmd_file_path, savedcmd, deps=3D[dep])
-
-        # Full Cmd File
-        # source
-        line1 =3D SOURCE_PATTERN.match(lines[1])
-        if line1 is None:
-            sbom_logging.error(
-                "Skip parsing '{cmd_file_path}' because no 'source_' ent=
ry was found.", cmd_file_path=3Dcmd_file_path
-            )
-            return CmdFile(cmd_file_path, savedcmd)
-        source =3D line1.group("source_file")
-
-        # deps
-        deps: list[str] =3D []
-        i =3D 3  # lines[2] includes the variable assignment but no actu=
al dependency, so we need to start at lines[3].
-        while i < len(lines):
-            if not lines[i].endswith("\\"):
-                break
-            deps.append(lines[i][:-1].strip())
-            i +=3D 1
-
-        # make_rules
-        make_rules =3D lines[i:]
=20
-        return CmdFile(cmd_file_path, savedcmd, source, deps, make_rules=
)
+        return CmdFile(cmd_file_path, savedcmd, make_prereqs, deps)
=20
     def get_dependencies(
         self: "CmdFile", target_path: PathStr, obj_tree: PathStr, fail_o=
n_unknown_build_command: bool
--=20
2.43.0

