Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:53495 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030875AbbDXQFs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 12:05:48 -0400
Date: Fri, 24 Apr 2015 17:05:40 +0100
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [GIT PULL 0/4] perf/urgent fixes
Message-ID: <20150424160540.GB7313@arm.com>
References: <1429826590-32193-1-git-send-email-acme@kernel.org>
 <20150424020218.GF1905@sejong>
 <20150424085918.GA3115@e104805>
 <20150424160217.GD650@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150424160217.GD650@kernel.org>
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Javi Merino <Javi.Merino@arm.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Bobby Powers <bobbypowers@gmail.com>, Borislav Petkov <bp@suse.de>, David Ahern <dsahern@gmail.com>, Dirk Gouders <dirk@gouders.net>, Don Zickus <dzickus@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@redhat.com>, Joonsoo Kim <js1304@gmail.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michael Petlan <mpetlan@redhat.com>, Michal Marek <mmarek@suse.cz>, Minchan Kim <minchan@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Stephane Eranian <eranian@google.com>, Steven Rostedt <rostedt@goodmis.org>

On Fri, Apr 24, 2015 at 05:02:17PM +0100, Arnaldo Carvalho de Melo wrote:
> Em Fri, Apr 24, 2015 at 09:59:18AM +0100, Javi Merino escreveu:
> > On Fri, Apr 24, 2015 at 03:02:18AM +0100, Namhyung Kim wrote:
> > > Hi Arnaldo,
> > > 
> > > I've set up some docker containers for build test, and found a couple
> > > of failures..  It seems David's kmem build fix ("perf kmem: Fix
> > > compiles on RHEL6/OL6") which is in your perf/core branch also needs
> > > to be in perf/urgent.  Sorry about the kmem breakages..
> > > 
> > > And I also found this..
> 
> Applied both, some more?

The only issue remaining for arm/arm64 is the /proc/cpuinfo parsing, which
ends up with us passing -jN to Make, where N is 5 or 6 times the number of
CPUs in the system.

  http://permalink.gmane.org/gmane.linux.kernel/1936575

Will
