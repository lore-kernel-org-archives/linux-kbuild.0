Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:33554 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829AbcDZPRv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 11:17:51 -0400
Received: by mail-qk0-f170.google.com with SMTP id n63so6723153qkf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2016 08:17:50 -0700 (PDT)
Date: Tue, 26 Apr 2016 11:17:47 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v7 0/8]/[PULL REQUEST] Trim unused exported kernel
 symbols
In-Reply-To: <571F2424.10907@suse.com>
Message-ID: <alpine.LFD.2.20.1604261116480.5091@knanqh.ubzr>
References: <l0Vnaswuk0zQ0l0Vpa1Uwn@videotron.ca> <nnzoaR8KUeMRCnnzpaKqKi@videotron.ca> <alpine.LFD.2.20.1604182326490.27452@knanqh.ubzr> <57172CB2.1040801@suse.com> <alpine.LFD.2.20.1604201154060.27452@knanqh.ubzr> <alpine.LFD.2.20.1604201512410.27452@knanqh.ubzr>
 <571F2424.10907@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Apr 2016, Michal Marek wrote:

> On 2016-04-20 21:26, Nicolas Pitre wrote:
> > On Wed, 20 Apr 2016, Nicolas Pitre wrote:
> > 
> >> On Wed, 20 Apr 2016, Michal Marek wrote:
> >>
> >>> Dne 19.4.2016 v 05:32 Nicolas Pitre napsal(a):
> >>>> Ping !
> >>>>
> >>>> /me only hears back empty cave echoes ...
> >>>
> >>> Pulled now, sorry for the delay.
> >>
> >> Thanks!
> > 
> > Looking at your kbuild branch, I see subsequent changes that require 
> > minor adjustments. Please merge the following patch:
> > 
> > ----- >8
> > From a14d6e7a2902af78ee43ab075c7caf829fdfa4b2 Mon Sep 17 00:00:00 2001
> > From: Nicolas Pitre <nicolas.pitre@linaro.org>
> > Date: Wed, 20 Apr 2016 15:16:01 -0400
> > Subject: [PATCH] kbuild: adjust ksym_dep_filter for some cmd renames
> > 
> > The following renames occurred recently:
> > 
> >   cmd_cc_i_c --> cmd_cpp_i_c
> >   cmd_as_s_S --> cmd_cpp_s_S
> > 
> > The respective cc_*_c and as_*_S patterns no longer match the above
> > therefore additional patterns are needed.
> > 
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> > 
> > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > index a09927e027..bd6bd048cf 100644
> > --- a/scripts/Kbuild.include
> > +++ b/scripts/Kbuild.include
> > @@ -275,8 +275,10 @@ else
> >  flags_nodeps = $(filter-out -Wp$(comma)-M%, $($(1)))
> >  ksym_dep_filter =                                                            \
> >  	case "$(1)" in                                                       \
> > -	cc_*_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;    \
> > -	as_*_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;    \
> > +	cc_*_c)  $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;   \
> > +	as_*_S)  $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;   \
> > +	cpp_i_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;   \
> > +	cpp_s_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;   \
> 
> Please make it
> cc_*_c | cpp_i_c) ...
> as_*_S | cpp_s_S) ...

Sure. Patch follows


Nicolas
