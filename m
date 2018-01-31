Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:56046 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbeAaKjm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jan 2018 05:39:42 -0500
Date: Wed, 31 Jan 2018 13:39:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 05/10] Staging: rtl8192e: kconfig: Remove empty help text
Message-ID: <20180131103921.7wgqc45htzndli2l@mwanda>
References: <20180130190555.6577-1-ulfalizer@gmail.com>
 <20180130190555.6577-6-ulfalizer@gmail.com>
 <20180131080622.z6yf2h27m4ea3fkx@mwanda>
 <CAFkk2KS0KQtnVB42tg1M3d1hR+APT7H99dZuzMPoCO63emO3hg@mail.gmail.com>
 <20180131084620.kkok5rpfbqakhyps@mwanda>
 <CAFkk2KTWkSh0zzK5aXx+FtH1RHBKkwSGr=-Ri1U9d=KbUGXSDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KTWkSh0zzK5aXx+FtH1RHBKkwSGr=-Ri1U9d=KbUGXSDA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: devel@driverdev.osuosl.org, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>

On Wed, Jan 31, 2018 at 10:52:08AM +0100, Ulf Magnusson wrote:
> On Wed, Jan 31, 2018 at 9:46 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Wed, Jan 31, 2018 at 09:41:24AM +0100, Ulf Magnusson wrote:
> >> On Wed, Jan 31, 2018 at 9:06 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> > On Tue, Jan 30, 2018 at 08:05:27PM +0100, Ulf Magnusson wrote:
> >> >> In preparation for adding a warning ("kconfig: Warn if help text is
> >> >> blank"): https://lkml.org/lkml/2018/1/30/516
> >> >>
> >> >
> >> > Please don't start the boddy of the email in the middle of a sentence.
> >> >
> >> > It looks like this:
> >> >
> >> > https://marc.info/?l=linux-driver-devel&m=151733925532413&w=2
> >> >
> >> > Notice how the subject is up above the From, Date, and Message-id email
> >> > headers?  It's totally disconnected from the body of the email.
> >> >
> >> > regards,
> >> > dan carpenter
> >>
> >> The 'this is in...' was implied. I'll try to be less of a sloppy bastard.
> >>
> >
> > I do feel that patch descriptions should say what the patch does as well
> > as why.  Right now the subject says what but I normally read either the
> > body or the subject but not both.
> >
> > regards,
> > dan carpenter
> >
> 
> I fleshed out the individual commit messages and rolled a new
> patchset, which adds the warning at the end:
> https://lkml.org/lkml/2018/1/31/137

Thanks!

regards,
dan carpenter

