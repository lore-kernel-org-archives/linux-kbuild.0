Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:38292 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822AbcAYKto convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Jan 2016 05:49:44 -0500
From: Daniel Sanders <Daniel.Sanders@imgtec.com>
Subject: RE: [PATCH] ld-version: fix it on Fedora
Date: Mon, 25 Jan 2016 10:49:39 +0000
Message-ID: <E484D272A3A61B4880CDF2E712E9279F45D179FA@HHMAIL01.hh.imgtec.org>
References: <1452189189-31188-1-git-send-email-mst@redhat.com>
 <CAAG0J995iCNwdN6PpuJfzo+TVWNXR3UVqS9v-4HXbryyvMn+=w@mail.gmail.com>
 <E484D272A3A61B4880CDF2E712E9279F45D04AA7@HHMAIL01.hh.imgtec.org>,<CAJ1xhMWth4kNuEkuVEUiUEz=d_9dmKxh0+Z_GrRcKB+F72W91w@mail.gmail.com>
In-Reply-To: <CAJ1xhMWth4kNuEkuVEUiUEz=d_9dmKxh0+Z_GrRcKB+F72W91w@mail.gmail.com>
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc: James Hogan <James.Hogan@imgtec.com>, "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

> From: Alexander Kapshuk [alexander.kapshuk@gmail.com]
> Sent: 23 January 2016 14:41
> To: Daniel Sanders
> Cc: James Hogan; Michael S. Tsirkin; LKML; Michal Marek; linux-kbuild@vger.kernel.org; Linux MIPS Mailing List; Ralf Baechle
> Subject: Re: [PATCH] ld-version: fix it on Fedora
> 
> On Wed, Jan 13, 2016 at 7:30 PM, Daniel Sanders <Daniel.Sanders@imgtec.com<mailto:Daniel.Sanders@imgtec.com>> wrote:
> Hi,
> 
> The version number that's giving me problems is 2.24.51.20140217 which ld-version.sh converts to 2036931700 (20000000+2400000+510000+2014021700).
> 
> At the moment, I'm wondering whether we really need to handle more than three version number components. Another thought is that the comparison could be inside ld-version.sh (or a replacement) so that it can compare the array of version components directly instead of using a constructed integer as a proxy.
> 
> > -----Original Message-----
> > From: james@albanarts.com<mailto:james@albanarts.com> [mailto:james@albanarts.com<mailto:james@albanarts.com>] On Behalf Of
> > James Hogan
> > Sent: 13 January 2016 17:06
> > To: Michael S. Tsirkin
> > Cc: LKML; Michal Marek; linux-kbuild@vger.kernel.org<mailto:linux-kbuild@vger.kernel.org>; Linux MIPS Mailing
> > List; Ralf Baechle; Daniel Sanders
> > Subject: Re: [PATCH] ld-version: fix it on Fedora
> >
> > Cc'ing Daniel, who has hit further breakage due to unusual version numbers.
> >
> > On 7 January 2016 at 17:55, Michael S. Tsirkin <mst@redhat.com<mailto:mst@redhat.com>> wrote:
> > > On Fedora 23, ld --version outputs:
> > > GNU ld version 2.25-15.fc23
> > >
> > > But ld-version.sh fails to parse this, so e.g.  mips build fails to
> > > enable VDSO, printing a warning that binutils >= 2.24 is required.
> > >
> > > To fix, teach ld-version to parse this format.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com<mailto:mst@redhat.com>>
> > > ---
> > >
> > > Which tree should this be merged through? Mine? MIPS?
> > >
> > >  scripts/ld-version.sh | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > > index 198580d..25d23c8 100755
> > > --- a/scripts/ld-version.sh
> > > +++ b/scripts/ld-version.sh
> > > @@ -2,6 +2,8 @@
> > >  # extract linker version number from stdin and turn into single number
> > >         {
> > >         gsub(".*)", "");
> > > +       gsub(".*version ", "");
> > > +       gsub("-.*", "");
> > >         split($1,a, ".");
> > >         print a[1]*10000000 + a[2]*100000 + a[3]*10000 + a[4]*100 + a[5];
> > >         exit
> > > --
> > > MST
> > >
> 
> Is this the output you're looking for?
> 
> % echo 'GNU ld version 2.25-15.fc23' |
> > awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
> > match($0, /[0-9]+([.]?[0-9]+)+/)
> > bin=substr($0,RSTART,RLENGTH)
> > split(bin, a, ".")
> > print a[1]*10000000 + a[2]*100000 + a[3]*10000}'
> 22500000
> 
> % echo 2.25.1.20140217 |
> > awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
> > match($0, /[0-9]+([.]?[0-9]+)+/)
> > bin=substr($0,RSTART,RLENGTH)
> > split(bin, a, ".")
> > print a[1]*10000000 + a[2]*100000 + a[3]*10000}'
> 22510000
> 
> awk parsing code taken from ver_linux:
> /usr/src/linux/scripts/ver_linux:28,33
> ld -v 2>&1 |
> awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
>     match($0, /[0-9]+([.]?[0-9]+)+/)
>     printf("Binutils\t\t%s\n",
>     substr($0,RSTART,RLENGTH))
> }'
> 

It's close. That code doesn't quite work for my version number because the third component has two
digits and overflows into the second component in the proxy integer:
$ echo 2.24.51.20140217 |
> awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
> match($0, /[0-9]+([.]?[0-9]+)+/)
> bin=substr($0,RSTART,RLENGTH)
> split(bin, a, ".")
> print a[1]*10000000 + a[2]*100000 + a[3]*10000}'
22910000

but adding a zero to the first two scale factors, or removing one from the third works for me.
$ echo 2.24.51.20140217 | awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
> match($0, /[0-9]+([.]?[0-9]+)+/)
> bin=substr($0,RSTART,RLENGTH)
> split(bin, a, ".")
> print a[1]*100000000 + a[2]*1000000 + a[3]*10000}'
224510000
$ echo 2.24.51.20140217 | awk '/[0-9]+([.]?[0-9]+)+/ && !/not found$/{
> match($0, /[0-9]+([.]?[0-9]+)+/)
> bin=substr($0,RSTART,RLENGTH)
> split(bin, a, ".")
> print a[1]*10000000 + a[2]*100000 + a[3]*1000}'
22451000