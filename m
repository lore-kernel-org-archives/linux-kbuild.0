Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121126;
	b=KP24zWsRfybc5hcgEFsBx3ZGz6itF8Q1hzwZNM7Avf6/x5X618s3GHoWh3vLT35yrEX2
	 5LWMQoniy6y48JVMTH9+Lol5pdkWSI3U843qSuviJuFMGmnb8Nh/SVRSvZPGfHJc3R+e+
	 cob2kKRaSgaNbDfGTUIoOp1H0xpcg+NVYI1NoITmPTIfeZnWGV3mRMWvw/nRE5FJAWOFg
	 JmVfcsYu49zIgQEDIo8BDbUbyPctIFTnE8pzU92w7XL3BpnoZGHmswh9xJ4istNsWtg0D
	 s5DXfd9tBB222aTbM33/daUBaUJV/RMYM/we6zHJVypSSqdKpN2QGjhj/V8Z+AKIB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121126;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SojWHi3hQqNmpuA6OMreHUJWXTPCOx5bqW2XYx0S/KE=;
	b=KwP5xt9YhIipIOZOEMpkufl8dnbTkcSOxUQBZgqQMD5wdDMzec7+MtFSVRXy+e5iPCB3
	 OlisntNJkOg9TucrPe8U9RUnxrLa1l+9lfHDlgnd10slK0X/JBFa0P9yb0pOWSM11B4qq
	 52yX8vWuPSMSg3nICzKfqP/7fqirRCHPeZC3kKFlJ5GGoirlh11cKGM3tBfxxa2pu/+kT
	 vVXCkNQ0ZI6PddbzYqAkOr3ju4bmvkKWmfbYHzukZkCir1Beqgqj0uIoHM7l8ABisO4wd
	 S4GplBCRsz0X5qSaVk5rWIKTc/krwWTz/wAxEfVYj/JfVNGD8aP9uFmEGurcUmGszbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=KrJycBnr;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291F7606CC78;
	Thu, 19 Nov 2026 20:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291F7606CC78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=KrJycBnr
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 95CEB40510;
	Thu, 19 Nov 2026 21:45:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 8DAE61FB967;
	Thu, 19 Nov 2026 21:45:19 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BqfK_oO3nmED; Thu, 19 Nov 2026 21:45:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C4D291FBD38;
	Thu, 19 Nov 2026 21:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz C4D291FBD38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795121118;
	bh=SojWHi3hQqNmpuA6OMreHUJWXTPCOx5bqW2XYx0S/KE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KrJycBnraAZevIvRtwxhVEbVXW3RXCVpixkFkemRoFlhxgmUSyrxYuL2Ehj+hVtur
	 Q5wF1xtAY+wPxqArQKC51U0/ROOqpDBrIFNo0c5IC5X9UdcYjDUKHJ2IRV4Zeb6DL2
	 uH3yyb7J2aBHo/ckJ2uKQDYCEiXVetzPL+jeqTqDMc9tLzLustVUo1j+Rxj+5E2eJL
	 q5vEmYnb9+o66SxhAdTXl0TnP4RcyitiVj9JuLH6GhdmofmaM4Rb9X2OGzAkWBwQsP
	 E9Fu2peGEzQKEfwWA/CBpyuojlwklgGXhQl55KuRY8BdC536fj/hyPsMz0TE6vg35x
	 wbg1AX+zaiXMw==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0GXh7ZrlAqJr; Thu, 19 Nov 2026 21:45:18 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 627B01FB967;
	Thu, 19 Nov 2026 21:45:18 +0100 (CET)
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
Subject: [PATCH v6 4/7] kbuild: record cmd-prereqs in .cmd files
Date: Thu, 19 Nov 2026 21:44:50 +0100
Message-ID: <20261119204457.9968-5-luis.augenstein@tngtech.com>
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
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/Kbuild.include | 10 ++++++--
 scripts/basic/fixdep.c | 54 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e2..94a0711b669 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -181,6 +181,9 @@ endif
 # (needed for the shell)
 make-cmd =3D $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(c=
md_$(1)))))
=20
+# prerequisites to record in .cmd files, excluding those covered in deps=
_*
+cmd-prereqs =3D $(call escsq,$(filter-out $(patsubst ./%,%,$(deps_$@)), =
$(real-prereqs)))
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

