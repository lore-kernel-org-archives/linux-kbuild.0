Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73945C709;
	Fri, 14 Aug 2026 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706885; cv=none; b=QotccvJJle708v91TlvmiIT5uz4QUhySHTWvqEMxHfDBB/o1q8HJ8c55p2wyeNGHI93kyTc2LwDOu2uUeLt4inUofEpuy3LnJ45FemZ3FujOJDXyI3wfglDmZcR9a41tFMHZ+mWT31sNm3i/qwe6veG5ZRK7SuxbskU4npzNMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706885; c=relaxed/simple;
	bh=ZSrdGJ91T6CxixqPYylRRl3s+EYE4henuTN3VS6vJrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIqBVEqa8gn/ZilHbKGjAM956OHcK3KBrFXtXqu6HcyQWCYO9xp1sh6huvoY1t7vSOlLkX96gv3EcjxAaAI/hYI4cUxF7TYcH88EUkkJJz750eKelzIRtatuwhmYIZ3lz95fh0HMeu1zLr52blazSMpa9vpK7zhJ4SEd5dw/C6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=I0yyFL7V; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="I0yyFL7V"
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id D4E0B200C4;
	Fri, 14 Aug 2026 13:22:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A35A81FB67B;
	Fri, 14 Aug 2026 13:22:24 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id WNkOOA096SIZ; Fri, 14 Aug 2026 13:22:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id D0CAE1FB763;
	Fri, 14 Aug 2026 13:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz D0CAE1FB763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1786706543;
	bh=EVnMzX+rhgvXGSFLubHi4UW2nRDtz61k93aQxc8Kbic=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I0yyFL7VJGCuDNgOZAoL9j2EbLqQaHJlNXFgBPWBkao0/3/hHOXdIAP9KyEPp645L
	 KFlL3Y4mQjM/4mMPAmPAK9ZQiev5PCnDwXTq/dyQiqwKu2g3TG15E2slPcDajbpiOG
	 hIto0ogDx9f7pJV+5TwdIfVyt1CJF3lU8fcfmNwmc8QqvBR3E8jGSywpE3X0+5qPQL
	 ioowpEhlXIn06hGCTkR1ddgCnIgu5+KDXdeas4tvmREV1/1BluAMLpQLv0c8G2b8SS
	 7dL2sW0qo9f7b3ILhW+7W7wNGM/g9vNXTNFd+LGFfCwp9b2hnuCPOiaZ92uLNO8njq
	 VX5T1wrV3SAUw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id qjLuq_oFYeVk; Fri, 14 Aug 2026 13:22:23 +0200 (CEST)
Received: from luis-Precision-5480.local (fire-karlsruhe-raumfabrik.tngtech.com [213.144.24.146])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 95D621FB67B;
	Fri, 14 Aug 2026 13:22:23 +0200 (CEST)
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
Subject: [PATCH 1/1] kbuild: record real-prereqs in .cmd files
Date: Fri, 14 Aug 2026 13:21:34 +0200
Message-ID: <20260814112134.832243-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814112134.832243-1-luis.augenstein@tngtech.com>
References: <20260814112134.832243-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Record $(real-prereqs), the non-phony prerequisites of the target, in a
new metadata field:

    make_prereqs_<target> :=3D <prerequisites>

Write the field from both cmd_and_savecmd and cmd_and_fixdep.

Update scripts/make_fit.py to read only savedcmd_* instead of parsing the
complete .cmd file.

Ignore make_prereqs_* in KernelSbom.

Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngt=
ech.com
Assisted-by: Cursor:GPT-5.6 Sol
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/Kbuild.include                  |  9 +++++++--
 scripts/basic/fixdep.c                  | 16 ++++++++++------
 scripts/make_fit.py                     |  2 +-
 scripts/sbom/sbom/cmd_graph/cmd_file.py |  4 ++++
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e2..6daa244ba0e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -181,6 +181,9 @@ endif
 # (needed for the shell)
 make-cmd =3D $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(c=
md_$(1)))))
=20
+# prerequisites to record in .cmd files, excluding those covered in deps=
_*
+cmd-prereqs =3D $(call escsq,$(filter-out $(deps_$@), $(real-prereqs)))
+
 # Find any prerequisites that are newer than target or that do not exist=
.
 # PHONY targets skipped in both cases.
 # If there is no prerequisite other than phony targets, $(newer-prereqs)=
 becomes
@@ -198,14 +201,16 @@ if_changed =3D $(if $(if-changed-cond),$(cmd_and_sa=
vecmd),@:)
=20
 cmd_and_savecmd =3D                                                     =
       \
 	$(cmd);                                                              \
-	printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd
+	printf '%s\n\n%s\n' 'savedcmd_$@ :=3D $(make-cmd)'                    \
+		'make_prereqs_$@ :=3D $(cmd-prereqs)' > $(dot-target).cmd
=20
 # Execute the command and also postprocess generated .d dependencies fil=
e.
 if_changed_dep =3D $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
=20
 cmd_and_fixdep =3D                                                      =
       \
 	$(cmd);                                                              \
-	$(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-tar=
get).cmd;\
+	$(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)'          \
+		'$(cmd-prereqs)' > $(dot-target).cmd;                        \
 	rm -f $(depfile)
=20
 # Usage: $(call if_changed_rule,foo)
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index cdd5da7e009..03831a6f8f7 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -62,15 +62,17 @@
  *
  * It is invoked as
  *
- *   fixdep <depfile> <target> <cmdline>
+ *   fixdep <depfile> <target> <cmdline> <prereqs>
  *
  * and will read the dependency file <depfile>
  *
  * The transformed dependency snipped is written to stdout.
  *
- * It first generates a line
+ * It first generates the lines
  *
- *   savedcmd_<target> =3D <cmdline>
+ *   savedcmd_<target> :=3D <cmdline>
+ *
+ *   make_prereqs_<target> :=3D <prereqs>
  *
  * and then basically copies the .<target>.d file to stdout, in the
  * process filtering out the dependency on autoconf.h and adding
@@ -103,7 +105,7 @@
=20
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
+	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline> <prereqs>\n=
");
 	exit(1);
 }
=20
@@ -409,17 +411,19 @@ static void parse_dep_file(char *p, const char *tar=
get)
=20
 int main(int argc, char *argv[])
 {
-	const char *depfile, *target, *cmdline;
+	const char *depfile, *target, *cmdline, *prereqs;
 	void *buf;
=20
-	if (argc !=3D 4)
+	if (argc !=3D 5)
 		usage();
=20
 	depfile =3D argv[1];
 	target =3D argv[2];
 	cmdline =3D argv[3];
+	prereqs =3D argv[4];
=20
 	printf("savedcmd_%s :=3D %s\n\n", target, cmdline);
+	printf("make_prereqs_%s :=3D %s\n\n", target, prereqs);
=20
 	buf =3D read_file(depfile);
 	parse_dep_file(buf, target);
diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 15ba26974fd..346e8a7ec12 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -288,7 +288,7 @@ def process_dtb(fname, args):
         path, basename =3D os.path.split(fname)
         cmd_fname =3D os.path.join(path, f'.{basename}.cmd')
         with open(cmd_fname, 'r', encoding=3D'ascii') as inf:
-            cmd =3D inf.read()
+            cmd =3D inf.readline()
=20
         if 'scripts/dtc/fdtoverlay' in cmd:
             # This depends on the structure of the composite DTB command
diff --git a/scripts/sbom/sbom/cmd_graph/cmd_file.py b/scripts/sbom/sbom/=
cmd_graph/cmd_file.py
index dcd63e284a3..08819b4d117 100644
--- a/scripts/sbom/sbom/cmd_graph/cmd_file.py
+++ b/scripts/sbom/sbom/cmd_graph/cmd_file.py
@@ -50,6 +50,10 @@ class CmdFile:
         with open(cmd_file_path, "rt", encoding=3D"utf-8") as f:
             lines =3D [line.strip() for line in f.readlines() if line.st=
rip() !=3D "" and not line.startswith("#")]
=20
+        # make_prereqs_* is recorded for future use. Ignore it for now t=
o
+        # preserve the existing parser behavior.
+        lines =3D [line for line in lines if not line.startswith("make_p=
rereqs_")]
+
         # savedcmd
         match =3D SAVEDCMD_PATTERN.match(lines[0] if lines else "")
         if match is None:
--=20
2.43.0

