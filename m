Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:43025 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbaGPHQT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:16:19 -0400
Date: Wed, 16 Jul 2014 16:16:07 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v2 5/5] kbuild: clean-up and bug fix of scripts/Makefile.host
In-Reply-To: <53BFEAC4.9040407@suse.cz>
References: <1402287394-31133-6-git-send-email-yamada.m@jp.panasonic.com> <53BFEAC4.9040407@suse.cz>
Message-Id: <20140716161607.AC20.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Michal,



On Fri, 11 Jul 2014 15:46:44 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-06-09 06:16, Masahiro Yamada wrote:
> > -# hostprogs-y := tools/build may have been specified. Retrieve directory
> > -host-objdirs := $(dir $(__hostprogs))
> > -# directory of .o files from prog-objs notation
> > -host-objdirs += $(dir $(foreach f,$(host-cmulti), $($(f)-objs)))
> > -# directory of .o files from prog-cxxobjs notation
> > -host-objdirs += $(dir $(foreach f,$(host-cxxmulti), $($(f)-cxxobjs)))
> > +# hostprogs-y := tools/build may have been specified.
> > +# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
> > +host-objdirs := $(dir \
> > +	     $(foreach f, $(__hostprogs), $(f) $($(f)-objs) $($(f)-cxxobjs)))
> 
> You could also use the $(host-cobjs) and $(host-cxxobjs) variables
> defined earlier and write
> 
> host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
> 


Yup, this is much cleaner.
Fixed in v3.

Thanks!


Best Regards
Masahiro Yamada

