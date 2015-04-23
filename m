Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59554 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752238AbbDWWDW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Apr 2015 18:03:22 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [GIT PULL 0/4] perf/urgent fixes
Date: Thu, 23 Apr 2015 19:03:06 -0300
Message-Id: <1429826590-32193-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Bobby Powers <bobbypowers@gmail.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Dirk Gouders <dirk@gouders.net>, Don Zickus <dzickus@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@redhat.com>, Joonsoo Kim <js1304@gmail.com>, linux-kbuild@vger.kernel.org, Michael Petlan <mpetlan@redhat.com>, Michal Marek <mmarek@suse.cz>, Minchan Kim <minchan@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Will Deacon <will.deacon@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling,

- Arnaldo

The following changes since commit 0140e6141e4f1d4b15fb469e6912b0e71b7d1cc2:

  perf/x86/intel/uncore: Move PCI IDs for IMC to uncore driver (2015-04-22 08:29:19 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-urgent-for-mingo

for you to fetch changes up to de28c15daf60e9625bece22f13a091fac8d05f1d:

  tools lib api: Undefine _FORTIFY_SOURCE before setting it (2015-04-23 17:08:23 -0300)

----------------------------------------------------------------
perf/urgent fixes:

User visible:

- Enable events when doing system wide 'trace' and starting a
  workload, e.g:

   # trace -a sleep 1

  now it matches the pattern in 'record' and will show envents
  instead of sitting doing nothing while waiting for the started
  workload to finish (Arnaldo Carvalho de Melo)

- Disable and drain events when forked 'trace' workload ends
  making sure we notice the end of the workload instead of
  trying to keep up with the seemingly neverending flux of
  system wide events (Arnaldo Carvalho de Melo)

Infrastructure:

- Fix the build on 32-bit ARM by consistently use PRIu64 for printing u64
  values in 'perf kmem' (Will Deacon)

- Undefine _FORTIFY_SOURCE before setting it in tools/perf/api, fixing the build on
  Hardened Gentoo systems (Bobby Powers)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Arnaldo Carvalho de Melo (2):
      perf trace: Enable events when doing system wide tracing and starting a workload
      perf trace: Disable events and drain events when forked workload ends

Bobby Powers (1):
      tools lib api: Undefine _FORTIFY_SOURCE before setting it

Will Deacon (1):
      perf kmem: Consistently use PRIu64 for printing u64 values

 tools/lib/api/Makefile     |  2 +-
 tools/perf/builtin-kmem.c  |  4 ++--
 tools/perf/builtin-trace.c | 10 ++++++++--
 3 files changed, 11 insertions(+), 5 deletions(-)
