Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37522 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751746AbdLDNP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 08:15:26 -0500
Received: by mail-lf0-f68.google.com with SMTP id a12so19104618lfe.4
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2017 05:15:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204100150.1f040839@md1em3qc>
References: <20171127161345.17880-1-henning.schild@siemens.com>
 <1512147072.2785.20.camel@decadent.org.uk> <20171201193433.68b25efe@md1em3qc>
 <1512154058.2811.4.camel@decadent.org.uk> <20171204100150.1f040839@md1em3qc>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Mon, 4 Dec 2017 15:15:24 +0200
Message-ID: <CAAqcGH=2dwaDniTtekeJ_Yf49deCjEz=oLXU4zom-t5=OZPG7A@mail.gmail.com>
Subject: Re: [PATCH] builddeb: introduce variables for control-file customization
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Henning Schild <henning.schild@siemens.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, LKML <linux-kernel@vger.kernel.org>, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, Konrad Schwarz <konrad.schwarz@siemens.com>

On 4 December 2017 at 11:01, Henning Schild <henning.schild@siemens.com> wrote:
> Am Fri, 1 Dec 2017 18:47:38 +0000
> schrieb Ben Hutchings <ben@decadent.org.uk>:
>
>> On Fri, 2017-12-01 at 19:34 +0100, Henning Schild wrote:
>> > Am Fri, 1 Dec 2017 16:51:12 +0000
>> > schrieb Ben Hutchings <ben@decadent.org.uk>:
>> >
>> > > On Fri, 2017-12-01 at 15:56 +0000, Henning Schild wrote:
>> > > > The debian packages coming out of "make *deb-pkg" lack some
>> > > > critical information in the control-files e.g. the "Depends:"
>> > > > field. If one tries to install a fresh system with such a
>> > > > "linux-image" debootstrap or multistrap might try to install
>> > > > the kernel before its deps and the package hooks will fail.

We don't usually install kernel during debootstrap.

>> > > I assume you're talking about those hook scripts being run while
>> > > the packages they belong to are only unpacked?  I hadn't thought
>> > > about this issue, but it seems to me that those hook scripts
>> > > generally ought to be fixed to handle this case properly.  Most
>> > > of the packages installing hook scripts for kernel packages are
>> > > not going to be dependencies of linux-image packages, so it will
>> > > never be safe for them to assume their package has been fully
>> > > installed.
>> >
>> > Yes these hook scripts fail when installing the kernel on another
>> > system. Indeed we seem to have a case where packages installed on
>> > the build-machine cause install-time deps for the package.
>>
>> Can you give an example?  I don't see how that would happen.
>
> Scripts in /etc/kernel/ will end up as hooks for the kernel-package, if
> you do not set KDEB_HOOKDIR. Looking at an example system that pulls in
> things like "pm-utils, grub-pc .. initramfs". With this mechanism any
> package placing a hook in /etc/kernel can influence the deps. I guess
> in practice that is prevented with policies on what these scripts are
> allowed to do.

This doesn't seem to be the case on my system. And from the bits that
handle debhookdir in scripts/package/builddeb, I don't see how this
is happening.
