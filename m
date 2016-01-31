Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:28943 "EHLO
	mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757218AbcAaPG5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 Jan 2016 10:06:57 -0500
Date: Sun, 31 Jan 2016 15:05:49 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] ld-version: fix it on Fedora
In-Reply-To: <alpine.DEB.2.00.1601301311170.5958@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1601311445300.5958@tp.orcam.me.uk>
References: <1452189189-31188-1-git-send-email-mst@redhat.com> <CAAG0J995iCNwdN6PpuJfzo+TVWNXR3UVqS9v-4HXbryyvMn+=w@mail.gmail.com> <E484D272A3A61B4880CDF2E712E9279F45D04AA7@HHMAIL01.hh.imgtec.org> <CAJ1xhMWth4kNuEkuVEUiUEz=d_9dmKxh0+Z_GrRcKB+F72W91w@mail.gmail.com>
 <E484D272A3A61B4880CDF2E712E9279F45D179FA@HHMAIL01.hh.imgtec.org> <CAJ1xhMVbxoag7psNg+5L6AmL4WYXKyBYNuVGjJcfqe6Km_10SQ@mail.gmail.com> <alpine.DEB.2.00.1601301311170.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc: Daniel Sanders <Daniel.Sanders@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>

On Sat, 30 Jan 2016, Maciej W. Rozycki wrote:

> > % echo 2.24.51.20140217 | ld-version.sh
> > 22451000
> 
>  So the above version is a non-release snapshot from the development tree 
> as the repository trunk is switched to x.y+1.51 once a release branch for 
> x.y has been made.  Then the release branch is switched to x.y-1.90 for 
> prereleases, before settling on x.y or x.y.0 (this hasn't been consistent) 
> for the actual base release.  Any subsequent maintenance releases will 
> then have their version set to x.y.1, x.y.2, and so on.  We shouldn't ever 
> rely on versions that are not proper releases.

 I need to correct myself here for unclear notation or off-by-one errors, 
the flow is of course as follows:

    trunk
   x.y-1.51
      |
      |
      |
release branchpoint
      |      \
    x.y.51 x.y-1.90
      |   prerelease
      |       |
      |       |
      v    x.y-1.91
      .   prerelease
      .       |
      .       |
              |
           x.y-1.92
          prerelease
              .
              .
              .
            x.y.0
         base release
              |
              |
              |
            x.y.1
      maintenance release
              |
              |
              |
            x.y.2
      maintenance release
              |
              v
              .
              .
              .

 The revision number is sometimes bumped up on trunk as well, to 52, 53, 
etc., though the criteria are not completely clear to me; perhaps to make 
a trunk snapshot "release".

 And last but not least for non-release builds the snapshot date is 
automatically appended to the version number reported, as seen above.

  Maciej
