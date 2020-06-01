Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39992 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 21/37] modpost: drop RCS/CVS $Revision handling in MODULE_VERSION()
Date: Mon,  1 Jun 2020 14:57:15 +0900
Message-Id: <20200601055731.3006266-21-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

As far as I understood, this code gets rid of '$Revision$' or '$Revision:'
of CVS, RCS or whatever in MODULE_VERSION() tags.

Remove the primeval code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    |  3 --
 scripts/mod/modpost.h    |  4 ---
 scripts/mod/sumversion.c | 66 ----------------------------------------
 3 files changed, 73 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3df26789c2e6..fbb3d3391e52 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2066,9 +2066,6 @@ static void read_symbols(const char *modname)
 		check_sec_ref(mod, modname, &info);
 
 	version = get_modinfo(&info, "version");
-	if (version)
-		maybe_frob_rcs_version(modname, version, info.modinfo,
-				       version - (char *)info.hdr);
 	if (version || (all_versions && !is_vmlinux(modname)))
 		get_src_version(modname, mod->srcversion,
 				sizeof(mod->srcversion)-1);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index b8b7a82d2ff7..f728e250b8d2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -188,10 +188,6 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 void add_moddevtable(struct buffer *buf, struct module *mod);
 
 /* sumversion.c */
-void maybe_frob_rcs_version(const char *modfilename,
-			    char *version,
-			    void *modinfo,
-			    unsigned long modinfo_offset);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 63062024ce0e..f27f22420cbc 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -429,69 +429,3 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 release:
 	release_file(file, len);
 }
-
-static void write_version(const char *filename, const char *sum,
-			  unsigned long offset)
-{
-	int fd;
-
-	fd = open(filename, O_RDWR);
-	if (fd < 0) {
-		warn("changing sum in %s failed: %s\n",
-			filename, strerror(errno));
-		return;
-	}
-
-	if (lseek(fd, offset, SEEK_SET) == (off_t)-1) {
-		warn("changing sum in %s:%lu failed: %s\n",
-			filename, offset, strerror(errno));
-		goto out;
-	}
-
-	if (write(fd, sum, strlen(sum)+1) != strlen(sum)+1) {
-		warn("writing sum in %s failed: %s\n",
-			filename, strerror(errno));
-		goto out;
-	}
-out:
-	close(fd);
-}
-
-static int strip_rcs_crap(char *version)
-{
-	unsigned int len, full_len;
-
-	if (strncmp(version, "$Revision", strlen("$Revision")) != 0)
-		return 0;
-
-	/* Space for version string follows. */
-	full_len = strlen(version) + strlen(version + strlen(version) + 1) + 2;
-
-	/* Move string to start with version number: prefix will be
-	 * $Revision$ or $Revision: */
-	len = strlen("$Revision");
-	if (version[len] == ':' || version[len] == '$')
-		len++;
-	while (isspace(version[len]))
-		len++;
-	memmove(version, version+len, full_len-len);
-	full_len -= len;
-
-	/* Preserve up to next whitespace. */
-	len = 0;
-	while (version[len] && !isspace(version[len]))
-		len++;
-	memmove(version + len, version + strlen(version),
-		full_len - strlen(version));
-	return 1;
-}
-
-/* Clean up RCS-style version numbers. */
-void maybe_frob_rcs_version(const char *modfilename,
-			    char *version,
-			    void *modinfo,
-			    unsigned long version_offset)
-{
-	if (strip_rcs_crap(version))
-		write_version(modfilename, version, version_offset);
-}
-- 
2.25.1
