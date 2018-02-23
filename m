Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:41283 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbeBWOEd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 09:04:33 -0500
Date: Fri, 23 Feb 2018 15:04:20 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180223140420.GA10547@vmlxhi-102.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
 <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator>
 <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
 <CAFkk2KRxERva+XZi_fR_Epr63TwA6hKjwjCYnwtnK+xOSJUWHg@mail.gmail.com>
 <CAK7LNATTqqzJReUfkoxE=5+GsVUMv4wjOuz--=-PY_B4eK4NeA@mail.gmail.com>
 <20180221061052.GA29861@example.com>
 <CAK7LNATHuCmU3WJJZs_S6ppZ2dbaZJa66yWhaCRJxqB6PLXgQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNATHuCmU3WJJZs_S6ppZ2dbaZJa66yWhaCRJxqB6PLXgQg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>


Hi Masahiro,

On Fri, Feb 23, 2018 at 09:10:37PM +0900, Masahiro Yamada wrote:
> Eugeniu,
> 
> 
> 2018-02-21 15:10 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> 
> >
> > I've tested https://patchwork.kernel.org/patch/10229545/ and
> > https://patchwork.kernel.org/patch/10231295/ and they work great for me.
> > Thank you for this feature.
> >
> 
> I will give you that code in the second one.

I appreciate that, although I am open minded who takes the authorship.
This feature makes my life easier and that's the most important part.

> 
> Please fill the commit log with yours,
> and also fix the bugs pointed by Petr.

Sure. Will do that.

> Anyway, I will claim my contribution
> in the form of Signed-off-by when I pick it up.  :)

I have one side question loosely related to this patch.

Reverse dependencies are still not printed in zconfdump() (used in our kernel
team for e.g. cross platform .config alignment/comparison). My gut feeling
tells me this is mainly caused by the extremely unfriendly unreadable
expressions which is how reverse dependencies used to be represented before
commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
readable"). Since this is now greatly improved, would you mind printing
Selected/Implied-by in zconfdump? There are also other zconfdump fixes
sitting in my local branch, like https://patchwork.kernel.org/patch/9253535/ .
I would like to push them to you (they probably deserve a separate
thread), if you think this is appropriate.

Best regards,
Eugeniu.
