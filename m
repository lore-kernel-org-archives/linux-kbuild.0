Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121124;
	b=UX+OIuBc+u76rDWccm/O1wotAO4tH2zbZkkqTfRcz+PkaU3rtwQCfalQZNegU+CIOfnb
	 mAAa/y2ML8WYxbHbuBqFPmn29D2sqNfGtMR6ZK0l6V57kRdD5LOrYUeDtxM7ek6mQHO62
	 edxrYMv6mSnaYbWM9fOv7p6xgt622poG6ZhFXCHLXDI8sFwCRXoxN7mHpxDzm1d1mNPWU
	 8gXtEWqGgQYBQr7Wd8etIwkCNY1rlb2siTaJccJ13N/tD3GLrebLVw+5nU3waIneNGqmU
	 BtGbeXKUAU6pLVCF7giwrmJKE4PCMSLfqtLWnyDk6WWnaC9A2/G3ly8T/2nIE/d2img==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121124;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EdI2oVsvQC5OFdto8AriHpSCqCbKSvTZiieheT9HSLc=;
	b=EPYK4hsqRAt6GYU9/SX6biWIqQmrqhidopD8btrUfy8mAHReayvybx0lEYDs9rGS9BVz
	 ipg6jELdBUFZvdK/6H5qZyZOCrzj82sUAGowscbpgHpPKN0teiFwM8zGVwPRKt9s7FiZH
	 IkdLeMVN+OZaCaL5lJCbbbpI4qlY5Mlg8FWDm4KwcfNNicBwboXnIaOVMnxcSTaVxjsBg
	 xck3kjWxf+Z3TteZsRnPJCnRBu+RmAirE58sCB4i6lkS0t377PsF+CK71/Wjx7vPvgke5
	 +KRJeWuqHsApPpDz1ZRkeklCyosHG49mD/h0vNPjLQHRm66xMuB2Fe1UrVjTDnBWRow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Gb9rPiAd;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCB606BBBD;
	Thu, 19 Nov 2026 20:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BCB606BBBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=Gb9rPiAd
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id CEFF6404B0;
	Thu, 19 Nov 2026 21:45:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id C72FF1FB967;
	Thu, 19 Nov 2026 21:45:16 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id X4VO-1FMLjb1; Thu, 19 Nov 2026 21:45:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 17FC41FBD38;
	Thu, 19 Nov 2026 21:45:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 17FC41FBD38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795121116;
	bh=EdI2oVsvQC5OFdto8AriHpSCqCbKSvTZiieheT9HSLc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Gb9rPiAdY3O6nkzU4Etc1mX57QvS3FaDaKLeSDcDmBngfq41/zQm2vw74KrrtVp4z
	 NcQUJxQ0ubFguM79hHNTzCzK5/tYZIAUDRYfG9TOp3UTDW7MgCVozdZbXAJJwBPnjU
	 oG5QjLpOO/JPsuPc/5gbI5PnI27qHodlRTcKpysj7ByN8xeLWWfpkiY+2cQiOPQQGK
	 E7u4sYcHU2wjz1l3BsYAkeEzNGzp6THrkfRtT/JhlpnoLDw7CSt7mxjG344NSMQ9rW
	 SiAsuwQsaVJo5mqBBJ2BCfHhnaxnWECG11So1gm+N4a3C8RGB413dAaNKRVAy7WF1f
	 hMDlln4zCuLUA==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 50ChoyAgrRMu; Thu, 19 Nov 2026 21:45:16 +0100 (CET)
Received: from luis-Precision-5480.. (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 9ED261FB967;
	Thu, 19 Nov 2026 21:45:15 +0100 (CET)
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
Subject: [PATCH v6 2/7] kbuild: refactor fixdep to collect dependencies before printing
Date: Thu, 19 Nov 2026 21:44:48 +0100
Message-ID: <20261119204457.9968-3-luis.augenstein@tngtech.com>
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

fixdep currently writes the .cmd file content while parsing the .dep
file. Separate the parsing from the printing: parse_dep_file() now
collects the source file and all dependencies in a list, and
print_dep_file() emits the assignments afterwards. No functional
change intended.

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

