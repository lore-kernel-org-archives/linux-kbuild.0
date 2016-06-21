Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54074 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751790AbcFUQOS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Jun 2016 12:14:18 -0400
Date: Tue, 21 Jun 2016 13:14:15 -0300
From: Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [GIT PULL 00/10] perf/core improvements and fixes
Message-ID: <20160621161415.GA2797@redhat.com>
References: <1466461410-13778-1-git-send-email-acme@kernel.org>
 <20160621021820.GA14105@danjae.aot.lge.com>
 <CAJN39oiGpcfx85xpzCX7hB+4a+wWtNZLxLBs9Mmr8QgDPP=q7w@mail.gmail.com>
 <2c189c43-81e8-4052-c62c-3b548b3eb32a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c189c43-81e8-4052-c62c-3b548b3eb32a@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Brendan Gregg <bgregg@netflix.com>, Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>, Andi Kleen <ak@linux.intel.com>, David Ahern <dsahern@gmail.com>, Ekaterina Tumanova <tumanova@linux.vnet.ibm.com>, He Kuang <hekuang@huawei.com>, Jean Delvare <jdelvare@suse.de>, Jiri Olsa <jolsa@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Kan Liang <kan.liang@intel.com>, linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Michal Marek <mmarek@suse.com>, Pekka Enberg <penberg@kernel.org>, Peter Zijlstra <peterz@infradead.org>, pi3orama@163.com, Stephane Eranian <eranian@google.com>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, Zefan Li <lizefan@huawei.com>

Em Tue, Jun 21, 2016 at 12:08:47PM +0200, Paolo Bonzini escreveu:
> On 21/06/2016 05:11, Brendan Gregg wrote:
> >>> > > - Add stackcollapse.py script to help generating flame graphs (Paolo Bonzini)
> >> >
> >> > I think this is already done by '-g folded'.  Please see:
> >> >
> >> >   http://www.brendangregg.com/blog/2016-04-30/linux-perf-folded.html
> >> >
> > Pretty much. Two similar solutions were developed around the same
> > time. Although I have to use some awk to get "perf -g folded" in the
> > exact right format, and stackcollapse-perf.py does that directly.
> 
> Yes, the idea for stackcollapse-perf.py was:
> 
> - to do everything directly and emit "the right" format for the
> flamegraph tools.  This however is a very minimal output, and it's not
> necessarily the best for perf in general.
> 
> - to provide an example of visiting callgraphs from the scripting
> interface, since it's not really documented.  From the commit message:
> "Add stackcollapse.py script as an example of parsing call chains, and
> also of using optparse to access command line options".

Yeah, agreed, its short, and it provides the output ready to be used, no
need for extra processing, up to the user to decide if one or the other
is more suitable to their needs.

As a bonus, it documents callgraphs in scripts, good deal :-)

- Arnaldo
