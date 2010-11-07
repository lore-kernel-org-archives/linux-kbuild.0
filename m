Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:46941 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab0KGQtD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Nov 2010 11:49:03 -0500
From: Ben Gamari <bgamari.foss@gmail.com>
Subject: [PATCH] Debug fixdep
Date: Sun,  7 Nov 2010 11:48:53 -0500
Message-Id: <1289148533-15106-1-git-send-email-bgamari.foss@gmail.com>
In-Reply-To: <87tyjtjd7m.fsf@gmail.com>
References: <87tyjtjd7m.fsf@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: xiyou.wangcong@gmail.com, Christoph Egger <siccegge@cs.fau.de>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>
Cc: Ben Gamari <bgamari.foss@gmail.com>

---
 scripts/basic/fixdep.c |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index ea26b23..f1b58d6 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -303,6 +303,9 @@ static void parse_dep_file(void *map, size_t len)
 	char *p;
 	char s[PATH_MAX];
 
+        fprintf(stderr, "map=%p, len=%zx\n", map, len);
+        fprintf(stderr, "m=%p, end=%p\n", m, end);
+        fprintf(stderr, "eh?=%zx\n", (size_t)end - (size_t)len);
 	p = strchr(m, ':');
 	if (!p) {
 		fprintf(stderr, "fixdep: parse error\n");
@@ -314,16 +317,23 @@ static void parse_dep_file(void *map, size_t len)
 
 	clear_config();
 
+        fprintf(stderr, "map=%p, len=%zx, end=%p\n", map, len, end);
 	while (m < end) {
-		while (m < end && (*m == ' ' || *m == '\\' || *m == '\n'))
+		while (m <= end && (*m == ' ' || *m == '\\' || *m == '\n')) {
+                        fprintf(stderr, "m=%p\n", m);
 			m++;
+                }
 		p = m;
-		while (p < end && *p != ' ') p++;
+                fprintf(stderr, "A: p=%p, end=%p, str=%s\n", p, end, p);
+		while (p <= end && *p != ' ') p++;
+                fprintf(stderr, "B: p=%p, end=%p\n", p, end);
 		if (p == end) {
 			do p--; while (!isalnum(*p));
+                        fprintf(stderr, "c%c ", *p);
 			p++;
 		}
 		memcpy(s, m, p-m); s[p-m] = 0;
+                fprintf(stderr, "C: p=%p, s=%s\n", p, s);
 		if (strrcmp(s, "include/generated/autoconf.h") &&
 		    strrcmp(s, "arch/um/include/uml-config.h") &&
 		    strrcmp(s, ".ver")) {
@@ -342,6 +352,7 @@ static void print_deps(void)
 	int fd;
 	void *map;
 
+        fprintf(stderr, "file=%s\n", depfile);
 	fd = open(depfile, O_RDONLY);
 	if (fd < 0) {
 		fprintf(stderr, "fixdep: ");
@@ -354,6 +365,7 @@ static void print_deps(void)
 		close(fd);
 		return;
 	}
+        fprintf(stderr, "st.size=%zx\n", st.st_size);
 	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
 	if ((long) map == -1) {
 		perror("fixdep: mmap");
-- 
1.7.0.4

