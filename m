Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59594 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752459AbeGAQLC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Jul 2018 12:11:02 -0400
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.18 01/85] tools build: No need to make libapi for perf explicitly
Date: Sun,  1 Jul 2018 18:01:19 +0200
Message-Id: <20180701153122.425960620@linuxfoundation.org>
In-Reply-To: <20180701153122.365061142@linuxfoundation.org>
References: <20180701153122.365061142@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, Guenter Roeck <linux@roeck-us.net>

3.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Olsa <jolsa@kernel.org>

commit 379a9a28a1b4364ab08fec35c84d39cf4995c509 upstream.

The perf build handles its dependencies by itself.

Also renaming libapi libapikfs to libapi as it got
changed just recently.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Ahern <dsahern@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/r/1429389280-18720-2-git-send-email-jolsa@kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 tools/Makefile |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/tools/Makefile
+++ b/tools/Makefile
@@ -51,10 +51,10 @@ cgroup firewire hv guest usb virtio vm n
 liblockdep: FORCE
 	$(call descend,lib/lockdep)
 
-libapikfs: FORCE
+libapi: FORCE
 	$(call descend,lib/api)
 
-perf: libapikfs FORCE
+perf: FORCE
 	$(call descend,$@)
 
 selftests: FORCE
@@ -106,10 +106,10 @@ cgroup_clean hv_clean firewire_clean lgu
 liblockdep_clean:
 	$(call descend,lib/lockdep,clean)
 
-libapikfs_clean:
+libapi_clean:
 	$(call descend,lib/api,clean)
 
-perf_clean: libapikfs_clean
+perf_clean:
 	$(call descend,$(@:_clean=),clean)
 
 selftests_clean:


