Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:56608 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360Ab3AFUXC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Jan 2013 15:23:02 -0500
Received: by mail-oa0-f53.google.com with SMTP id j6so16861263oag.26
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Jan 2013 12:23:01 -0800 (PST)
Received: by mail-ob0-f179.google.com with SMTP id x4so16416487obh.24
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Jan 2013 12:22:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20130106093649.GA17429@merkur.ravnborg.org>
References: <1356029364-11346-1-git-send-email-kliegs@chromium.org> <20130106093649.GA17429@merkur.ravnborg.org>
From: Jonathan Kliegman <kliegs@chromium.org>
Date: Sun, 6 Jan 2013 15:22:39 -0500
Message-ID: <CAPQV+nP1UJP4R8AmoUf4bt873Yz_D0ZR2msaCRx5eAc49QFodA@mail.gmail.com>
Subject: Re: [PATCH] modpost: Add flag -f for making section mismatches fatal
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Rusty Russell <rusty@rustcorp.com.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, linux-kbuild@vger.kernel.org

On Sun, Jan 6, 2013 at 4:36 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Jonathan.
>
>> The section mismatch warning can be easy to miss during the kernel build
>> process.  Allow it to be marked as fatal to be easily caught and prevent
>> bugs from slipping in.
>>
>> Signed-off-by: Jonathan Kliegman <kliegs@chromium.org>
>
> Another way to make them much more visible would be to make
> the warnings always be verbose.

I'd like to keep the option for a hard fail if a mismatch is detected.
 This way automated build systems will detect the failed build and can
reject a chan

> In other words drop support for the "-S" options used below:
>>   $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)
>
> Previously the dev* stuff caused a lot of warnings, but
> since we have HOTPLUG always enabled this is a non-issue.
> So I think that this is a good time to enable the verboce
> warnings.
I can submit a second patch for this if you'd like, but I'm not
familiar with all the previous decisions in this area.  If I
understand correctly we'll still need the config option as it also
changes compiler flags for inlining.
>
>         Sam
