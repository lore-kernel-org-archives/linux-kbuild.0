Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:34847 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753591AbbGIPpd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jul 2015 11:45:33 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [GIT PULL 0/4] perf/urgent fixes
Date: Thu,  9 Jul 2015 12:45:17 -0300
Message-Id: <1436456721-9048-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Riku Voipio <riku.voipio@linaro.org>, Stephane Eranian <eranian@google.com>, Vinson Lee <vlee@twopensource.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling,

- Arnaldo

The following changes since commit ebf2d2689de551d90965090bb991fc640a0c0d41:

  perf/x86: Fix copy_from_user_nmi() return if range is not ok (2015-07-06 14:09:27 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-urgent-for-mingo

for you to fetch changes up to 08ae217b8d44986062fe3648c5bb83816d5bc00f:

  perf thread_map: Fix the sizeof() calculation for map entries (2015-07-09 12:28:53 -0300)

----------------------------------------------------------------
perf/urgent fixes:

User visible:

- Fix 'perf top -u username', where not enough memory per thread_map
  entry was being allocated nor was being initialized, causing a
  segfault (Arnaldo Carvalho de Melo)

- Fix locking lockup using 32-bit compat vdso (Adrian Hunter)

Developer stuff:

- Fix shadow declaration of close with older build environments (Jiri Olsa)

- Make the 'clean' target do a better job, removing some more
  temp files (Riku Voipio)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Adrian Hunter (1):
      perf tools: Fix lockup using 32-bit compat vdso

Arnaldo Carvalho de Melo (1):
      perf thread_map: Fix the sizeof() calculation for map entries

Jiri Olsa (1):
      perf stat: Fix shadow declaration of close

Riku Voipio (1):
      tools lib: Improve clean target

 tools/lib/api/Makefile        | 2 +-
 tools/lib/traceevent/Makefile | 2 +-
 tools/perf/builtin-stat.c     | 4 ++--
 tools/perf/util/thread_map.c  | 3 +--
 tools/perf/util/vdso.c        | 8 +++-----
 5 files changed, 8 insertions(+), 11 deletions(-)
