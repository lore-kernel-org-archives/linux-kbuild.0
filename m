Received: from mailgw02.zimbra-vnc.de (mailgw02.zimbra-vnc.de [148.251.102.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F253644A6;
	Fri, 28 Aug 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.102.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907305; cv=none; b=NLNABefJsLdlvLkmUvDoyVbeR0YFBNhjby3gQDGWLFDyIoALb5885gBzHF6HUFi5FwLekn4JBMAyPnwNfBs+GIfepGVePkWMQfXZdgL1RmuiRke7NiCYwD8VWV50ylZa7GQiZR77+D+CRwMLeF5f4W5LH63UNcUI6HmpjXR7xA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907305; c=relaxed/simple;
	bh=vIZHJmoYitYFVtmoT6sQlytQ8TQmaEkO1SZXuCjCcfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3pWzjgYHhc1qmI/NhpQmc5f/iu56pK+3JEwD4N0C0t1b2sp6y7hkSas83xU0q4bjIHm+GgJyD0EWTbmp2K7FEFh+8IIYRJ0z7Fo0OheEg4dInBpQRW2lYrOhBIgewTpLyhnt0koO+AnxiXks91GaK40VkZ7SsOc0f9166e8mh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=KzZm8du2; arc=none smtp.client-ip=148.251.102.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="KzZm8du2"
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw02.zimbra-vnc.de (Postfix) with ESMTPS id 7E743200D0;
	Fri, 28 Aug 2026 10:54:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 3E0111FA2AE;
	Fri, 28 Aug 2026 10:54:55 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nyvZlJT6kl-s; Fri, 28 Aug 2026 10:54:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 3CD431FB5DD;
	Fri, 28 Aug 2026 10:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 3CD431FB5DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1787907294;
	bh=2xmJ6O9fkh2V1zs8qlhWYvUF/G/Ec67oNNd+oDZ3imE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KzZm8du2phce8BhRZkUOWXMaxq4BzZTntbrdmtj16nKH+WIUcXyABHyyiBylcxssQ
	 Bg3zQ6loNqKr7yfesSDMcwSXZWWDpNDkJNiRoxvN7I481t5uLuJHrxbCHDGJ3ax5m4
	 YqotpavxX4H7/2Fq0sm+YBmSxzeZFDoi2ONsS2K6s18c1aM/sOsi1MW7paUwvDbetA
	 cVHh1BufxFjp1HlGz2MwR+vze+GBsxdPLEWnQpUnZIoMnHEZjtML4URPg9XUF+Aa/i
	 eFGh7HgwHuDwB4j6Lyhww0ZlhYEFuyrZLMVr5qa22y1tbpcMIdFSufqNAXpTFkxFlj
	 DxbNTAihZd5RQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id SH0wSkK3C_lh; Fri, 28 Aug 2026 10:54:54 +0200 (CEST)
Received: from luis-Precision-5480.int.tngtech.com (unknown [193.30.133.7])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id C05B61FA2AE;
	Fri, 28 Aug 2026 10:54:53 +0200 (CEST)
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
Subject: [PATCH v2 1/1] kbuild: record real-prereqs in .cmd files
Date: Fri, 28 Aug 2026 10:54:41 +0200
Message-ID: <20260828085441.156386-2-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828085441.156386-1-luis.augenstein@tngtech.com>
References: <20260828085441.156386-1-luis.augenstein@tngtech.com>
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
 scripts/Kbuild.include                  |   9 +-
 scripts/basic/fixdep.c                  | 159 ++++++++++++++++++++----
 scripts/make_fit.py                     |   2 +-
 scripts/sbom/sbom/cmd_graph/cmd_file.py |   4 +
 4 files changed, 148 insertions(+), 26 deletions(-)

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
index cdd5da7e009..e644c1590a9 100644
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
@@ -114,6 +116,17 @@ struct item {
 	char		name[];
 };
=20
+struct dep_item {
+	struct dep_item	*next;
+	char		name[];
+};
+
+struct dep_info {
+	char			*source;
+	struct dep_item		*deps;
+	struct dep_item		*last_dep;
+};
+
 #define HASHSZ 256
 static struct item *config_hashtab[HASHSZ], *file_hashtab[HASHSZ];
=20
@@ -163,16 +176,42 @@ static bool in_hashtable(const char *name, int len,=
 struct item *hashtab[])
 	return false;
 }
=20
+/*
+ * Append a dependency or include/config/<SYM> path to the info linked l=
ist.
+ */
+static void dep_info_add(struct dep_info *info, const char *name, int le=
n)
+{
+	struct dep_item *dep =3D xmalloc(sizeof(*dep) + len + 1);
+
+	memcpy(dep->name, name, len);
+	dep->name[len] =3D '\0';
+	dep->next =3D NULL;
+
+	if (info->last_dep)
+		info->last_dep->next =3D dep;
+	else
+		info->deps =3D dep;
+	info->last_dep =3D dep;
+}
+
 /*
  * Record the use of a CONFIG_* word.
  */
-static void use_config(const char *m, int slen)
+static void use_config(const char *m, int slen, struct dep_info *info)
 {
 	if (in_hashtable(m, slen, config_hashtab))
 		return;
=20
-	/* Print out a dependency path from a symbol name. */
-	printf("    $(wildcard include/config/%.*s) \\\n", slen, m);
+	/* Build a dependency path from a symbol name. */
+	static const char config_path[] =3D "include/config/";
+	char *path;
+	int path_len =3D sizeof(config_path) - 1 + slen;
+
+	path =3D xmalloc(path_len);
+	memcpy(path, config_path, sizeof(config_path) - 1);
+	memcpy(path + sizeof(config_path) - 1, m, slen);
+	dep_info_add(info, path, path_len);
+	free(path);
 }
=20
 /* test if s ends in sub */
@@ -186,7 +225,12 @@ static int str_ends_with(const char *s, int slen, co=
nst char *sub)
 	return !memcmp(s + slen - sublen, sub, sublen);
 }
=20
-static void parse_config_file(const char *p)
+/*
+ * Scan dependency p for CONFIG_ words, map each to an
+ * include/config/ path and append to the dep_info list if not
+ * already included.
+ */
+static void parse_config_file(const char *p, struct dep_info *info)
 {
 	const char *q, *r;
 	const char *start =3D p;
@@ -205,7 +249,7 @@ static void parse_config_file(const char *p)
 		else
 			r =3D q;
 		if (r > p)
-			use_config(p, r - p);
+			use_config(p, r - p, info);
 		p =3D q;
 	}
 }
@@ -253,13 +297,9 @@ static int is_no_parse_file(const char *s, int len)
 	       str_ends_with(s, len, ".so");
 }
=20
-/*
- * Important: The below generated source_foo.o and deps_foo.o variable
- * assignments are parsed not only by make, but also by the rather simpl=
e
- * parser in scripts/mod/sumversion.c.
- */
-static void parse_dep_file(char *p, const char *target)
+static struct dep_info parse_dep_file(char *p)
 {
+	struct dep_info info =3D {};
 	bool saw_any_target =3D false;
 	bool is_target =3D true;
 	bool is_source =3D false;
@@ -375,13 +415,12 @@ static void parse_dep_file(char *p, const char *tar=
get)
 			 */
 			if (!saw_any_target) {
 				saw_any_target =3D true;
-				printf("source_%s :=3D %s\n\n", target, p);
-				printf("deps_%s :=3D \\\n", target);
+				info.source =3D xstrdup(p);
 				need_parse =3D true;
 			}
 		} else if (!is_ignored_file(p, q - p) &&
 			   !in_hashtable(p, q - p, file_hashtab)) {
-			printf("  %s \\\n", p);
+			dep_info_add(&info, p, q - p);
 			need_parse =3D true;
 		}
=20
@@ -389,7 +428,7 @@ static void parse_dep_file(char *p, const char *targe=
t)
 			void *buf;
=20
 			buf =3D read_file(p);
-			parse_config_file(buf);
+			parse_config_file(buf, &info);
 			free(buf);
 		}
=20
@@ -403,26 +442,100 @@ static void parse_dep_file(char *p, const char *ta=
rget)
 		exit(1);
 	}
=20
+	return info;
+}
+
+static void free_dep_info(struct dep_info *info)
+{
+	struct dep_item *dep, *next;
+
+	for (dep =3D info->deps; dep; dep =3D next) {
+		next =3D dep->next;
+		free(dep);
+	}
+	free(info->source);
+}
+
+/*
+ * Important: The below generated source_foo.o and deps_foo.o variable
+ * assignments are parsed not only by make, but also by the rather simpl=
e
+ * parser in scripts/mod/sumversion.c.
+ */
+static void print_dep_file(const char *target, const struct dep_info *in=
fo)
+{
+	static const char config_path[] =3D "include/config/";
+	const struct dep_item *dep;
+
+	printf("source_%s :=3D %s\n\n", target, info->source);
+	printf("deps_%s :=3D \\\n", target);
+
+	for (dep =3D info->deps; dep; dep =3D dep->next) {
+		if (!strncmp(dep->name, config_path, sizeof(config_path) - 1))
+			printf("    $(wildcard %s) \\\n", dep->name);
+		else
+			printf("  %s \\\n", dep->name);
+	}
+
 	printf("\n%s: $(deps_%s)\n\n", target, target);
 	printf("$(deps_%s):\n", target);
 }
=20
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
+	struct dep_info info;
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
+
+	buf =3D read_file(depfile);
+	info =3D parse_dep_file(buf);
=20
 	printf("savedcmd_%s :=3D %s\n\n", target, cmdline);
+	print_make_prereqs(target, prereqs, &info);
+	print_dep_file(target, &info);
=20
-	buf =3D read_file(depfile);
-	parse_dep_file(buf, target);
+	free_dep_info(&info);
 	free(buf);
=20
 	fflush(stdout);
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

