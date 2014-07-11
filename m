Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55880 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932113AbaGKNqq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2014 09:46:46 -0400
Message-ID: <53BFEAC4.9040407@suse.cz>
Date: Fri, 11 Jul 2014 15:46:44 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/5] kbuild: clean-up and bug fix of scripts/Makefile.host
References: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com> <1402287394-31133-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402287394-31133-6-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On 2014-06-09 06:16, Masahiro Yamada wrote:
> -# hostprogs-y := tools/build may have been specified. Retrieve directory
> -host-objdirs := $(dir $(__hostprogs))
> -# directory of .o files from prog-objs notation
> -host-objdirs += $(dir $(foreach f,$(host-cmulti), $($(f)-objs)))
> -# directory of .o files from prog-cxxobjs notation
> -host-objdirs += $(dir $(foreach f,$(host-cxxmulti), $($(f)-cxxobjs)))
> +# hostprogs-y := tools/build may have been specified.
> +# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
> +host-objdirs := $(dir \
> +	     $(foreach f, $(__hostprogs), $(f) $($(f)-objs) $($(f)-cxxobjs)))

You could also use the $(host-cobjs) and $(host-cxxobjs) variables
defined earlier and write

host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))

Michal
