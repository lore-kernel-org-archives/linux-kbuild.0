Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD04F797D;
	Mon, 12 Oct 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840843; cv=none; b=AH/YdQfBkk9gFJkdhn+nacervFFYBQkhFgD3G6Biw6/fsbnn3zxhUV3wGes4yBsYDYhCPEU7ZLnQAZQ63VVdwoIsj6wg9eP3DCEMHaXMKSdqMwMqWUtR6JrJUMT/VRBLzN0F0jeN7FS4f/l+7UQ0iVLIZw3HF46lMNRICj02s0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840843; c=relaxed/simple;
	bh=u5J10brQ/bPzi+c3vvSNTdCGWx7NQd/PWQ9Tb/69tV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2Ju5DmFxv0iBjdzOqEjmNki93XQDQ8bp89Rl8zhDrHgQ6kI44MvRdvHyy3u/3g6ZtoyB06NaSr+aVbnPchtE4MMLl44ViOTqrNY5XpmyuR+rZ+DOj1YPKPfcjaMHpugN1y99G7p/PBpYFuJk8vloGFnmzlirGK07tz5B4sao0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=KI4fwdPN; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="KI4fwdPN"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id C6B5A4088A;
	Mon, 12 Oct 2026 23:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id BFA1A1F8B42;
	Mon, 12 Oct 2026 23:33:59 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id sdFOPfUWOQOl; Mon, 12 Oct 2026 23:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 0AA631F8B81;
	Mon, 12 Oct 2026 23:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 0AA631F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840839;
	bh=AK84/ve9NI+NDVm/3eQZFY5P2V549NgkAhrck6GVFMI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KI4fwdPNn4ntKWA1DSVeZ+Uu+yzGHuecHazSG7bSfySkDhCKcy9LV/xinjhi1JB+k
	 BGkadXcnOa5bljHapECnXMcAekF0yI6hYtUWI8UqlHj4bN0qOzh7gj3KiLFXte+PU+
	 BO8Qmqh3aoBF29teOYtdf3SJVwLiwHdh4L+cK15pJ7yEDajQK4ASoXjx4kkcoioXab
	 NfsWp7wFBoeBDqizZLNbAJIsV+wXd89JICiweZxTsak8n1VMPixbPJdG+sxTqDp2uw
	 0N/JZOdOsQTBxF6EYsLjN9S09rzVr36+UL8CPC6pNxLSSvoQRXz2X574xH0MdVXvxs
	 oncVVaYQyL8KA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id U6sfaPOwW1ZV; Mon, 12 Oct 2026 23:33:58 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A139D1F8B42;
	Mon, 12 Oct 2026 23:33:58 +0200 (CEST)
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
Subject: [PATCH v3 4/7] kbuild: record cmd-prereqs in .cmd files
Date: Mon, 12 Oct 2026 23:33:19 +0200
Message-ID: <20261012213337.2466524-5-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
References: <20261012213337.2466524-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
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

