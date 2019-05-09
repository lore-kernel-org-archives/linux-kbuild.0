Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43610 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbfEIOjS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 10:39:18 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH v4 10/10] livepatch/klp-convert: abort on special sections
Date: Thu,  9 May 2019 10:38:59 -0400
Message-Id: <20190509143859.9050-11-joe.lawrence@redhat.com>
In-Reply-To: <20190509143859.9050-1-joe.lawrence@redhat.com>
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org

To properly convert alternatives, paravirt ops, and static keys,
klp-convert needs to implement "klp.arch" sections as supported by
d4c3e6e1b193 (“livepatch/x86: apply alternatives and paravirt patches
after relocations”).

There is some amount of ELF section bookkeeping required for this (ie,
moving data structure entries and relocations to their ".klp.arch"
equivalents) but the hardest part will be determining klp_object
relationships.  This may require some larger changes to livepatch API,
so defer support for now.

Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 scripts/livepatch/klp-convert.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/livepatch/klp-convert.c b/scripts/livepatch/klp-convert.c
index 72b65428e738..b5873abecefb 100644
--- a/scripts/livepatch/klp-convert.c
+++ b/scripts/livepatch/klp-convert.c
@@ -617,6 +617,18 @@ static void free_converted_resources(struct elf *klp_elf)
 	}
 }
 
+/* Check for special sections that klp-convert doesn't support */
+static bool is_section_supported(char *sname)
+{
+	if (strcmp(sname, ".rela.altinstructions") == 0)
+		return false;
+	if (strcmp(sname, ".rela.parainstructions") == 0)
+		return false;
+	if (strcmp(sname, ".rela__jump_table") == 0)
+		return false;
+	return true;
+}
+
 int main(int argc, const char **argv)
 {
 	const char *klp_in_module, *klp_out_module, *symbols_list;
@@ -649,6 +661,12 @@ int main(int argc, const char **argv)
 	}
 
 	list_for_each_entry_safe(sec, aux, &klp_elf->sections, list) {
+		if (!is_section_supported(sec->name)) {
+			WARN("Special ELF section: %s not supported",
+				sec->name);
+			return -1;
+		}
+
 		if (!is_rela_section(sec) ||
 		    is_klp_rela_section(sec->name))
 			continue;
-- 
2.20.1
