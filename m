Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121124;
	b=lWA8nc0yo6b9rUvbZj6ZQfg9aWyit52m3MwpNn/jX9QkAP3dQPmrMKJFQy09lM2w+Ru8
	 e32wipMXGq32nHycUBFUkTLi/bzDZraqu7X8IZlIJUyNTwPP/LJWq5N+RRWRgCwg3AgQ9
	 wmAjd1opSm5RdrviUL0rmSXIiDl1JQzYdIGYw3Be2G/E3nqrNnlHc/Cd+zUXQ1HKsoa6A
	 4I8r6ksdN3ucnpCuaGrqpNGQKRTsb7q7kVVSeG/RhqYfzTSAoudMGZOrCcuj0uZmoha+H
	 0cAXeMdYAzVRMAJJ0QYQLdB3DZ883hcaUaHSLtlTFo31pniNSPjiwOr1wbHD7gZkIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121124;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tNn3IJSNwm9LvzdD9Ke+gu+1/sFt9aSYdYeyuwCbON0=;
	b=gv/179b9P/lnGI4c6WpQd3EgdynDOZj1OLhE6kjqzxB02OfJfv8Ois/iBN3hJftnfc/N
	 ZkpXaPtmu0jlFkBPuoqsuA45UbM1S00dWumMHh/8Qg6IK2MjMQBcLmby+kuGVXFlPkkG9
	 cZqCbSt/40EEx0/q5izKxGVyCqa3bBy/GF5oT4CUsAFJMrpS9JvVBPV+vMykI8y1IyE2V
	 EjYYvNAr6aTaATNgcPUjPjhgdQWld6nvMj3vAAOZNA3y3LxjvlhdDIr/iISOIE+My2yPe
	 NNkmBlKfewYZG/l+AMaQSY5a00ZlWoHcpU1Os21onaRh2ckpe8S9c+STBhqJugpm4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=bsCiYmlr;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379D606BBB5;
	Thu, 19 Nov 2026 20:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3379D606BBB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=bsCiYmlr
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id C0C6A4051B;
	Thu, 19 Nov 2026 21:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id B933B1FB967;
	Thu, 19 Nov 2026 21:45:20 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vgJB4WEXAQxb; Thu, 19 Nov 2026 21:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 18B661FBD38;
	Thu, 19 Nov 2026 21:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 18B661FBD38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795121120;
	bh=tNn3IJSNwm9LvzdD9Ke+gu+1/sFt9aSYdYeyuwCbON0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bsCiYmlrN0PtxSSm8spU6LYz2NVH/T1ZEN+KpuZEzMDFg+Hw7VBWG2cxoDDAtRMyO
	 JeDbYy7UGF8rzexlPkMtZ1Lb9hA9ykItuuydgBUDV5Hqo4CHgIX6JHApGo49lFe5dx
	 Vvf1dzCZW6DBNJbJ4rFnAYgLxbu695+0u27uTFQKiHBE87zdkY9gh12LtpNXr1CwFi
	 FlJPxOR28BpkSrBqpoknTSymSGKv1OY05PlyM+t19CnD95SHrbStvqTHi6KWwsaF3X
	 skKk4VVlDIJHsDSLXzpWjXEAMjLVyITOAWonpnor/AxkXCcO6TIrLsQ3uI6Eb6De4P
	 e6WQeow7RurGw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TVnSZLFo3JbR; Thu, 19 Nov 2026 21:45:20 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A7FBC1FB967;
	Thu, 19 Nov 2026 21:45:19 +0100 (CET)
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
Subject: [PATCH v6 5/7] scripts/sbom: parse make_prereqs from .cmd files
Date: Thu, 19 Nov 2026 21:44:51 +0100
Message-ID: <20261119204457.9968-6-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119204457.9968-1-luis.augenstein@tngtech.com>
References: <20261119204457.9968-1-luis.augenstein@tngtech.com>
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

Add support for parsing the make_prereqs_<target> field recorded by
kbuild in .cmd files.

Refactor CmdFile.create() to collect the required fields by name
instead of deriving the file structure from the number of lines and
the position.

The source_ entry is no longer parsed, because it is always also
included in make_prereqs_<target> and therefore redundant for
KernelSbom.

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

