Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33967 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752041AbdBMOBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Feb 2017 09:01:33 -0500
Received: by mail-lf0-f46.google.com with SMTP id v186so50703132lfa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Feb 2017 06:01:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87mvdrys9x.fsf@turtle.gmx.de>
References: <CAEPqvoxvQHL=9bfTxE+GtOY225rYaeP5p3_7bNQoj4YG_kL=cQ@mail.gmail.com>
 <87mvdrys9x.fsf@turtle.gmx.de>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 13 Feb 2017 16:01:25 +0200
Message-ID: <CAAqcGHmFsSw88px_0r4KCWxWcwahApwotUvOfi-QkuiHsAO8oA@mail.gmail.com>
Subject: Re: deb-pkg target invokes clean
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>, Michal Marek <mmarek@suse.com>
Cc: Juraj <juraj.orsulic@fer.hr>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 13 February 2017 at 00:10, Sven Joachim <svenjoac@gmx.de> wrote:
> On 2017-02-12 22:11 +0100, Juraj wrote:
>
>> I noticed that the deb-pkg target in scripts/package/Makefile invokes
>> make clean. Is this really necessary?
>
> Yes, because (since Linux 4.3) "make deb-pkg" also generates a source
> tarball, and you don't want spurious object files in that tarball.
>
>> I disabled it so I could rebuild
>> .deb packages faster after making small changes to the kernel source.
>
> There's the bindeb-pkg target for that already. :-)

I've submitted a even faster target specifically to improve turnaround times:

https://patchwork.kernel.org/patch/9532279/

I don't know if it's going to be accepted for 4.11 or not.

Riku
