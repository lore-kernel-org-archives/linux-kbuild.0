Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f176.google.com ([209.85.220.176]:34180 "EHLO
	mail-fx0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbZCMVuk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2009 17:50:40 -0400
Received: by fxm24 with SMTP id 24so2801571fxm.37
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Mar 2009 14:50:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090312153150.GA11875@uranus.ravnborg.org>
References: <1236865388-31590-1-git-send-email-remis.developer@googlemail.com>
	 <20090312153150.GA11875@uranus.ravnborg.org>
Date: Fri, 13 Mar 2009 22:50:36 +0100
Message-ID: <9fe197cb0903131450y2f5d3f63o354d1c008d6f269c@mail.gmail.com>
Subject: Re: [PATCH 0/3] Generic headers implementation
From: Remis Lima Baima <remisbaima@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2009 at 4:31 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Thu, Mar 12, 2009 at 02:43:05PM +0100, Remis Lima Baima wrote:
>> Generic headers allow ARCH maintainers to remove all dummy
>> arch/ARCH/include/asm/XXX.h files or, depending on the architecture,
>> include/asm-ARCH/XXX.h (e.g. arch/x86/include/asm/errno.h) that only
>> include the _name equivalent_ include/asm-generic/XXX.h file
>> (e.g. include/asm-generic/errno.h) with _no_ changes. It was called
>> generic headers for short. Arnd Bergmann gave the original idea and
>> asked me to implement it.
>
> Hi Remis.
>
> I recall having exchanged mails with Arnd about the topic before but
> I have lost track of it.
>
> Why is it that we do not implment this using the following scheme:
>
> Create a new directory:
> 1) include/generic/asm
> 2) Add the directory to the searchpath _after_ all ARCH supplied search paths.
> 3) Teach headers install about this new place
> 4) Move all generic headers from asm-generic to this new home
>   and add a dummy "#include <generic/asm/foo.h>" in asm-generic
>
> Then we can delete all the one-liners in $ARCH/include/asm
> which simply include the asm-generic version.
>
>        Sam

Actually this is a much better solution. I just tried it out for few
files and it seems to work quite well. I will implement it and send
the patch.
But what do you think if, instead of creating the dummy "#include
<generic/asm/foo.h>" in asm-generic, we create symlinks?
I've heard about an "avoid-symlink policy" so it is more a sort of
question than suggestion ;-)

Remis
