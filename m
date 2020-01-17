Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgAQOnh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 09:43:37 -0500
MIME-Version: 1.0
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com> <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com> <20200117090937.GU54439@umbus>
In-Reply-To: <20200117090937.GU54439@umbus>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 17 Jan 2020 08:43:23 -0600
Message-ID: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Steve McIntyre <steve.mcintyre@linaro.org>

On Fri, Jan 17, 2020 at 6:26 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > Hi David
> >
> > On 1/16/20 1:57 AM, David Gibson wrote:
> > > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> > > > This commit adds the possibility to add build information for a DTB.
> > > > Build information can be: build date, DTS version, "who built the DTB"
> > > > (same kind of information that we get in Linux with the Linux banner).
> > > >
> > > > To do this, an extra option "-B" using an information file as argument
> > > > has been added. If this option is used, input device tree is appended with
> > > > a new string property "Build-info". This property is built with information
> > > > found in information file given as argument. This file has to be generated
> > > > by user and shouldn't exceed 256 bytes.
> > > >
> > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> > >
> > > At the very least, this patch of the series will need to be sent to
> > > upstream dtc first.
> >
> > Ok sorry. I thought that sending all the series would give more
> > information.
>
> That's fair enough, but in order to merge, you'll need to post against
> upstream dtc.
>
> > > I'm also not terribly clear on what you're trying to accomplish here,
> > > and why it's useful.
> >
> > Let's take Kernel boot at example (but could be extend to other DTB "users"
> > like U-Boot). When Linux kernel booting we get a log that gives useful
> > information about kernel image: source version, build date, people who built
> > the kernel image, compiler version. This information is useful for debug and
> > support. The aim is to get same kind of information but for the DTB.
> >
> > > Since you're doing this specifically for use with dtbs built in the
> > > kernel build, could you just use a:
> > >     Build-info = /incbin/ "build-info.txt";
> > > in each of the in-kernel .dts files?
> >
> > My first idea was to not modify all existing .dts files. Adding an extra
> > option in dtc is (for me) the softer way to do it. I mean, compile
> > information should come through compiler without modify .dts files outside
> > from dtc. In this way it will be easy to everybody using dtc (inside our
> > outside Linux tree) to add dtb build info (even if they don't how to write a
> > dts file).
>
> But you're not really having this information coming from the
> compiler.  Instead you're adding a compiler option that just force
> includes another file into the generated tree, and it's up to your
> build scripts to put something useful into that file.
>
> I don't really see that as preferable to modifying the .dts files.
>
> I also dislike the fact that the option as proposed is much more
> general than the name suggests, but also very similar too, but much
> more specific than the existing /incbin/ option.
>
> What might be better would be to have a dtc option which force appends
> an extra .dts to the mail .dts compiled.  You can then put an overlay
> template in that file, something like:
>
> &{/} {
>         linux,build-info = /incbin/ "build-info.txt;
> }

I like this suggestion either as an include another dts file or an
overlay. The latter could be useful as a way to maintain current dtb
files while splitting the source files into base and overlay dts
files.

But no, let's not prepend this with 'linux'. It's not a property
specific for Linux to consume.

Rob
