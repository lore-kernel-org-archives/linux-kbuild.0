Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2B4F30CB;
	Mon, 12 Oct 2026 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.107.87.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840839; cv=none; b=Xg3GU1vZ6uTSK7QovVSBAsNXJRPytZUPeqytxRbMHmJ4NcKH+X4JHx1qvkiOZfiDaZWIb9deAtEBnUmwk8eltjfuNXB4Wb8GTl9EKsZynLY64SBQkSdVDbMHqgfnj8n7d97ZMRzQtUxXLPk7gg3ZhcTMBGzpU1DTNGmdC8kMrt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840839; c=relaxed/simple;
	bh=t9ujy6FbkJFTCuXoGVZRzzUH0lkso/kA265f+uheY+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dfw7gnSfuA+W49st1OzhQ+7WIFtj2MhqGDEJBP0Ybv1Ywkj7+Mc3C0ngW2OzZWKf2rrgrr4EII6mVCsU2okMKR7EopZf8LVqIgXWzyZP61eHh/Gbghsnqk6iB0Ko/GPT6aWCow7JKxk2uUuKIeDUjOLKaIsIK7n6+YJABE5NERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=JRX0OlGY; arc=none smtp.client-ip=34.107.87.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="JRX0OlGY"
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 548034088A;
	Mon, 12 Oct 2026 23:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 4CFE71F8B42;
	Mon, 12 Oct 2026 23:33:56 +0200 (CEST)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id cKgnukaJ-0gY; Mon, 12 Oct 2026 23:33:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id A65111F8B81;
	Mon, 12 Oct 2026 23:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz A65111F8B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1791840835;
	bh=OUNLO4fz787Jyp8M2xnPIWG7D3uZ70V+ftYCxOJ5Ch4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JRX0OlGY1zP7aCQh1VjjOWcvztAURIJSadeBZZFsW5ZsURWqvNXiANJve9iySTVk1
	 g/Ghu5I8kVzCLxiJNwL0qSGtll2G1kEa5kt9cl03P90BTBlC7/ZCDQGUSq/djYNsoy
	 wN/9SWriWrbLAhoblW5C9YeJmC4ugqE4utvI5NKd3ku+a78Xy6h3ZT60ZoxIpGUcuY
	 BkDkyexbzeIYmiJEZeOke8cyhNAogx0PrPKWWkMkbO1sL6ABuYTh8QrxIQ2ITr93ql
	 Ef6lyDYQ32Q8Cn5HmdkqiAsAiZQYlz5y3xWLIlTy1b6c4abD5b4LNGCwSIqyQKvRCK
	 l5JsMYuHb44uA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id YzlmB9-f097l; Mon, 12 Oct 2026 23:33:55 +0200 (CEST)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 419E21F8B42;
	Mon, 12 Oct 2026 23:33:55 +0200 (CEST)
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
Subject: [PATCH v3 2/7] kbuild: refactor fixdep to collect dependencies before printing
Date: Mon, 12 Oct 2026 23:33:17 +0200
Message-ID: <20261012213337.2466524-3-luis.augenstein@tngtech.com>
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

fixdep currently writes the .cmd file content while parsing the .dep
file. Separate the parsing from the printing: parse_dep_file() now
collects the source file and all dependencies in a list, and
print_dep_file() emits the assignments afterwards. No functional
change intended.

Assisted-by: LLM
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/basic/fixdep.c | 109 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 17 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 54063d98044..f514ef606ec 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -114,6 +114,17 @@ struct item {
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
@@ -163,16 +174,42 @@ static bool in_hashtable(const char *name, int len,=
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
@@ -186,7 +223,12 @@ static int str_ends_with(const char *s, int slen, co=
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
@@ -205,7 +247,7 @@ static void parse_config_file(const char *p)
 		else
 			r =3D q;
 		if (r > p)
-			use_config(p, r - p);
+			use_config(p, r - p, info);
 		p =3D q;
 	}
 }
@@ -253,13 +295,9 @@ static int is_no_parse_file(const char *s, int len)
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
@@ -375,13 +413,12 @@ static void parse_dep_file(char *p, const char *tar=
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
@@ -389,7 +426,7 @@ static void parse_dep_file(char *p, const char *targe=
t)
 			void *buf;
=20
 			buf =3D read_file(p);
-			parse_config_file(buf);
+			parse_config_file(buf, &info);
 			free(buf);
 		}
=20
@@ -403,6 +440,40 @@ static void parse_dep_file(char *p, const char *targ=
et)
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
@@ -410,6 +481,7 @@ static void parse_dep_file(char *p, const char *targe=
t)
 int main(int argc, char *argv[])
 {
 	const char *depfile, *target, *cmdline;
+	struct dep_info info;
 	void *buf;
=20
 	if (argc !=3D 4)
@@ -419,10 +491,13 @@ int main(int argc, char *argv[])
 	target =3D argv[2];
 	cmdline =3D argv[3];
=20
+	buf =3D read_file(depfile);
+	info =3D parse_dep_file(buf);
+
 	printf("savedcmd_%s :=3D %s\n\n", target, cmdline);
+	print_dep_file(target, &info);
=20
-	buf =3D read_file(depfile);
-	parse_dep_file(buf, target);
+	free_dep_info(&info);
 	free(buf);
=20
 	fflush(stdout);
--=20
2.43.0

