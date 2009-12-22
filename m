Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:53558 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751224AbZLVEuy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Dec 2009 23:50:54 -0500
Subject: Re: [PATCH v2 2/3] powerpc: Add support for creating FIT uImages
From: Peter Tyser <ptyser@xes-inc.com>
In-Reply-To: <20091222034819.GA24012@lixom.net>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	 <1261446643-21714-3-git-send-email-ptyser@xes-inc.com>
	 <20091222034819.GA24012@lixom.net>
Content-Type: text/plain
Date: Mon, 21 Dec 2009 22:50:37 -0600
Message-Id: <1261457437.6875.18.camel@ptyser-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Hi Olof,

On Mon, 2009-12-21 at 21:48 -0600, Olof Johansson wrote:
> Hi,
> 
> On Mon, Dec 21, 2009 at 07:50:42PM -0600, Peter Tyser wrote:
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index bb2465b..e56ec21 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -310,6 +310,9 @@ $(obj)/zImage.iseries: vmlinux
> >  $(obj)/uImage: vmlinux $(wrapperbits)
> >  	$(call if_changed,wrap,uboot)
> >  
> > +$(obj)/uImage.fit.%: vmlinux $(obj)/%.dtb $(wrapperbits)
> > +	$(call if_changed,wrap,uboot.fit,,$(obj)/$*.dtb)
> > +
> >  $(obj)/cuImage.initrd.%: vmlinux $(obj)/%.dtb $(wrapperbits)
> >  	$(call if_changed,wrap,cuboot-$*,,$(obj)/$*.dtb,$(obj)/ramdisk.image.gz)
> >  
> > @@ -349,7 +352,7 @@ install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
> >  
> >  # anything not in $(targets)
> >  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
> > -	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
> > +	uImage.* zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
> 
> Please no. It's not entirely uncommon that I will save a "known good"
> binary in the build tree for a while, by copying it aside with a different
> suffix. That'd give me one very big surprise in this case.

You're right that it'd probably be better if the clean pattern was
uImage.fit.* to be more restrictive, but your concern would still exist,
as it does for a number of other image formats already (cuImage.*,
simpleImage.*, etc).  I can't think of a way to work around that issue
though...  Any ideas?  Don't keep backup images in arch/powerpc/boot?:)

Thanks for the feedback,
Peter



