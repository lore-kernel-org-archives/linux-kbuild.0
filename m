Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:12391 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934428AbbDXI7X convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 04:59:23 -0400
Date: Fri, 24 Apr 2015 09:59:18 +0100
From: Javi Merino <javi.merino@arm.com>
Subject: Re: [GIT PULL 0/4] perf/urgent fixes
Message-ID: <20150424085918.GA3115@e104805>
References: <1429826590-32193-1-git-send-email-acme@kernel.org>
 <20150424020218.GF1905@sejong>
MIME-Version: 1.0
In-Reply-To: <20150424020218.GF1905@sejong>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Bobby Powers <bobbypowers@gmail.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Dirk Gouders <dirk@gouders.net>, Don Zickus <dzickus@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@redhat.com>, Joonsoo Kim <js1304@gmail.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michael Petlan <mpetlan@redhat.com>, Michal Marek <mmarek@suse.cz>, Minchan Kim <minchan@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Will Deacon <Will.Deacon@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Steven Rostedt <rostedt@goodmis.org>

On Fri, Apr 24, 2015 at 03:02:18AM +0100, Namhyung Kim wrote:
> Hi Arnaldo,
> 
> I've set up some docker containers for build test, and found a couple
> of failures..  It seems David's kmem build fix ("perf kmem: Fix
> compiles on RHEL6/OL6") which is in your perf/core branch also needs
> to be in perf/urgent.  Sorry about the kmem breakages..
> 
> And I also found this..
> 
> 
> From 581ae7f48c89377755391c3f95637a1d48eefc73 Mon Sep 17 00:00:00 2001
> From: Namhyung Kim <namhyung@kernel.org>
> Date: Fri, 24 Apr 2015 10:45:16 +0900
> Subject: [PATCH] tools lib traceevent: Fix build failure on 32-bit arch
> 
> In my i386 build, it failed like this:
> 
>     CC       event-parse.o
>   event-parse.c: In function 'print_str_arg':
>   event-parse.c:3868:5: warning: format '%lu' expects argument of type 'long unsigned int',
>                         but argument 3 has type 'uint64_t' [-Wformat]
> 
> Cc: Javi Merino <javi.merino@arm.com>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/lib/traceevent/event-parse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/traceevent/event-parse.c b/tools/lib/traceevent/event-parse.c
> index 12a7e2a40c89..aa21bd55bd8a 100644
> --- a/tools/lib/traceevent/event-parse.c
> +++ b/tools/lib/traceevent/event-parse.c
> @@ -3865,7 +3865,7 @@ static void print_str_arg(struct trace_seq *s, void *data, int size,
>  			} else if (el_size == 4) {
>  				trace_seq_printf(s, "%u", *(uint32_t *)num);
>  			} else if (el_size == 8) {
> -				trace_seq_printf(s, "%lu", *(uint64_t *)num);
> +				trace_seq_printf(s, "%"PRIu64, *(uint64_t *)num);

Didn't know about PRIu64 and friends.  FWIW,

Acked-by: Javi Merino <javi.merino@arm.com>

While you are at it, you could also fix the previous "%u" to "%"PRIu32

>  			} else {
>  				trace_seq_printf(s, "BAD SIZE:%d 0x%x",
>  						 el_size, *(uint8_t *)num);
> -- 
> 2.3.4
> 
> 
> Thanks,
> Namhyung
> 
> 
> On Thu, Apr 23, 2015 at 07:03:06PM -0300, Arnaldo Carvalho de Melo wrote:
> > Hi Ingo,
> > 
> > 	Please consider pulling,
> > 
> > - Arnaldo
> > 
> > The following changes since commit 0140e6141e4f1d4b15fb469e6912b0e71b7d1cc2:
> > 
> >   perf/x86/intel/uncore: Move PCI IDs for IMC to uncore driver (2015-04-22 08:29:19 +0200)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-urgent-for-mingo
> > 
> > for you to fetch changes up to de28c15daf60e9625bece22f13a091fac8d05f1d:
> > 
> >   tools lib api: Undefine _FORTIFY_SOURCE before setting it (2015-04-23 17:08:23 -0300)
> > 
> > ----------------------------------------------------------------
> > perf/urgent fixes:
> > 
> > User visible:
> > 
> > - Enable events when doing system wide 'trace' and starting a
> >   workload, e.g:
> > 
> >    # trace -a sleep 1
> > 
> >   now it matches the pattern in 'record' and will show envents
> >   instead of sitting doing nothing while waiting for the started
> >   workload to finish (Arnaldo Carvalho de Melo)
> > 
> > - Disable and drain events when forked 'trace' workload ends
> >   making sure we notice the end of the workload instead of
> >   trying to keep up with the seemingly neverending flux of
> >   system wide events (Arnaldo Carvalho de Melo)
> > 
> > Infrastructure:
> > 
> > - Fix the build on 32-bit ARM by consistently use PRIu64 for printing u64
> >   values in 'perf kmem' (Will Deacon)
> > 
> > - Undefine _FORTIFY_SOURCE before setting it in tools/perf/api, fixing the build on
> >   Hardened Gentoo systems (Bobby Powers)
> > 
> > Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > 
> > ----------------------------------------------------------------
> > Arnaldo Carvalho de Melo (2):
> >       perf trace: Enable events when doing system wide tracing and starting a workload
> >       perf trace: Disable events and drain events when forked workload ends
> > 
> > Bobby Powers (1):
> >       tools lib api: Undefine _FORTIFY_SOURCE before setting it
> > 
> > Will Deacon (1):
> >       perf kmem: Consistently use PRIu64 for printing u64 values
> > 
> >  tools/lib/api/Makefile     |  2 +-
> >  tools/perf/builtin-kmem.c  |  4 ++--
> >  tools/perf/builtin-trace.c | 10 ++++++++--
> >  3 files changed, 11 insertions(+), 5 deletions(-)
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > Please read the FAQ at  http://www.tux.org/lkml/
> 

