Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:35113 "EHLO baikonur.stro.at"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbfABUDR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 15:03:17 -0500
Date: Wed, 2 Jan 2019 20:52:41 +0100
From: maximilian attems <maks@stro.at>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
Message-ID: <20190102195240.GA9246@gravitino>
References: <20190102092304.27262-1-riku.voipio@linaro.org>
 <f1334713b98ce0133988f5ff590ee90b81cf30d9.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1334713b98ce0133988f5ff590ee90b81cf30d9.camel@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, manivannan.sadhasivam@linaro.org, debian-kernel@lists.debian.org

On Wed, Jan 02, 2019 at 07:48:12PM +0000, Ben Hutchings wrote:
> On Wed, 2019-01-02 at 11:23 +0200, riku.voipio@linaro.org wrote:
> > From: Riku Voipio <riku.voipio@linaro.org>
> > 
> > bison/flex is now needed always for building for kconfig. Some build
> > dependencies depend on kernel configuration, enable them as needed:
> > 
> > - libelf-dev when UNWINDER_ORC is set
> > - libssl-dev for SYSTEM_TRUSTED_KEYRING
> > 
> > Since the libssl-dev is needed for extract_cert binary, denote with
> > :native to install the libssl-dev for the build machines
> > architecture,
> > rather than for the architecture of the kernel being built.
> > 
> > Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

Acked-by: maximilian attems <maks@stro.at>
 
> > ---
> > v2: commit message updated
> > ---
> >  scripts/package/mkdebian | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index edcad61fe3cd..c858abf4569e 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -134,6 +134,8 @@ fi
> >  
> >  mkdir -p debian/
> >  echo $debarch > debian/arch
> > +extra_build_depends=", $(if_enabled_echo UNWINDER_ORC libelf-dev)"
> > +extra_build_depends="$extra_build_depends, $(if_enabled_echo SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
> >  
> >  # Generate a simple changelog template
> >  cat <<EOF > debian/changelog
> > @@ -170,7 +172,7 @@ Source: $sourcename
> >  Section: kernel
> >  Priority: optional
> >  Maintainer: $maintainer
> > -Build-Depends: bc, kmod, cpio
> > +Build-Depends: bc, kmod, cpio, bison, flex $extra_build_depends
> >  Homepage: http://www.kernel.org/
> >  
> >  Package: $packagename
> -- 
> Ben Hutchings
> Absolutum obsoletum. (If it works, it's out of date.) - Stafford Beer
> 
> 
