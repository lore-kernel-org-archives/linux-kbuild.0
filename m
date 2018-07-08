Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36182 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932757AbeGHK7w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 06:59:52 -0400
Date: Sun, 8 Jul 2018 12:59:48 +0200
From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH 1/7] tools: build: Fixup host c flags
Message-ID: <20180708105948.GB29861@krava>
References: <20180707010709.16648-1-labbott@redhat.com>
 <20180707010709.16648-2-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180707010709.16648-2-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

On Fri, Jul 06, 2018 at 06:07:03PM -0700, Laura Abbott wrote:
> Commit 0c3b7e42616f ("tools build: Add support for host programs format")
> introduced host_c_flags which referenced CHOSTFLAGS. The actual name of the
> variable is HOSTCFLAGS. Fix this up.
> 
> Fixes: 0c3b7e42616f ("tools build: Add support for host programs format")
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> This seemed like a typo to the best of my understanding and certain
> things wouldn't link properly until this was fixed.

ugh, thanks for finding this.. I think/hope it's typo ;-)

please also change the only perf user of this:

tools/perf/pmu-events/Build:CHOSTFLAGS_jevents.o   = -I$(srctree)/tools/include

jirka

> ---
>  tools/build/Build.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
> -- 
> 2.17.1
> 
