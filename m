Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53680 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751047AbeGJHig (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 03:38:36 -0400
Date: Tue, 10 Jul 2018 09:38:33 +0200
From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCHv2 1/7] tools: build: Fixup host c flags
Message-ID: <20180710073833.GA7671@krava>
References: <20180710004602.21599-1-labbott@redhat.com>
 <20180710004602.21599-2-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710004602.21599-2-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>, Andi Kleen <andi@firstfloor.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>

On Mon, Jul 09, 2018 at 05:45:56PM -0700, Laura Abbott wrote:
> Commit 0c3b7e42616f ("tools build: Add support for host programs format")
> introduced host_c_flags which referenced CHOSTFLAGS. The actual name of the
> variable is HOSTCFLAGS. Fix this up.
> 
> Fixes: 0c3b7e42616f ("tools build: Add support for host programs format")
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Also fixed another instance in perf pmu-events.

Acked-by: Jiri Olsa <jolsa@kernel.org>

cc-ing more folks, that were in initial patch for heads up

thanks,
jirka


> ---
>  tools/build/Build.include   | 2 +-
>  tools/perf/pmu-events/Build | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/build/Build.include b/tools/build/Build.include
> index a4bbb984941d..b5c679cd441c 100644
> --- a/tools/build/Build.include
> +++ b/tools/build/Build.include
> @@ -98,4 +98,4 @@ cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXX
>  ###
>  ## HOSTCC C flags
>  
> -host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CHOSTFLAGS) -D"BUILD_STR(s)=\#s" $(CHOSTFLAGS_$(basetarget).o) $(CHOSTFLAGS_$(obj))
> +host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
> diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
> index 17783913d330..215ba30b8534 100644
> --- a/tools/perf/pmu-events/Build
> +++ b/tools/perf/pmu-events/Build
> @@ -1,7 +1,7 @@
>  hostprogs := jevents
>  
>  jevents-y	+= json.o jsmn.o jevents.o
> -CHOSTFLAGS_jevents.o	= -I$(srctree)/tools/include
> +HOSTCFLAGS_jevents.o	= -I$(srctree)/tools/include
>  pmu-events-y	+= pmu-events.o
>  JDIR		=  pmu-events/arch/$(SRCARCH)
>  JSON		=  $(shell [ -d $(JDIR) ] &&				\
> -- 
> 2.17.1
> 
