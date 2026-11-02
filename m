Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651005;
	b=CmBQaJbtM1QVc4YCPZCC6LLRWhyiiSvzwIg65n/FheLFxeEK3Z3EaqQ99nNhX1Wl8GK3
	 WwcE8X9ID1UnFCR+SYD0LgLSieJ+zfg+AWeoGV40LtilyeUo38ty3iWKCN3ki7rZ5xCis
	 BAtD53JihY9ohCAgM4IkcD5KxWYHlfMd9R0ex5EhHumdrDvsDboB6nJXvpW7umIhiCx9r
	 MWfrgLQfWCufQYAqGYwciyrXbCrd6Ldxpcgi/ieB6lCcHOCw0p8XE6dEfRnROp+QD6nMM
	 rgY7fTPeADwzp8x3Hlmy8dLAVURPfCP/gTLCAFNSforJlh0fyhGbI35HiA3Tz/yHLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651005;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AK84/ve9NI+NDVm/3eQZFY5P2V549NgkAhrck6GVFMI=;
	b=SJloA9X9M2XVDEDtRSWqSBFJDehDNvGc7gZs1lu3UHoWpwQap6IZIjhmWahjRQXe59ZE
	 Rnxduhz9Nn2KMmdMfXYWIOYBLCQ/zDN/2/t7D8d3dW3YNAcj0NQbPevuABAf20ZDuDyw4
	 5TCyD7CSYF3u6d3hWnrKXcct/udGS3uWKXmPE4QGcnjgPmhWaZo7pqE15yUNEP4A8FEXI
	 t0pG96JFTd/CrBncKZ54slQtzcamF+4mg0KlW4oXb2QBsLxlgq9xe6pDoPLxcUxLcYgdw
	 UFPPBdv627ufcGyaFh32Ib+4g2Lv3OyvCBY1T6HkuWHwouY0DxCdHnhEXdjaPysuA4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=byn0IQBp;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087A606A32F;
	Mon,  2 Nov 2026 20:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4087A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=byn0IQBp
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 80C164035A;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5D3C61FBD34;
	Mon,  2 Nov 2026 21:23:17 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id OhhSAqbmkdbI; Mon,  2 Nov 2026 21:23:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 85D321FBD07;
	Mon,  2 Nov 2026 21:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 85D321FBD07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1793650996;
	bh=AK84/ve9NI+NDVm/3eQZFY5P2V549NgkAhrck6GVFMI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=byn0IQBpzZgTFM8yDR68C4XiEexpops9oGdJu452GZ3WODZuTELBttqmWIkUcbb+E
	 Z7CNS6tsYe0nvhYdKUIlJiWex+H3nvvspRDxH8S6j+dfyuOeRtgvj3ZUq+9WFnFD+4
	 94EIVvFZNcWd1jLaJvrjLM0IXeK3+dHJ8VWEG+8rwGDEzsGnLh6LcxGrhYXWNMROPz
	 zK6V2KGSl3Otab39Q8NMmyO4Fcaa3c/rK91GMpyzlcLo6knNBFHUKd/xlav/6tV+Z+
	 gf8z9Pu/HtUnKuCl/QTf0/rPz+qyq6NVHwPvwg1ILN45cqU4Wk+O0kK9FCdUOw4GN9
	 tC0gE9m0lvnOA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id xsh-nkXDu4Rq; Mon,  2 Nov 2026 21:23:16 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 2A41E1FBD03;
	Mon,  2 Nov 2026 21:23:16 +0100 (CET)
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
Subject: [PATCH v4 4/7] kbuild: record cmd-prereqs in .cmd files
Date: Mon,  2 Nov 2026 21:22:57 +0100
Message-ID: <20261102202308.3209536-5-luis.augenstein@tngtech.com>
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

Record $(cmd-prereqs), i.e. $(real-prereqs) with the deps_*
dependencies filtered out, in a new .cmd file metadata field:

    make_prereqs_<target> :=3D <prerequisites>

On an incremental build, deps_<target> holds the dependencies
recorded from the depfile of the previous build. Those are filtered
out from $(real-prereqs), even if they no longer appear in the
current depfile. fixdep additionally filters the dependencies
collected from the current depfile, so that they are not recorded in
both deps_<target> and make_prereqs_<target>. This keeps the field
consistent between clean and incremental builds.

Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngt=
ech.com
Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/Kbuild.include | 10 ++++++--
 scripts/basic/fixdep.c | 54 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e2..7790519f92f 100644
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
@@ -198,14 +201,17 @@ if_changed =3D $(if $(if-changed-cond),$(cmd_and_sa=
vecmd),@:)
=20
 cmd_and_savecmd =3D                                                     =
       \
 	$(cmd);                                                              \
-	printf '%s\n' 'savedcmd_$@ :=3D $(make-cmd)' > $(dot-target).cmd
+	printf '%s\n'                                                        \
+		'savedcmd_$@ :=3D $(make-cmd)' ''                              \
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
index f514ef606ec..005c1c3df49 100644
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
+ *   make_prereqs_<target> :=3D <prereqs_without_deps>
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
@@ -478,23 +480,63 @@ static void print_dep_file(const char *target, cons=
t struct dep_info *info)
 	printf("$(deps_%s):\n", target);
 }
=20
+/*
+ * Print make_prereqs_<target> from prereqs, excluding the deps listed
+ * in info.
+ */
+static void print_make_prereqs(const char *target, const char *prereqs,
+			       const struct dep_info *info)
+{
+	struct item *seen_prereqs_hashtab[HASHSZ] =3D {};
+	const struct dep_item *dep;
+	const char *p =3D prereqs;
+
+	for (dep =3D info->deps; dep; dep =3D dep->next)
+		in_hashtable(dep->name, strlen(dep->name),
+			     seen_prereqs_hashtab);
+
+	printf("make_prereqs_%s :=3D", target);
+
+	while (*p) {
+		const char *start;
+		int len;
+
+		while (*p =3D=3D ' ' || *p =3D=3D '\t')
+			p++;
+		if (!*p)
+			break;
+
+		start =3D p;
+		while (*p && *p !=3D ' ' && *p !=3D '\t')
+			p++;
+		len =3D p - start;
+
+		if (!in_hashtable(start, len, seen_prereqs_hashtab))
+			printf(" %.*s", len, start);
+	}
+
+	printf("\n\n");
+}
+
 int main(int argc, char *argv[])
 {
-	const char *depfile, *target, *cmdline;
+	const char *depfile, *target, *cmdline, *prereqs;
 	struct dep_info info;
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
 	buf =3D read_file(depfile);
 	info =3D parse_dep_file(buf);
=20
 	printf("savedcmd_%s :=3D %s\n\n", target, cmdline);
+	print_make_prereqs(target, prereqs, &info);
 	print_dep_file(target, &info);
=20
 	free_dep_info(&info);
--=20
2.43.0

