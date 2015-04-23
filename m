Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:48840 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756393AbbDWKoC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Apr 2015 06:44:02 -0400
Date: Thu, 23 Apr 2015 12:43:58 +0200
From: maximilian attems <maks@stro.at>
Subject: Re: [PATCH 2/2] deb-pkg: add source package
Message-ID: <20150423104358.GR27866@stro.at>
References: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
 <34017611f8a0056a09d2c38412efd7828efe00fe.1428671643.git.riku.voipio@linaro.org>
 <20150422155057.GA32026@gluino>
 <CAAqcGHnRinMmG++0d02-ANYrdhxod5K3G5qcwxbA7tKOqe+Fjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAqcGHnRinMmG++0d02-ANYrdhxod5K3G5qcwxbA7tKOqe+Fjw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>

On Thu, Apr 23, 2015 at 12:01:10PM +0300, Riku Voipio wrote:
> On 22 April 2015 at 18:50, maximilian attems <maks@stro.at> wrote:
> >
> > great this is a much requested feature for wider adoption of make
> > deb-pkg. In general acked-by me, just minor comment below.
> >
> > I do not like the BUILD_SOURCE=y variable,
> > I think it should just be like the other scripts and do it by default.
> >
> > What we do need is a target that *only* compiles the linux image.
> 
> So a bin-debpkg target in scripts/package/Makefile ?

yes, please.
 
> >>  scripts/package/builddeb | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 42 insertions(+)
> >>
> >> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> >> index e397815..3d77fd3 100755
> >> --- a/scripts/package/builddeb
> >> +++ b/scripts/package/builddeb
> >> @@ -272,12 +272,23 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
> >>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
> >>  EOF
> >>
> >> +
> >> +build_depends="bc, "
> >> +if [ -n "$BUILD_TOOLS" ]
> 
> > why this dual stage?
> 
> That variable was introduced in "RFC: builddeb: add linux-tools
> package with perf" [1]. Building perf
> as part of deb-pkg was kind of the major motivation for these series.

With adding the very specific image target, I don't think this variable
is needed.
 
> >> +then
> >> +     build_depends="$build_depends python-dev, libperl-dev, bison, flex, \
> >> +libaudit-dev, libdw-dev, libelf-dev, libiberty-dev, libnewt-dev, autoconf, \
> >> +automake, libtool, libglib2.0-dev, libudev-dev, libwrap0-dev, libiberty-dev, \
> >> +libunwind8-dev [amd64 arm64 i386], libnuma-dev [amd64 arm64 i386 powerpc ppc64 ppc64el] "
> 
> > how did you generate this list, this seems bogus to me?!
> 
> > python-dev should probably be python
> > why would you need automake?
> 
> These are build-depends of linux-tools (perf etc).

Hmm, ok.
 
> > plus I do seem to miss cpio, kmod.
> 
> I'll add kmod and cpio to the non-tools case.

good.
