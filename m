Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:33788 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751121AbbAEG7H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Jan 2015 01:59:07 -0500
Date: Mon, 05 Jan 2015 15:58:46 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 1/2] kbuild: merge bounds.h and asm-offsets.h rules
In-Reply-To: <54A6C19A.3080001@suse.cz>
References: <1419403765-3377-2-git-send-email-yamada.m@jp.panasonic.com> <54A6C19A.3080001@suse.cz>
Message-Id: <20150105155846.B978.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal,



On Fri, 02 Jan 2015 17:04:42 +0100
Michal Marek <mmarek@suse.cz> wrote:

> >  
> > -quiet_cmd_bounds = GEN     $@
> > -define cmd_bounds
> > +quiet_cmd_offsets = GEN     $@
> > +define cmd_offsets
> >  	(set -e; \
> > -	 echo "#ifndef __LINUX_BOUNDS_H__"; \
> > -	 echo "#define __LINUX_BOUNDS_H__"; \
> > +	 INCLUDE_GUARD=$$(echo __$(notdir $@)__ | tr '[a-z].-' '[A-Z]__'); \
> > +	 echo "#ifndef $$INCLUDE_GUARD"; \
> > +	 echo "#define $$INCLUDE_GUARD"; \
> 
> I think it would be more readable to write it as
> 
>   echo "#ifndef $(2)"; \
>   ...
> 
> and pass the include guard name as an argument to cmd_offsets.
> 
> Otherwise it's a great cleanup.
> 
> Michal


OK.  I have posted v2.


Best Regards
Masahiro Yamada

