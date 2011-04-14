Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:48460 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758813Ab1DNOke (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Apr 2011 10:40:34 -0400
Date: Thu, 14 Apr 2011 14:40:33 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Message-ID: <20110414144033.GA1649@vostochny.stro.at>
References: <4DA613A3.7070600@greenroomsoftware.com>
 <20110413224756.GJ13777@vostochny.stro.at>
 <6ade24ec7435d903e01b17af6b53dc67@greenroomsoftware.com>
 <20110414143858.GA14561@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110414143858.GA14561@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robert@greenroomsoftware.com
Cc: linux-kbuild@vger.kernel.org, robertcnelson@gmail.com

On Thu, Apr 14, 2011 at 04:38:58PM +0200, maximilian attems wrote:
> On Thu, 14 Apr 2011, robert@greenroomsoftware.com wrote:
> 
> >      This is my first patch submission, and I am trying to get it
> > right.  I fixed white space issues and removed the following
> > unneeded line:
> > arch=$(dpkg --print-architecture)
> > 
> > Regards,
> > Robert Gordon
>  
> the patch itselfs looks good now, but I was unable to apply it,
> copied over to some temporary mailbox /tmp/n, but getting this:
> 
> maks@dual:~/src/linux-2.6 (debarch $)$ git am -i -s /tmp/n
> Patch is empty.  Was it split wrong?
> If you would prefer to skip this patch, instead run "git am --skip".
> To restore the original branch and stop patching run "git am --abort".
> maks@dual:~/src/linux-2.6 (debarch $|AM)$ git am --abort
> 
> 
> it looks like your mail client borked the patch while sending it,
> adding everywhere an additional " " prefix.

scratch that comment, try to use for getting a proper patch
git format-patch HEAD^..

for sending off, git send-email is very practical.
 
> Try to send the patch to yourself and to apply it, before resending
> here, also you might want to read in linux-2.6 git
> Documentation/email-clients.txt
> 
> I hope this helps?
> 
> kind regards
>  
> > scripts/package/builddeb script was setting the host machine
> > $arch in the KERNEL/debian/control prior to an invocation of
> > dpkg-gencontrol.  The patch modifies the script to guarantee the
> > correct
> > debian arch for the target is written to the control file instead.
> > 
> > Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
> > ---
> >  .../2.6-stable/KERNEL/scripts/package/builddeb     |   73
> > ++++++++++----------
> >  1 files changed, 37 insertions(+), 36 deletions(-)
> > 
> > diff --git
> > a/kernel-unpatched/2.6-stable/KERNEL/scripts/package/builddeb
> > b/kernel/2.6-stable/KERNEL/scripts/package/builddeb
> > index f6cbc3d..975e39a 100644
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -25,38 +25,7 @@ create_package() {
> >  	chown -R root:root "$pdir"
> >  	chmod -R go-w "$pdir"
> > 
> > -	# Attempt to find the correct Debian architecture
> > -	local forcearch="" debarch=""
> > -	case "$UTS_MACHINE" in
> > -	i386|ia64|alpha)
> > -		debarch="$UTS_MACHINE" ;;
> > -	x86_64)
> > -		debarch=amd64 ;;
> > -	sparc*)
> > -		debarch=sparc ;;
> > -	s390*)
> > -		debarch=s390 ;;
> > -	ppc*)
> > -		debarch=powerpc ;;
> > -	parisc*)
> > -		debarch=hppa ;;
> > -	mips*)
> > -		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
> > -	arm*)
> > -		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
> > -	*)
> > -		echo "" >&2
> > -		echo "** ** **  WARNING  ** ** **" >&2
> > -		echo "" >&2
> > -		echo "Your architecture doesn't have it's equivalent" >&2
> > -		echo "Debian userspace architecture defined!" >&2
> > -		echo "Falling back to using your current userspace instead!" >&2
> > -		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
> > -		echo "" >&2
> > -	esac
> > -	if [ -n "$KBUILD_DEBARCH" ] ; then
> > -		debarch="$KBUILD_DEBARCH"
> > -	fi
> > +	local forcearch=""
> >  	if [ -n "$debarch" ] ; then
> >  		forcearch="-DArchitecture=$debarch"
> >  	fi
> > @@ -66,6 +35,39 @@ create_package() {
> >  	dpkg --build "$pdir" ..
> >  }
> > 
> > +# Attempt to find the correct Debian architecture
> > +case "$UTS_MACHINE" in
> > +i386|ia64|alpha)
> > +	debarch="$UTS_MACHINE" ;;
> > +x86_64)
> > +	debarch=amd64 ;;
> > +sparc*)
> > +	debarch=sparc ;;
> > +s390*)
> > +	debarch=s390 ;;
> > +ppc*)
> > +	debarch=powerpc ;;
> > +parisc*)
> > +	debarch=hppa ;;
> > +mips*)
> > +	debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
> > +arm*)
> > +	debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
> > +*)
> > +	echo "" >&2
> > +	echo "** ** **  WARNING  ** ** **" >&2
> > +	echo "" >&2
> > +	echo "Your architecture doesn't have it's equivalent" >&2
> > +	echo "Debian userspace architecture defined!" >&2
> > +	echo "Falling back to using your current userspace instead!" >&2
> > +	echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
> > +	echo "" >&2
> > +esac
> > +if [ -n "$KBUILD_DEBARCH" ] ; then
> > +	debarch="$KBUILD_DEBARCH"
> > +fi
> > +
> > +
> >  # Some variables and settings used throughout the script
> >  version=$KERNELRELEASE
> >  revision=$(cat .version)
> > @@ -246,15 +248,14 @@ mkdir -p "$destdir"
> >  (cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
> >  (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar
> > -xf -)
> >  rm -f /tmp/files$$ /tmp/objfiles$$
> > -arch=$(dpkg --print-architecture)
> > 
> >  cat <<EOF >> debian/control
> > 
> >  Package: $kernel_headers_packagename
> >  Provides: linux-headers, linux-headers-2.6
> > -Architecture: $arch
> > -Description: Linux kernel headers for $KERNELRELEASE on $arch
> > - This package provides kernel header files for $KERNELRELEASE on $arch
> > +Architecture: $debarch
> > +Description: Linux kernel headers for $KERNELRELEASE on $debarch
> > + This package provides kernel header files for $KERNELRELEASE on
> > $debarch
> >   .
> >   This is useful for people who need to build external modules
> >  EOF
> > ---
> -- 
> maks
