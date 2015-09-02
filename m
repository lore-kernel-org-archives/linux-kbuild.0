Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:40004 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751876AbbIBQdm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 12:33:42 -0400
Date: Wed, 2 Sep 2015 09:27:10 -0700
From: maximilian attems <maks@stro.at>
Subject: Re: [PATCH v5] deb-pkg: add source package
Message-ID: <20150902162709.GA7332@gluino>
References: <1441187844-10660-1-git-send-email-riku.voipio@linaro.org>
 <1441201810.9215.61.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441201810.9215.61.camel@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: riku.voipio@linaro.org, mmarek@suse.cz, Chris J Arges <chris.j.arges@canonical.com>, Ben Hutchings <ben@decadent.org.uk>

On Wed, Sep 02, 2015 at 02:50:10PM +0100, Ben Hutchings wrote:
> On Wed, 2015-09-02 at 12:57 +0300, riku.voipio@linaro.org wrote:
> > From: Riku Voipio <riku.voipio@linaro.org>
> > 
> > Make deb-pkg build both source and binary package like make rpm-pkg does.
> > For people who only need binary kernel package, there is now bindeb-pkg
> > target, same target also used to build the .deb files if built from the
> > source package using dpkg-buildpackage.
> > 
> > Generated source package will build the same kernel .config than what
> > was available for make deb-pkg. The name of the source package can
> > be set with KDEB_SOURCENAME enviroment variable.
> > 
> > The source package is useful for GPL compliance, or for feeding to a
> > automated debian package builder.
> > 
> > Cc: Chris J Arges <chris.j.arges@canonical.com>
> > Cc: maximilian attems <maks@stro.at>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> 
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
Reviewed-by: maximilian attems <maks@stro.at>
> 
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> > ---
> > v5:
> > - fix variable typo
> > - clean tmp dirs in clean: target
> > 
> > v4 address Bens commends,
> > - use src_tar function instead of git archive for kernel sources
> > - move KDEB_SOURCENAME setting to Makefile so it can be passed to
> >   src_tar
> > - use a toplevel .config file instead of a copy in debian/control
> > - defend against delete of debian/ in clean target
> > 
> > v3,
> > - Allow setting source package name with KDEB_SOURCENAME
> > - Fix issues noted by Ben: drop python and fix target in debian/rules
> > - Merge "ensure $MAKE can use jobserver" oneliner from Chris J Arges
> > 
> > v2, address Maximilians comments
> > - Isolate from my other patches, so it can be merged easier
> > - Separate bindeb-pkg target for building just binary debs
> > - Build source package in deb-pkg target to match rpm-pkg target
> >  scripts/package/Makefile | 17 +++++++++++++----
> >  scripts/package/builddeb | 38 ++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 49 insertions(+), 6 deletions(-)
> > 
> > diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> > index 297e756..1aca224 100644
> > --- a/scripts/package/Makefile
> > +++ b/scripts/package/Makefile
> > @@ -23,6 +23,8 @@
> >  
> >  # Remove hyphens since they have special meaning in RPM filenames
> >  KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
> > +KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
> > +export KDEB_SOURCENAME
> >  # Include only those top-level files that are needed by make, plus the GPL copy
> >  TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
> >                 Kbuild Kconfig COPYING $(wildcard localversion*)
> > @@ -83,11 +85,17 @@ quiet_cmd_builddeb = BUILDDEB
> >  > 	> } && \
> >  > 	> \
> >  > 	> $$KBUILD_PKG_ROOTCMD $(CONFIG_SHELL) \
> > -> 	> 	> $(srctree)/scripts/package/builddeb
> > +> 	> 	> $(srctree)/scripts/package/builddeb $@
> >  
> >  deb-pkg: FORCE
> > +> 	> $(MAKE) clean
> > +> 	> $(call cmd,src_tar,$(KDEB_SOURCENAME))
> > +> 	> $(MAKE) KBUILD_SRC=
> > +> 	> +$(call cmd,builddeb)
> > +
> > +bindeb-pkg: FORCE
> >  > 	> $(MAKE) KBUILD_SRC=
> > -> 	> $(call cmd,builddeb)
> > +> 	> +$(call cmd,builddeb)
> >  
> >  clean-dirs += $(objtree)/debian/
> >  
> > @@ -132,8 +140,9 @@ perf-%pkg: FORCE
> >  # ---------------------------------------------------------------------------
> >  help: FORCE
> >  > 	> @echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
> > -> 	> @echo '  binrpm-pkg          - Build only the binary kernel package'
> > -> 	> @echo '  deb-pkg             - Build the kernel as a deb package'
> > +> 	> @echo '  binrpm-pkg          - Build only the binary kernel RPM package'
> > +> 	> @echo '  deb-pkg             - Build both source and binary deb kernel packages'
> > +> 	> @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >  > 	> @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >  > 	> @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> >  > 	> @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 0c18cfd..0cd46e1 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -79,6 +79,7 @@ if [ -n "$KDEB_PKGVERSION" ]; then
> >  else
> >  > 	> packageversion=$version-$revision
> >  fi
> > +sourcename=$KDEB_SOURCENAME
> >  tmpdir="$objtree/debian/tmp"
> >  fwdir="$objtree/debian/fwtmp"
> >  kernel_headers_dir="$objtree/debian/hdrtmp"
> > @@ -238,7 +239,7 @@ fi
> >  
> >  # Generate a simple changelog template
> >  cat < debian/changelog
> > -linux-upstream ($packageversion) $distribution; urgency=low
> > +$sourcename ($packageversion) $distribution; urgency=low
> >  
> >    * Custom built Linux kernel.
> >  
> > @@ -265,12 +266,16 @@ On Debian GNU/Linux systems, the complete text of the GNU General Public
> >  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
> >  EOF
> >  
> > +
> > +build_depends="bc, kmod, cpio "
> > +
> >  # Generate a control file
> >  cat < debian/control
> > -Source: linux-upstream
> > +Source: $sourcename
> >  Section: kernel
> >  Priority: optional
> >  Maintainer: $maintainer
> > +Build-Depends: $build_depends
> >  Standards-Version: 3.8.4
> >  Homepage: http://www.kernel.org/
> >  EOF
> > @@ -391,4 +396,33 @@ EOF
> >  > 	> create_package "$dbg_packagename" "$dbg_dir"
> >  fi
> >  
> > +if [ "x$1" = "xdeb-pkg" ]
> > +then
> > +    cat < debian/rules
> > +#!/usr/bin/make -f
> > +
> > +build:
> > +> 	> \$(MAKE)
> > +
> > +binary-arch:
> > +> 	> \$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
> > +
> > +clean:
> > +> 	> rm -rf debian/*tmp
> > +> 	> mv debian/ debian.backup # debian/ might be cleaned away
> > +> 	> \$(MAKE) clean
> > +> 	> mv debian.backup debian
> > +
> > +binary: binary-arch
> > +EOF
> > +> 	> mv ${sourcename}.tar.gz ../${sourcename}_${version}.orig.tar.gz
> > +> 	> tar caf ../${sourcename}_${packageversion}.debian.tar.gz debian/{copyright,rules,changelog,control}
> > +> 	> dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
> > +> 	> 	> -b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
> > +> 	> mv ${sourcename}_${packageversion}*dsc ..
> > +> 	> dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
> > +else
> > +> 	> dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.changes
> > +fi
> > +
> >  exit 0
> -- 
> Ben Hutchings
> Horngren's Observation:
>                    Among economists, the real world is often a special case.
> 


