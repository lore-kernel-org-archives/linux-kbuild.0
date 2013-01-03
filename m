Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:41943 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754190Ab3ACVkO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jan 2013 16:40:14 -0500
Received: by mail-ie0-f177.google.com with SMTP id k13so18339429iea.8
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Jan 2013 13:40:13 -0800 (PST)
Received: by mail-ie0-f169.google.com with SMTP id c14so19197735ieb.28
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Jan 2013 13:40:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50E54A14.5010909@suse.cz>
References: <1356029364-11346-1-git-send-email-kliegs@chromium.org>
 <87ip7f5ecu.fsf@rustcorp.com.au> <50E54A14.5010909@suse.cz>
From: Jonathan Kliegman <kliegs@chromium.org>
Date: Thu, 3 Jan 2013 16:39:52 -0500
Message-ID: <CAPQV+nOTEfeQVwqd8zAP37qS3PrdwFQv1c0AC=nAz3UCemXhSg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Add flag -f for making section mismatches fatal
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, linux-kbuild@vger.kernel.org

On Thu, Jan 3, 2013 at 4:06 AM, Michal Marek <mmarek@suse.cz> wrote:
>
> Dne 3.1.2013 00:56, Rusty Russell napsal(a):
> > Jonathan Kliegman <kliegs@chromium.org> writes:
> >> The section mismatch warning can be easy to miss during the kernel build
> >> process.  Allow it to be marked as fatal to be easily caught and prevent
> >> bugs from slipping in.
> >>
> >> Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
> >
> > Hmm, a CONFIG option with no Kconfig entry?  That seems weird...
>
> With a Kconfig entry, all{mod,yes}configs would start failing. It can be
> enabled with make CONFIG_SECTION_MISMATCH_FATAL=y for now. Maybe it
> could be added to Kconfig with 'depends on n', so that it is documented
> somewhere.
>
Sorry for missing the Kconfig entry.  It looks like init/Kconfig in
the "General setup" seems the best fit as that looks like where the
other build options are.  If this is ok I'll upload a new version of
the patch with the entry added.

I'm not sure what you mean about configs failing.  After adding this
option to init/Kconfig I was able to build fine using old and new
configs with and without the option set.  Is there something specific
you'd like me to test for?

> Michal
