Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:39688 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932088AbeB1TAE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Feb 2018 14:00:04 -0500
Subject: Re: [PATCH] Documentation: Update ncurses package names for
 menuconfig
References: <1519801192-31201-1-git-send-email-arvindprasanna@gmail.com>
 <43a91eb4-646a-b4d8-5b3d-b0bfde0019d9@infradead.org>
 <CAK-=9LoNfYP_-tm+W2GvUWjWgs=BZ-VRFmVNzTCadzQWaee9yg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e484c42f-4fe6-10f5-dab8-cfd749911486@infradead.org>
Date: Wed, 28 Feb 2018 10:59:58 -0800
MIME-Version: 1.0
In-Reply-To: <CAK-=9LoNfYP_-tm+W2GvUWjWgs=BZ-VRFmVNzTCadzQWaee9yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arvind Prasanna <arvindprasanna@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/28/2018 09:39 AM, Arvind Prasanna wrote:
> Hi Randy:
> 
> On 02/27/2018 10:59 PM, Arvind Prasanna wrote:
>> The package name is ncurses-devel for Redhat based distros
>> and libncurses-devel for Debian based distros.
> 
> The above lines are part of the commit message and the patch says to install either ncurses-devel or libncurses-dev based on the user's Linux distribution. Would you prefer I add my commit message lines to the patch as well?
> 
> Thanks,
> 
> Arvind.
> 
> 
> On Wed, Feb 28, 2018 at 12:31 PM, Randy Dunlap <rdunlap@infradead.org <mailto:rdunlap@infradead.org>> wrote:
> 
>     On 02/27/2018 10:59 PM, Arvind Prasanna wrote:
>     > The package name is ncurses-devel for Redhat based distros
>     > and libncurses-devel for Debian based distros.
> 
>           ^^^^^^^^^^^^^^^^ That's not what the patch says. Please clarify.

For Debian-based distros, is it libncurses-devel (above) or is it
libncurses-dev (as below)?  [latter is without the ending "el"]


And what about the other few hundred distros?  (rhetorical)


>     >
>     > Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com <mailto:arvindprasanna@gmail.com>>
>     > ---
>     >  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 ++-
>     >  1 file changed, 2 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
>     > index a10bd9d..4353e40 100755
>     > --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
>     > +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
>     > @@ -55,7 +55,8 @@ EOF
>     >           echo " *** required header files."                            1>&2
>     >           echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
>     >           echo " *** "                                                  1>&2
>     > -         echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
>     > +         echo " *** Install ncurses (ncurses-devel or libncurses-dev   1>&2
>     > +                *** depending on your distribution) and try again."    1>&2
>     >           echo " *** "                                                  1>&2
>     >           exit 1
>     >       fi


-- 
~Randy
