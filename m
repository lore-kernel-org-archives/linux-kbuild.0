Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:49050 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752327AbYEJVJb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 May 2008 17:09:31 -0400
Date: Sat, 10 May 2008 23:10:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: add support for K=file
Message-ID: <20080510211007.GA32242@uranus.ravnborg.org>
References: <20080502204729.GA6534@uranus.ravnborg.org> <1209761358-6579-1-git-send-email-sam@ravnborg.org> <E1JuwZh-0004Yv-CP@flower>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1JuwZh-0004Yv-CP@flower>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@flower.upol.cz>
Cc: kbuild list <linux-kbuild@vger.kernel.org>

On Sat, May 10, 2008 at 11:25:49PM +0200, Oleg Verych wrote:
> Sam Ravnborg @ Fri,  2 May 2008 22:49:14 +0200:
> 
> > From: Sam Ravnborg <sam@uranus.ravnborg.org>
> 
> > +defconfig: $(src)/aconf.sh $(obj)/aconf
> > +	$(Q)K=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) \
> > +	$(CONFIG_SHELL) $< alldefconfig $(Kconfig)
> 
> > +# aconf:  Generate simple configurations (all*config, etc)
> 
> > +++ b/scripts/kconfig/aconf.sh
> 
> > +#!/bin/sh
> > +set -e
> > +aconf=scripts/kconfig/aconf
> > +# Find input file
> > +if [ ! -z $K ]; then
> > +	config_file="-i $K";
> > +fi
> > +
> > +case "$1" in
> > +	"allnoconfig")
> > +		$aconf -n $config_file $2
> > +		;;
> > +	"allyesconfig")
> > +		$aconf -y $config_file $2
> > +		;;
> > +	"allmodconfig")
> > +		$aconf -m $config_file $2
> > +		;;
> > +	"alldefconfig")
> > +		$aconf -d $config_file $2
> > +		;;
> > +	"randconfig")
> > +		$aconf -r $config_file $2
> > +		;;
> > +	*)
> > +		echo "$0: unknow command $1"
> > +		exit 1
> > +	;;
> > +esac
> > +
> 
> 
> #!/bin/sh
> set -e
> 
> aconf="$src_tree/scripts/kconfig/aconf -"
> case $1 in
> 	# and typing of "allbalblabla" is a bit easier: "allb"
> 	all[mynd]*)
> 		# add command char using multicores :), yes string
>                 # processing in shell kind of sucks
> 		aconf="${aconf}`echo $1 | sed 's ^all\(.\).* \1 '`"
> 		;;
> 	rand*)
> 		aconf="${aconf}r"
> 		;;
> 	*)      # fix typo and redirect to stderr
> 		echo "$0: unknown command \`$1'" >&2
> 		exit 1
> 	;;
> esac
> 
> # Find input file
> [ "$K" ] && aconf="$aconf -i $K"
> 
> # remove command from parameters
> shift 1
> 
> # execute with all other parameters
> $aconf "$@"
> # end
> 
> What about something like that (not tested)? There are some fixes and i'm
> not sure about if "$K" is empty what to do with "$config_file".

I killed that shell script in a later patch and now
aconf recognize the named option.

But the serie needs to be redone anyway - so lets see what I come up with.

	Sam
