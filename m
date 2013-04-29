Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:48322 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932172Ab3D2UjS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 16:39:18 -0400
Date: Mon, 29 Apr 2013 16:39:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <1367258419.30667.20.camel@gandalf.local.home>
Message-ID: <alpine.DEB.2.02.1304291636380.16617@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>     <20130427153833.GC3355@free.fr>     <alpine.DEB.2.02.1304271325240.12586@oneiric>     <20130427174226.GA25088@free.fr>     <alpine.DEB.2.02.1304271412250.27554@oneiric>     <20130428202854.GC4571@free.fr>
  <alpine.DEB.2.02.1304290645150.16211@oneiric>    <1367244700.28120.6.camel@fedora>    <alpine.DEB.2.02.1304291022320.9234@oneiric>   <1367246499.30667.9.camel@gandalf.local.home>   <alpine.DEB.2.02.1304291056410.13584@oneiric>  <1367248388.30667.13.camel@gandalf.local.home>
  <alpine.DEB.2.02.1304291121180.26536@oneiric> <1367258419.30667.20.camel@gandalf.local.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 29 Apr 2013, Steven Rostedt wrote:

> Can you add this patch and see if it fixes your issue. If so, can I add
> your "tested-by" to this patch?
>
> Thanks,
>
> -- Steve
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 3368939..4606cdf 100644
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -156,7 +156,6 @@ sub read_kconfig {
>
>      my $state = "NONE";
>      my $config;
> -    my @kconfigs;
>
>      my $cont = 0;
>      my $line;
> @@ -190,7 +189,13 @@ sub read_kconfig {
>
>  	# collect any Kconfig sources
>  	if (/^source\s*"(.*)"/) {
> -	    $kconfigs[$#kconfigs+1] = $1;
> +	    my $kconfig = $1;
> +	    # prevent reading twice.
> +	    if (!defined($read_kconfigs{$kconfig})) {
> +		$read_kconfigs{$kconfig} = 1;
> +		read_kconfig($kconfig);
> +	    }
> +	    next;
>  	}
>
>  	# configs found
> @@ -250,14 +255,6 @@ sub read_kconfig {
>  	}
>      }
>      close($kinfile);
> -
> -    # read in any configs that were found.
> -    foreach my $kconfig (@kconfigs) {
> -	if (!defined($read_kconfigs{$kconfig})) {
> -	    $read_kconfigs{$kconfig} = 1;
> -	    read_kconfig($kconfig);
> -	}
> -    }
>  }
>
>  if ($kconfig) {
>

  i'm interested -- should that Kconfig file have been written using a
different structure to avoid this issue? surely there are other
Kconfig files that would have had the same problem, no? i can't
believe this could be restricted to a single example involving
atheros stuff.

rday

p.s.  i'm going to submit at least one patch to reorg the atheros
Kconfig file since it's a bit awkward at the moment -- when you select
some options, other options suddenly appear in arbitrary other
locations. i really hate that.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
