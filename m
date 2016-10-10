Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0047.hostedemail.com ([216.40.44.47]:38229 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751392AbcJJNl0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2016 09:41:26 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 0942311A1E0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2016 13:32:01 +0000 (UTC)
Message-ID: <1476106315.2856.24.camel@perches.com>
Subject: Re: [PATCH] kbuild: honor '-s' option for tools/*
From: Joe Perches <joe@perches.com>
Date: Mon, 10 Oct 2016 06:31:55 -0700
In-Reply-To: <20161010123812.1425903-1-arnd@arndb.de>
References: <20161010123812.1425903-1-arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2016-10-10 at 14:36 +0200, Arnd Bergmann wrote:
> This changes all three of the above to behave just like Kbuild does,
> and print no output with 'make -s' regardless of the version of that
> tool, but otherwise behaves as before. In case of
> tools/scripts/Makefile.include, I decided to use an identical
> conditional block to set the $(quiet) variable for consistency,
> even though it is not used in the same way.

trivial notes:

> diff --git a/Makefile b/Makefile
[]
> @@ -1612,11 +1612,12 @@ image_name:
>  # Clear a bunch of variables before executing the submake
>  tools/: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
> -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
> +	echo MAKEFLAGS=\""$(MAKEFLAGS)"\"
> +	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(findstring s,$(firstword -$(MAKEFLAGS))) $(filter --j% -j -s,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/

Perhaps this is complicated enough to warrant some additional comments.

> diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
[]
> @@ -19,6 +19,16 @@ else
>    Q=@
>  endif
>  
> +ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
> +ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
> +  quiet=silent_
> +endif
> +else					# make-3.8x
> +ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
> +  quiet=silent_
> +endif
> +endif

And perhaps the tests should be reversed for make version 3 so when
make version 5 comes out and it likely has the same behavior as
version 4, this doesn't need rewrite.

