Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e24smtp05.br.ibm.com ([32.104.18.26]:56696 "EHLO
	e24smtp05.br.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932102AbaIEMJg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Sep 2014 08:09:36 -0400
Received: from /spool/local
	by e24smtp05.br.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <cascardo@linux.vnet.ibm.com>;
	Fri, 5 Sep 2014 09:09:34 -0300
Date: Fri, 5 Sep 2014 09:09:25 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] deb-pkg: Add support for powerpc little endian
Message-ID: <20140905120925.GB3846@oc0268524204.ibm.com>
References: <1409894927.11359.26.camel@ale.ozlabs.ibm.com>
 <20140905071344.GA16024@visitor2.iram.es>
 <1409903718.11359.30.camel@ale.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409903718.11359.30.camel@ale.ozlabs.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Gabriel Paubert <paubert@iram.es>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Anton Blanchard <anton@samba.org>, Leann Ogasawara <leann.ogasawara@canonical.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Fri, Sep 05, 2014 at 05:55:18PM +1000, Michael Neuling wrote:
> On Fri, 2014-09-05 at 09:13 +0200, Gabriel Paubert wrote:
> > On Fri, Sep 05, 2014 at 03:28:47PM +1000, Michael Neuling wrote:
> > > The Debian powerpc little endian architecture is called ppc64le.  This
> > 
> > Huh? ppc64le or ppc64el?
> 
> ppc64el.  Commit message is wrong.  Fixed below.
> 
> Mikey
> 
> 

What about ppc64?

Also, I sent that already a month ago. Both linuxppc-dev and Michal
Marek were on cc.

http://marc.info/?l=linux-kernel&m=140744360328562&w=2

Cascardo.

> From: Michael Neuling <mikey@neuling.org>
> 
> deb-pkg: Add support for powerpc little endian
> 
> The Debian powerpc little endian architecture is called ppc64el.  This
> is the default architecture used by Ubuntu for powerpc.
> 
> The below checks the kernel config to see if we are compiling little
> endian and sets the Debian arch appropriately.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 35d5a58..6f4a1af 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -37,7 +37,7 @@ create_package() {
>  	s390*)
>  		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x || true) ;;
>  	ppc*)
> -		debarch=powerpc ;;
> +		debarch=$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo ppc64el || echo powerpc) ;;
>  	parisc*)
>  		debarch=hppa ;;
>  	mips*)
> 
> 
> 
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

