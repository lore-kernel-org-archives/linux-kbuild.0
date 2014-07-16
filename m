Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:48522 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751091AbaGPHOm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:14:42 -0400
Date: Wed, 16 Jul 2014 16:14:33 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v2 3/5] kbuild: drop shared library support from Makefile.host
In-Reply-To: <53BFE82B.9060802@suse.cz>
References: <1402287394-31133-4-git-send-email-yamada.m@jp.panasonic.com> <53BFE82B.9060802@suse.cz>
Message-Id: <20140716161432.AC1C.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi Michal,



On Fri, 11 Jul 2014 15:35:39 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-06-09 06:16, Masahiro Yamada wrote:
> > The shared library feature in Makefile.host is no longer used.
> > Rip it off to keep the build infrastucture simple.
> > 
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > 
> > Changes in v2:
> >   - Newly added
> > 
> >  scripts/Makefile.host | 43 +++----------------------------------------
> >  1 file changed, 3 insertions(+), 40 deletions(-)
> 
> Hi Masahiro-san,
> 
> sorry for the late review. This change looks good, given that the usage
> of shared libraries has been dropped almost ten years ago :). Just
> please also remove section 4.3 of Documentation/kbuild/makefiles.txt.
> 


Updated makefiles.txt in v3.

Thanks!



Best Regards
Masahiro Yamada


